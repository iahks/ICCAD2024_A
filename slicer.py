gates = []
names = []
initial_inputs = []
# gate_type = ['and', 'or', 'nand', 'nor', 'not', 'buf', 'xor', 'xnor']

netlist = "./netlists/design6.v"

with open(netlist, 'r') as f:
    infile = f.read().splitlines()

input_done = True
for l in infile: 
    if l.find("module") != -1 and l.find("//") == -1 and l.find("endmodule") == -1: 
        module_name = l.split(' ')[1]
        continue
    elif l.find("input") != -1 or not input_done: 
        if not input_done: 
            inputs = l.replace(" ", "").split(',')
        else: 
            input_done = False
            inputs = l.replace(" ", "").split("input")[1].split(',')
        initial_inputs.extend(inputs[:-1])
        try: 
            if inputs[-1][-1] == ';': 
                input_done = True
                initial_inputs.append(inputs[-1][:-1])
        except: 
            pass
        continue
    g = l.split('(')
    if len(g) > 1: 
        name = list(filter(lambda x: x != '', g[0].split(' ')))
        nodes = g[1].split(')')[0].replace(" ", "").split(',')
        if len(nodes) <= 3 and len(initial_inputs) != 0: 
            gates.append(nodes)
            names.append(name)

gates_i_want = []
gates_init = gates.copy()

# set the outputs you want here
nodes = ["n8861"]
nodes_init = nodes.copy()
used_node = []
used_init = set()

while len(nodes) > 0: 
    # print(nodes)
    if nodes[0] in initial_inputs: 
        used_init.add(nodes[0])
        nodes.remove(nodes[0])
        continue
    if nodes[0] in used_node: 
        nodes.remove(nodes[0])
        continue
    for g in gates: 
        if g[0] == nodes[0]: 
            gates_i_want.append(g)
            for n in g[1:]: 
                nodes.append(n) if n not in nodes else nodes
            gates.remove(g)
            used_node.append(nodes[0])
            nodes.remove(nodes[0])
            break

with open(netlist.split('.v')[0] + "_sub.v", 'w') as file:
    file.write(f"module {module_name}\n")
    file.write(f"( {' , '.join(used_init)} , {' , '.join(nodes_init)} );\n")
    file.write(f"    input {' , '.join(used_init)} ;\n")
    file.write(f"    output {' , '.join(nodes_init)} ;\n")
    file.write(f"    wire {' , '.join(filter(lambda x: x not in nodes_init, used_node))} ;\n")
    for g in gates_i_want: 
        file.write(f"    {' '.join(names[gates_init.index(g)])} ( {' , '.join(g)} );\n")
    file.write("endmodule")