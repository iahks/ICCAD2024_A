import subprocess, os
import shutil
import sys
import json
import re

# Read tested Estimators and Gates
if len(sys.argv) != 4:
    print("Usage: eda_final.py <estimator> <lib_file> <netlist>")
    sys.exit(1)

estimator = sys.argv[1]
library = sys.argv[2]

# with open("./estimator.txt", "r") as f:
#   estimators = f.read().splitlines()
# with open("./gate.txt", "r") as f:
#   gates = f.read().splitlines()

netlist_file_path = sys.argv[3]  # Update with the correct path if needed
with open(netlist_file_path, 'r') as file:
    netlist_contents = file.read()

module_name_match = re.search(r'module\s+(\w+)', netlist_contents)
if module_name_match:
    module_name = module_name_match.group(1)
else:
    print("No module name found in the netlist file.")
    sys.exit(1)

lib_file = open(library, 'r')
lib = json.loads(lib_file.read())
gates =[cell["cell_name"] for cell in lib["cells"]]


gates_dir = './gates'
libs_dir = './genlibs'

# Create directories if they do not exist
os.makedirs(gates_dir, exist_ok=True)
os.makedirs(libs_dir, exist_ok=True)

# Clear directories
for folder in [gates_dir, libs_dir]:
    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                os.unlink(file_path)
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path)
        except Exception as e:
            print(f'Failed to delete {file_path}. Reason: {e}')
# Generate testing netlists

for g in gates:
  if g[0:3] == "not" or g[0:3] == "buf":
    parameter = "(a, o)"
    gate = "g0(a,o)"
  else:
    parameter = "(a, b, o)"
    gate = "g0(a,b,o)"

  with open("./gates/case_" + g + ".v", "w") as f:
    f.write(f""" module {module_name} {parameter};\n
      input a, b; output o; """ + g + """ """ + gate + """; endmodule""")

# Initiate dictionary "cost"

cost = {}
for g in gates:
  cost[g] = []

# Run estimators

# for e in estimators:      ## Run all estimators
#   print("Running " + e + ": ")
#   os.chmod(estimator, 0o755)

#   for g in gates:
#     output = subprocess.check_output(["./estimators/" + e, "-library", library, "-netlist", "./gates/case_" + g + ".v", "-output", "./gates/" + g + ".out"])
#     # print(g, output.decode().split(' ')[2][:-1])
#     cost[g].append(float(output.decode().split(' ')[2][:-1]))

for g in gates:
  output = subprocess.check_output([estimator, "-library", library, "-netlist", "./gates/case_" + g + ".v", "-output", "./gates/" + g + ".out"])
  # print(g, output.decode().split(' ')[2][:-1])
  cost[g].append(float(output.decode().split(' ')[2][:-1]))

# print(cost)

import numpy as np
import pandas as pd



data_num = int(lib['information']['attribute_num'])-2
gate_num = len(gates)

attributes = []
data = np.zeros(shape=(gate_num, data_num+1))

for i in range(data_num+1):
    if i < data_num: attributes.append(lib['information']['attributes'][i+2])
    for j in range(gate_num):
        if i < data_num:
          data[j][i] = lib['cells'][j][attributes[i]]
        else:
          data[j][i] = cost[gates[j]][0] # Assume take cost_estimator_1 ## Only for trying all estimators, Only one estimator in this case

attributes.append('cost')
df = pd.DataFrame(np.array(data), columns=attributes)

# print(data)
print(df)

correlation = []

for attr in attributes:
  if attr != 'cost':
    correlation.append(df[attr].corr(df.cost))

print(correlation)

data_chosen = []

for i in range(3):
  data_chosen.append(attributes[correlation.index(sorted(correlation)[-1*(i+1)])])

print(data_chosen)

import itertools

num_genlib = 0
permutations = list(itertools.permutations([0, 1, 2], 3))

