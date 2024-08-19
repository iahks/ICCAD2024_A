#!/bin/bash
if [ "$#" -ne 4 ]; then
    echo "Usage: ./modify.sh -netlist <design_map.v> -output <design_modify.v>"
    exit 1
fi

input_file=""     # choose your mapped .v file to be modified into standard form
middle_file="temp.v"
output_file=""

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -netlist) input_file="$2"; shift ;;
        -output) output_file="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done



sed -E 's/(or|and|not|xor|nand|nor|xnor|buf)_[0-9]+/\1/g' $input_file | \
sed -E 's/(\.A|\.[A-Z])\(([a-zA-Z0-9_]+)\)/\2/g' | \
sed -E 's/(g[0-9]+)/\1 /g'  > $middle_file

sed -E 's/(or|and|nand|nor|xor|xnor|not) ([^,]+)\(([^,]+), ([^,]+), ([^,]+)\)/\1 \2( \5 , \4 , \3 )/;
        s/(buf|not) ([^,]+)\(([^,]+), ([^,]+)\)/\1 \2( \4 , \3 )/' $middle_file > $output_file

rm $middle_file

echo "Modified netlist saved to $output_file"
