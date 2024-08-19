import random, math
import subprocess
import sys
import time

# def print_dict(d): 
#     for i in d: 
#         print(i, d[i])

# argument settings

start_time = time.time()
time_limit = 600 # * 60

if len(sys.argv) != 8:
    print("Usage: SA_on_Techmap.py <estimator> <lib_file> <genlib_file> <min_cost> <output.v> <area_only> <deepsyn>")
    sys.exit(1)

e = sys.argv[1]
lib = sys.argv[2]
best_genlib = sys.argv[3]
arg = sys.argv[4]
min_cost = float(arg.split('=')[1].strip())
output_v = sys.argv[5]
area_only = sys.argv[6]
deepsyn = sys.argv[7]

# print(area_only)
# print(deepsyn)

# parsor: genlib to dictionary

with open(best_genlib, "r") as f:
    infile = f.read().splitlines()

genlib =  {}
for i in infile: 
    ls = i.split(' ')
    if (ls[0] == "GATE"): 
        genlib[ls[1]] = [float(ls[2])]
    else: 
        genlib[list(genlib.keys())[-1]].extend(map(float, ls[8:12]))

def get_neighbor(input, step = 0.1): 
        return round(input + input * step * (-1)**(random.randint(0, 1)), 6)

best, best_val = genlib.copy(), min_cost
genlib_val = best_val
temp = min_cost

if(area_only=="False" and deepsyn=="False"):
    with open(f'./map1.script', 'w') as file:
        file.write("""read_library ./genlibs/genlib_neighbor.genlib
read_verilog temp.aig
strash
choice
map
choice
map
choice
map
choice
map
choice
map
write_verilog ./netlists/mapped_neighbor_design.v""")
elif(area_only=="True" and deepsyn=="False"):
    with open(f'./map1.script', 'w') as file:
        file.write("""read_library ./genlibs/genlib_neighbor.genlib
read_verilog temp.aig
strash
choice
map -a
choice
map -a
choice
map -a
choice
map -a
choice
map -a
write_verilog ./netlists/mapped_neighbor_design.v""")
elif(area_only=="False" and deepsyn=="True"):
    with open(f'./map1.script', 'w') as file:
        file.write("""read_library ./genlibs/genlib_neighbor.genlib
read_verilog dsyn_temp.aig
strash
choice
map 
choice
map 
choice
map 
choice
map 
choice
map 
write_verilog ./netlists/mapped_neighbor_design.v""")
else:
    with open(f'./map1.script', 'w') as file:
        file.write("""read_library ./genlibs/genlib_neighbor.genlib
read_verilog dsyn_temp.aig
strash
choice
map -a
choice
map -a
choice
map -a
choice
map -a
choice
map -a
write_verilog ./netlists/mapped_neighbor_design.v""")

s = 0
while time.time() - start_time < time_limit:
    t = temp / float(s + 1)
    s += 1

    # making a step

    r = random.randint(0, len(genlib) * 5 - 1)
    gc = list(genlib.keys())[r // 5]    # gate changed
    n = get_neighbor(genlib[gc][r % 5])
    genlib_n = genlib.copy()    # neighbor genlib
    genlib_n[gc][r % 5] = n

    # write a new genlib

    with open(f'./genlibs/genlib_neighbor.genlib', 'w') as file:
        for g in genlib_n: 
            if g.split('_')[0] == 'and':
                file.write(f'GATE {g} {genlib_n[g][0]} Y=A*B; \n PIN *   NONINV 1 999 {genlib_n[g][1]} {genlib_n[g][2]} {genlib_n[g][3]} {genlib_n[g][4]} \n')
            elif g.split('_')[0] == 'or':
                file.write(f'GATE {g} {genlib_n[g][0]} Y=A+B; \n PIN *   NONINV 1 999 {genlib_n[g][1]} {genlib_n[g][2]} {genlib_n[g][3]} {genlib_n[g][4]} \n')
            elif g.split('_')[0] == 'nand':
                file.write(f'GATE {g} {genlib_n[g][0]} Y=!(A*B); \n PIN *   INV 1 999 {genlib_n[g][1]} {genlib_n[g][2]} {genlib_n[g][3]} {genlib_n[g][4]} \n')
            elif g.split('_')[0] == 'nor':
                file.write(f'GATE {g} {genlib_n[g][0]} Y=!(A+B); \n PIN *   INV 1 999 {genlib_n[g][1]} {genlib_n[g][2]} {genlib_n[g][3]} {genlib_n[g][4]} \n')
            elif g.split('_')[0] == 'not':
                file.write(f'GATE {g} {genlib_n[g][0]} Y=!A; \n PIN *   INV 1 999 {genlib_n[g][1]} {genlib_n[g][2]} {genlib_n[g][3]} {genlib_n[g][4]} \n')
            elif g.split('_')[0] == 'buf':
                file.write(f'GATE {g} {genlib_n[g][0]} Y=A; \n PIN *   NONINV 1 999 {genlib_n[g][1]} {genlib_n[g][2]} {genlib_n[g][3]} {genlib_n[g][4]} \n')
            elif g.split('_')[0] == 'xor':
                file.write(f'GATE {g} {genlib_n[g][0]} Y=!A*B+A*!B; \n PIN *   UNKNOWN 1 999 {genlib_n[g][1]} {genlib_n[g][2]} {genlib_n[g][3]} {genlib_n[g][4]} \n')
            elif g.split('_')[0] == 'xnor':
                file.write(f'GATE {g} {genlib_n[g][0]} Y=!A*!B+A*B; \n PIN *   UNKNOWN 1 999 {genlib_n[g][1]} {genlib_n[g][2]} {genlib_n[g][3]} {genlib_n[g][4]} \n')

    # run abc and cost estimator


    output = subprocess.check_output(["./abc", "-f", "./map1.script"])
    output = subprocess.check_output(["./replace.sh", "-netlist", "./netlists/mapped_neighbor_design.v"])
    output = subprocess.check_output([e, "-library", lib, "-netlist", "./netlists/mapped_neighbor_design.v", "-output", "./design.out"])
    o = float(output.decode().split(' ')[2][:-1])

    # decide to move or stay

    if o < best_val or random.random() < math.exp((genlib_val - o) / t): 
        genlib.clear()
        genlib = genlib_n
        genlib_val = o
        if o < best_val: 
            with open('./netlists/mapped_neighbor_design.v', 'r') as source_file:
                content = source_file.read()
            with open(output_v, 'w') as destination_file:
                destination_file.write(content)

            print("Step:", s, "Cost:", o, gc, r%5, n)
            best.clear()
            best = genlib_n
            best_val = o
    if s % 10 == 0: 
        print("Step:", s, best_val, genlib_val)