for min_corr in range(0, 6, 1):

  min_corr = min_corr / 10

  for perm in permutations:

    with open(f'./genlibs/genlib{num_genlib}.genlib', 'w') as file:

      for i in range(len(gates)):

        g = gates[i]
        cell_area = lib["cells"][i][data_chosen[perm[0]]] if df[data_chosen[perm[0]]].corr(df.cost) > min_corr else 1
        block_delay = lib["cells"][i][data_chosen[perm[1]]] if df[data_chosen[perm[1]]].corr(df.cost) > min_corr else 1
        fanout_delay = lib["cells"][i][data_chosen[perm[2]]] if df[data_chosen[perm[2]]].corr(df.cost) > min_corr else 0.2

        if g.split('_')[0] == 'and':
          file.write(f'GATE {g} {cell_area} Y=A*B; \n PIN *   NONINV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
        elif g.split('_')[0] == 'or':
          file.write(f'GATE {g} {cell_area} Y=A+B; \n PIN *   NONINV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
        elif g.split('_')[0] == 'nand':
          file.write(f'GATE {g} {cell_area} Y=!(A*B); \n PIN *   INV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
        elif g.split('_')[0] == 'nor':
          file.write(f'GATE {g} {cell_area} Y=!(A+B); \n PIN *   INV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
        elif g.split('_')[0] == 'not':
          file.write(f'GATE {g} {cell_area} Y=!A; \n PIN *   INV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
        elif g.split('_')[0] == 'buf':
          file.write(f'GATE {g} {cell_area} Y=A; \n PIN *   NONINV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
        elif g.split('_')[0] == 'xor':
          file.write(f'GATE {g} {cell_area} Y=!A*B+A*!B; \n PIN *   UNKNOWN 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
        elif g.split('_')[0] == 'xnor':
          file.write(f'GATE {g} {cell_area} Y=!A*!B+A*B; \n PIN *   UNKNOWN 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')

      num_genlib += 1

with open(f'./genlibs/genlib{num_genlib}.genlib', 'w') as file:
  for i in range(len(gates)):
    g = gates[i]
    cell_area = lib["cells"][i][data_chosen[perm[0]]]
    if g.split('_')[0] == 'and':
      file.write(f'GATE {g} {cell_area} Y=A*B; \n PIN *   NONINV 1 999 1 0.2 1 0.2 \n')
    elif g.split('_')[0] == 'or':
      file.write(f'GATE {g} {cell_area} Y=A+B; \n PIN *   NONINV 1 999 1 0.2 1 0.2 \n')
    elif g.split('_')[0] == 'nand':
      file.write(f'GATE {g} {cell_area} Y=!(A*B); \n PIN *   INV 1 999 1 0.2 1 0.2 \n')
    elif g.split('_')[0] == 'nor':
      file.write(f'GATE {g} {cell_area} Y=!(A+B); \n PIN *   INV 1 999 1 0.2 1 0.2 \n')
    elif g.split('_')[0] == 'not':
      file.write(f'GATE {g} {cell_area} Y=!A; \n PIN *   INV 1 999 1 0.2 1 0.2 \n')
    elif g.split('_')[0] == 'buf':
      file.write(f'GATE {g} {cell_area} Y=A; \n PIN *   NONINV 1 999 1 0.2 1 0.2 \n')
    elif g.split('_')[0] == 'xor':
      file.write(f'GATE {g} {cell_area} Y=!A*B+A*!B; \n PIN *   UNKNOWN 1 999 1 0.2 1 0.2 \n')
    elif g.split('_')[0] == 'xnor':
      file.write(f'GATE {g} {cell_area} Y=!A*!B+A*B; \n PIN *   UNKNOWN 1 999 1 0.2 1 0.2 \n')
num_genlib += 1

print(f'{num_genlib} genlib flies are generated')

with open(f'./genlibs/genlib{num_genlib}.genlib', 'w') as file:

  for i in range(len(gates)):

    g = gates[i]
    cell_area = cost[g][0] # Assume take cost_estimator_1
    block_delay = 1
    fanout_delay = 0.2

    if g.split('_')[0] == 'and':
      file.write(f'GATE {g} {cell_area} Y=A*B; \n PIN *   NONINV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'or':
      file.write(f'GATE {g} {cell_area} Y=A+B; \n PIN *   NONINV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'nand':
      file.write(f'GATE {g} {cell_area} Y=!(A*B); \n PIN *   INV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'nor':
      file.write(f'GATE {g} {cell_area} Y=!(A+B); \n PIN *   INV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'not':
      file.write(f'GATE {g} {cell_area} Y=!A; \n PIN *   INV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'buf':
      file.write(f'GATE {g} {cell_area} Y=A; \n PIN *   NONINV 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'xor':
      file.write(f'GATE {g} {cell_area} Y=!A*B+A*!B; \n PIN *   UNKNOWN 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'xnor':
      file.write(f'GATE {g} {cell_area} Y=!A*!B+A*B; \n PIN *   UNKNOWN 1 999 {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')

  num_genlib += 1

print(f'genlib flie with single gate cost is generated')

with open(f'./genlibs/genlib{num_genlib}.genlib', 'w') as file:

  for i in range(len(gates)):

    g = gates[i]
    cell_area = cost[g][0]
    block_delay = data[i][1] #+ data[i][0]*data[i][4]
    fanout_delay = data[i][0] * 0.002
    load = data[i][4]
    max_load = data[i][6]

    if g.split('_')[0] == 'and':
      file.write(f'GATE {g} {cell_area} Y=A*B; \n PIN *   NONINV {load} {max_load} {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'or':
      file.write(f'GATE {g} {cell_area} Y=A+B; \n PIN *   NONINV {load} {max_load} {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'nand':
      file.write(f'GATE {g} {cell_area} Y=!(A*B); \n PIN *   INV {load} {max_load} {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'nor':
      file.write(f'GATE {g} {cell_area} Y=!(A+B); \n PIN *   INV {load} {max_load} {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'not':
      file.write(f'GATE {g} {cell_area} Y=!A; \n PIN *   INV {load} {max_load} {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'buf':
      file.write(f'GATE {g} {cell_area} Y=A; \n PIN *   NONINV {load} {max_load} {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'xor':
      file.write(f'GATE {g} {cell_area} Y=!A*B+A*!B; \n PIN *   UNKNOWN {load} {max_load} {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')
    elif g.split('_')[0] == 'xnor':
      file.write(f'GATE {g} {cell_area} Y=!A*!B+A*B; \n PIN *   UNKNOWN {load} {max_load} {block_delay} {fanout_delay} {block_delay} {fanout_delay} \n')

  num_genlib += 1

print(f'genlib flie with data_1 and data_6 is generated')