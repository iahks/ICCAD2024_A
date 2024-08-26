import random
import numpy as np
import subprocess
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
        self.gate_params = ['area', 'input_load', 'max_load', 'rise_block_delay', 'rise_fanout_delay', 'fall_block_delay', 'fall_fanout_delay']
        # self.gate_params = ['area'] if args.area_only else ['area', 'input_load', 'max_load', 'rise_block_delay', 'rise_fanout_delay', 'fall_block_delay', 'fall_fanout_delay']

        self.genlib = self.parse_genlib()
        self.gates = list(self.genlib)
        self.init_params = self.get_init_params()
        # print(self.init_params)
        # print(cc)

        self.write_script()

    def manipulator(self): 
        manipulator = ConfigurationManipulator() # seed_config = self.init_params)
        # self.config = manipulator.seed_config()
        for gate in self.gates:
            for param in self.gate_params: 
                fp = FloatParameter(f'{gate}_{param}', self.init_params[f'{gate}_{param}'] / 10, self.init_params[f'{gate}_{param}'] * 10)
                manipulator.add_parameter(fp)
                # fp.set_value(self.config, self.init_params[f'{gate}_{param}'])
        # manipulator.seed_config = self.config
        
        return manipulator
    
    def parse_genlib(self): 
        with open(self.args.genlib, "r") as f:
            infile = f.read().splitlines()

        genlib =  {}
        for i in infile: 
            ls = i.split(' ')
            if (ls[0] == "GATE"): 
                genlib[ls[1]] = {self.gate_params[0]: float(ls[2])}
            else: 
                genlib[list(genlib.keys())[-1]].update(dict(zip(self.gate_params[1:], map(float, ls[6:12]))))
        return genlib
    
    def get_init_params(self): 
        d = {}
        for gate in self.gates:
            for param in self.gate_params:
                d[f'{gate}_{param}'] = self.genlib[gate][param]
        return d
    
    def write_script(self): 
        verilog_file = 'dsyn_temp.aig' if str2bool(self.args.deepsyn) else 'temp.aig'
        map_options = '-a' if str2bool(self.args.area_only) else ''
        with open('./map1.script', 'w') as file:
            file.write(common_script.format(verilog_file=verilog_file, map_options=map_options))
    
    def generate_neighbor_genlib(self, cfg): 
        with open(f'./genlibs/genlib_neighbor.genlib', 'w') as file:
            for g in self.gates: 
                gate_type = g.split('_')[0]
                if gate_type in gate_definitions: 
                    formula, pin_type = gate_definitions[gate_type]
                    prms = [f"{cfg[f'{g}_{p}']}" for p in self.gate_params[1:]]
                    file.write(f"GATE {g} {cfg[f'{g}_{self.gate_params[0]}']} {formula} \n PIN *   {pin_type} {' '.join(prms)} \n")
        
    def run(self, desired_result, input, limit): 
        cfg = desired_result.configuration.data
        self.generate_neighbor_genlib(cfg)

        output = subprocess.check_output(["./abc", "-f", "./map1.script"])
        output = subprocess.check_output(["./replace.sh", "-netlist", "./netlists/mapped_neighbor_design.v"])
        output = subprocess.check_output([self.estimator, "-library", self.lib, "-netlist", "./netlists/mapped_neighbor_design.v", "-output", "./design.out"])
        o = float(output.decode().split(' ')[2][:-1])
        print("o:", o)
        return Result(time=o)
    
    def save_final_config(self, configuration): 
        print("Optimal parameters written to opentuner.json:", configuration.data)
        self.manipulator().save_to_file(configuration.data, 'opentuner.json')
        

def main(args):
    argparser = opentuner.default_argparser()
    argparser.add_argument('--cost_function', type=str, required=True)
    argparser.add_argument('--library', type=str, required=True)
    argparser.add_argument('--genlib', type=str, required=True)
    argparser.add_argument('--min_cost', type=str, required=True)
    argparser.add_argument('--verilog', type=str, required=True)
    argparser.add_argument('--area_only', type=str, required=True)
    argparser.add_argument('--deepsyn', type=str, required=True)
    
    args = argparser.parse_args(args)

    GenlibOpenTuner.main(args)

if __name__ == "__main__": 

    # fixed random seed
    seed = 38
    random.seed(seed)
    np.random.seed(seed)

    parser = argparse.ArgumentParser()
    parser.add_argument('--cost_function', type=str, required=True, help='Path to the cost function')
    parser.add_argument('--library', type=str, required=True, help='Path to the library file')
    parser.add_argument('--genlib', type=str, required=True, help='Path to the initial genlib file')
    parser.add_argument('--min_cost', type=str, required=True, help='Minimum cost of previous result')
    parser.add_argument('--verilog', type=str, required=True, help='Path to the Output verilog file')
    parser.add_argument('--area_only', type=str, required=True, help='Whether to use -a or not')
    parser.add_argument('--deepsyn', type=str, required=True, help='Whether to use deepsyn result or not')
    args = parser.parse_args()

    main(['--cost_function', args.cost_function, 
          '--library', args.library, 
          '--genlib', args.genlib, 
          '--min_cost', args.min_cost, 
          '--verilog', args.verilog, 
          '--area_only', args.area_only, 
          '--deepsyn', args.deepsyn, 
          '--test-limit', '1000', 
          '--no-dups', '--seed-configuration', './opentuner.json'])