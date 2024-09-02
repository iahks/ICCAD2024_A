import random
import numpy as np
import json
import os, subprocess
import argparse
import opentuner
from opentuner import ConfigurationManipulator
from opentuner import FloatParameter, EnumParameter, IntegerParameter
from opentuner import MeasurementInterface
from opentuner import Result

common_script = """read_library ./genlibs/genlib_neighbor.genlib
read_verilog {verilog_file}
strash
choice
map {map_options}
# choice
# map {map_options}
# choice
# map {map_options}
# choice
# map {map_options}
# choice
# map {map_options}
write_verilog ./netlists/mapped_neighbor_design.v"""

gate_definitions = {
    'and': ('Y=A*B;', 'NONINV'),
    'or': ('Y=A+B;', 'NONINV'),
    'nand': ('Y=!(A*B);', 'INV'),
    'nor': ('Y=!(A+B);', 'INV'),
    'not': ('Y=!A;', 'INV'),
    'buf': ('Y=A;', 'NONINV'),
    'xor': ('Y=!A*B+A*!B;', 'UNKNOWN'),
    'xnor': ('Y=!A*!B+A*B;', 'UNKNOWN')
}

def str2bool(v):
    if isinstance(v, bool):
        return v
    if v.lower() in ('yes', 'true', 't', 'y', '1'):
        return True
    elif v.lower() in ('no', 'false', 'f', 'n', '0'):
        return False
    else:
        raise argparse.ArgumentTypeError('Boolean value expected.')

class GenlibOpenTuner(MeasurementInterface): 
    def __init__(self, *pargs, **kwargs):
        super(GenlibOpenTuner, self).__init__(*pargs, **kwargs)

        self.estimator = self.args.cost_function
        self.lib = self.args.library
        self.gate_params = ['area', 'power', 'input_load', 'max_load', 'rise_block_delay', 'rise_fanout_delay', 'fall_block_delay', 'fall_fanout_delay']
        self.minimum = float("inf")

        self.gates = self.get_gates()
        self.init_params = self.get_init_params()

        self.write_script()

    def manipulator(self): 
        manipulator = ConfigurationManipulator()
        for gate in self.gates:
            for param in self.gate_params: 
                fp = FloatParameter(f'{gate}_{param}', self.init_params[f'{gate}_{param}'] / 10, self.init_params[f'{gate}_{param}'] * 10)
                manipulator.add_parameter(fp)
        
        return manipulator

    def get_gates(self):
        lib_file = open(self.lib, 'r')
        lib = json.loads(lib_file.read())
        # print("lib: ", lib)
        gates =[cell["cell_name"] for cell in lib["cells"]]
        return gates
    
    def get_init_params(self): 
        f = open(self.args.genlib)
        data = json.load(f)
        return data
    
    def write_script(self): 
        verilog_file = 'dsyn_temp_6.aig' if str2bool(self.args.deepsyn) else 'temp.aig'
        map_options = '-a' if str2bool(self.args.area_only) else ''
        with open('./map1.script', 'w') as file:
            file.write(common_script.format(verilog_file=verilog_file, map_options=map_options))
    
    def generate_neighbor_genlib(self, cfg): 
        with open(f'./genlibs/genlib_neighbor.genlib', 'w') as file:
            for g in self.gates: 
                gate_type = g.split('_')[0]
                if gate_type in gate_definitions: 
                    formula, pin_type = gate_definitions[gate_type]
                    prms = [f"{cfg[f'{g}_{p}']}" for p in self.gate_params[2:]]
                    file.write(f"GATE {g} {cfg[f'{g}_{self.gate_params[0]}']} {cfg[f'{g}_{self.gate_params[1]}']} {formula} \n PIN *   {pin_type} {' '.join(prms)} \n")
        
    def run(self, desired_result, input, limit): 
        cfg = desired_result.configuration.data
        self.generate_neighbor_genlib(cfg)

        output = subprocess.check_output(["./abc", "-f", "./map1.script"])
        output = subprocess.check_output(["./replace.sh", "-netlist", "./netlists/mapped_neighbor_design.v"])
        output = subprocess.check_output([self.estimator, "-library", self.lib, "-netlist", "./netlists/mapped_neighbor_design.v", "-output", "./design.out"])
        o = float(output.decode().split(' ')[2][:-1])
        print("o:", o)
        if o < self.minimum: 
            os.rename('./genlibs/genlib_neighbor.genlib', './genlibs/genlib_best_from_opentuner.genlib')
            self.minimum = o
        return Result(time=o)
    
    def save_final_config(self, configuration): 
        print("Optimal parameters written to opentuner.json:", configuration.data)
        self.manipulator().save_to_file(configuration.data, 'opentuner.json')
        

def main(args):
    argparser = opentuner.default_argparser()
    argparser.add_argument('--cost_function', '-cf', type=str, required=True)
    argparser.add_argument('--library', '-l', type=str, required=True)
    argparser.add_argument('--genlib', '-g', type=str, required=True)
    # argparser.add_argument('--min_cost', type=str, required=True)
    argparser.add_argument('--verilog', '-v', type=str, required=True)
    argparser.add_argument('--area_only', '-a', type=str, required=True)
    argparser.add_argument('--deepsyn', type=str, required=True)
    
    args = argparser.parse_args(args)

    GenlibOpenTuner.main(args)

if __name__ == "__main__": 

    # fixed random seed
    seed = 38
    random.seed(seed)
    np.random.seed(seed)

    parser = argparse.ArgumentParser()
    parser.add_argument('--cost_function', '-cf', type=str, required=True, help='Path to the cost function')
    parser.add_argument('--library', '-l', type=str, required=True, help='Path to the library file')
    parser.add_argument('--genlib', '-g', type=str, required=True, help='Path to the initial genlib json file')
    # parser.add_argument('--min_cost', type=str, required=True, help='Minimum cost of previous result')
    parser.add_argument('--verilog', '-v',  type=str, required=True, help='Path to the Output verilog file')
    parser.add_argument('--area_only', '-a', type=str, required=True, help='Whether to use -a or not')
    parser.add_argument('--deepsyn', '-d', type=str, required=True, help='Whether to use deepsyn result or not')
    args = parser.parse_args()

    main(['--cost_function', args.cost_function, 
          '--library', args.library, 
          '--genlib', args.genlib, 
        #   '--min_cost', args.min_cost, 
          '--verilog', args.verilog, 
          '--area_only', args.area_only, 
          '--deepsyn', args.deepsyn, 
          '--test-limit', '1000', 
          '--no-dups', '--seed-configuration', './opentuner_init0.json', '--seed-configuration', './opentuner_init1.json', '--seed-configuration', './opentuner_init2.json']) #, '--technique', 'UniformGreedyMutation05', '--technique', 'UniformGreedyMutation10', '--technique', 'UniformGreedyMutation20'])