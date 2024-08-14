#!/bin/bash

# ensure
if [ "$#" -ne 8 ]; then
    echo "Usage: ./cost.sh -cost_function <cost_function_path> -library <lib_path> -netlist <design.v> -output <design_optimized.v>"
    exit 1
fi

cost_function=""
library=""
netlist=""
output=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -cost_function) cost_function="$2"; shift ;;
        -library) library="$2"; shift ;;
        -netlist) netlist="$2"; shift ;;
        -output) output="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# initial
python3 eda_final.py $cost_function $library $netlist
min_cost=99999999
best_genlib=""
best_mapped_netlist=""
best_out=""


    script_aig=$(cat <<EOF
read_verilog ${netlist}
strash
write_verilog temp.aig
EOF
)

echo "$script_aig" > aig.script
../abc -f aig.script

# go through genlibs
for i in {37..38}; do
    ## need to change for different estimators  e.g. lib/genlib7/  for cost_estimator 7
    genlib_file="genlibs/genlib${i}.genlib"   
    mapped_netlist="netlists/mapped_design${i}.v"
    out_file="design1${i}.out"
    
    # map1.script for abc to use
    script_content=$(cat <<EOF
read_library ${genlib_file}
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
# &get
# &choice
# map -a
# &get
# &choice
# map -a
# &get
# &choice
# map -a
# &get
# &choice
# map -a
# &get
# &choice
# map -a
write_verilog ${mapped_netlist}
EOF
)
    # run and print results
    echo "$script_content" > map1.script

    ../abc -f map1.script

    # test in estimators
    cost=$($cost_function -library lib/lib1.json -netlist ${mapped_netlist} -output design.out)
    echo "cost: $cost"

    if (( $(echo "$cost < $min_cost" | bc -l) )); then
        min_cost=$cost
        best_genlib=$genlib_file
        best_mapped_netlist=$mapped_netlist
    fi
done

for i in {76..77}; do
    ## need to change for different estimators  e.g. lib/genlib7/  for cost_estimator 7
    j=$((i-39))
    genlib_file="genlibs/genlib${j}.genlib"   
    mapped_netlist="netlists/mapped_design${i}.v"
    out_file="design1${i}.out"
    
    # map1.script for abc to use
    script_content=$(cat <<EOF
read_library ${genlib_file}
read_verilog temp.aig
strash
&get
&choice
map
&get
&choice
map
&get
&choice
map
&get
&choice
map
&get
&choice
map
write_verilog ${mapped_netlist}
EOF
)
    # run and print results
    echo "$script_content" > map1.script

    ../abc -f map1.script

    # test in estimators
    cost=$($cost_function -library lib/lib1.json -netlist ${mapped_netlist} -output design.out)
    echo "cost: $cost"

    if (( $(echo "$cost < $min_cost" | bc -l) )); then
        min_cost=$cost
        best_genlib=$genlib_file
        best_mapped_netlist=$mapped_netlist
    fi
done


#     script_aig=$(cat <<EOF
# read_verilog ${netlist}
# strash
# &get
# &deepsyn -T 300 -v
# &put
# write_verilog temp.aig
# EOF
# )

# echo "$script_aig" > aig.script
# ../abc -f aig.script

# # go through genlibs
# for i in {37..38}; do
#     ## need to change for different estimators  e.g. lib/genlib7/  for cost_estimator 7
#     genlib_file="genlibs/genlib${i}.genlib"   
#     mapped_netlist="netlists/mapped_design${i}.v"
#     out_file="design1${i}.out"
    
#     # map1.script for abc to use
#     script_content=$(cat <<EOF
# read_library ${genlib_file}
# read_verilog temp.aig
# strash
# &get
# &choice
# map -a
# &get
# &choice
# map -a
# &get
# &choice
# map -a
# &get
# &choice
# map -a
# &get
# &choice
# map -a
# write_verilog ${mapped_netlist}
# EOF
# )
#     # run and print results
#     echo "$script_content" > map1.script

#     ../abc -f map1.script

#     # test in estimators
#     cost=$($cost_function -library lib/lib1.json -netlist ${mapped_netlist} -output design.out)
#     echo "cost: $cost"

#     if (( $(echo "$cost < $min_cost" | bc -l) )); then
#         min_cost=$cost
#         best_genlib=$genlib_file
#         best_mapped_netlist=$mapped_netlist
#     fi
# done

# for i in {76..77}; do
#     ## need to change for different estimators  e.g. lib/genlib7/  for cost_estimator 7
#     j=$((i-39))
#     genlib_file="genlibs/genlib${j}.genlib"   
#     mapped_netlist="netlists/mapped_design${i}.v"
#     out_file="design1${i}.out"
    
#     # map1.script for abc to use
#     script_content=$(cat <<EOF
# read_library ${genlib_file}
# read_verilog temp.aig
# strash
# &get
# &choice
# map 
# &get
# &choice
# map 
# &get
# &choice
# map 
# &get
# &choice
# map 
# &get
# &choice
# map 
# write_verilog ${mapped_netlist}
# EOF
# )
#     # run and print results
#     echo "$script_content" > map1.script

#     ../abc -f map1.script

#     # test in estimators
#     cost=$($cost_function -library lib/lib1.json -netlist ${mapped_netlist} -output design.out)
#     echo "cost: $cost"

#     if (( $(echo "$cost < $min_cost" | bc -l) )); then
#         min_cost=$cost
#         best_genlib=$genlib_file
#         best_mapped_netlist=$mapped_netlist
#     fi
# done

python3 SA_on_TechMap.py "$cost_function" "$library" "$best_genlib" "$min_cost"


cost=$($cost_function -library lib/lib1.json -netlist "best.v" -output design.out)

if (( $(echo "$cost < $min_cost" | bc -l) )); then
    min_cost=$cost
    best_genlib=$genlib_file
    best_mapped_netlist="best.v"
fi


# record best mapped netlist
cp $best_mapped_netlist $output
min_cost=$($cost_function -library lib/lib1.json -netlist $output -output design.out)

# delete unuseful files
rm map1.script
rm aig.script
rm design.out
rm temp.aig
rm best.v
rm ./netlists/mapped_neighbor_design.v
for i in {0..77}; do
rm netlists/mapped_design${i}.v
done
rm $best_mapped_netlist



# print result
echo "Minimum cost: $min_cost"
echo "Best genlib file: $best_genlib"
echo "Optimized netlist saved to: $output"
