import json

gate_params =  ['area', 'power', 'input_load', 'max_load', 'rise_block_delay', 'rise_fanout_delay', 'fall_block_delay', 'fall_fanout_delay']

def parse_genlib(genlib_file): 
    with open(genlib_file, "r") as f:
        infile = f.read().splitlines()

    genlib =  {}
    for i in infile: 
        ls = i.split(' ')
        if (ls[0] == "GATE"): 
            n = ls[1]
            genlib[n] = {gate_params[0]: float(ls[2]), gate_params[1]: float(ls[3])}
        else: 
            genlib[list(genlib.keys())[-1]].update(dict(zip(gate_params[2:], map(float, ls[6:12]))))
    return genlib

def get_init_params(gates, genlib, n): 
    d = {}
    for gate in gates:
        for param in gate_params:
            d[f'{gate}_{param}'] = genlib[gate][param]
    with open("opentuner_init" + n + ".json", "w") as outfile: 
        json.dump(d, outfile)
    return d

for genlib_file in ["./genlibs/genlib1.genlib", "./genlibs/genlib1.genlib", "./genlibs/genlib1.genlib"]: 
    n = genlib_file.split('genlib')[2][:-1]
    genlib = parse_genlib(genlib_file)
    gates = list(genlib)
    get_init_params(gates, genlib, n)