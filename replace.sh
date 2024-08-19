#!/bin/bash
#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Usage: ./replace.sh -netlist <netlist.v>"
    exit 1
fi

# File to be modified
file=""
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -netlist) file="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Modify not_nand_{0-9} to nand_{0-9} and add a duplicated input
sed -i -E 's/(not_nand_([0-9]) )([^)]+\(\.A\(([^\)]+)\), )(.Y\([^)]+\)\);)/nand_\2 \3.B(\4), \5/' $file

# Modify not_nor_{0-9} to nor_{0-9} and add a duplicated input
sed -i -E 's/(not_nor_([0-9]) )([^)]+\(\.A\(([^\)]+)\), )(.Y\([^)]+\)\);)/nor_\2 \3.B(\4), \5/' $file