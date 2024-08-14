This is README file for ICCAD Problem A, team cada0038
Author: Kai-Hsiang Hu
Group Member: Kai-Hsiang Hu B09901153, Jung-Cheng Lin B09901134, Yi-Xin Lan B09901138
Last Update Date: 2024.8.2

=====
DIRECTORY:
b09901134_b09901138_b09901153/
|-- release/                    // The given test case and our source codes
|   |-- lib/                        // the library file of all the cells
|   |   |-- lib1.json
|   |
|   |-- estimators/                 // currently we have 8 different cost-estimator binaries
|   |   |-- cost_estimator_1
|   |   |-- cost_estimator_2
|   |   |-- cost_estimator_3
|   |   |-- cost_estimator_4
|   |   |-- cost_estimator_5
|   |   |-- cost_estimator_6
|   |   |-- cost_estimator_7
|   |   |-- cost_estimator_8
|   |
|   |-- netlists/                   // 6 different verilog netlists to be optimized
|   |   |-- design1.v
|   |   |-- design2.v
|   |   |-- design3.v
|   |   |-- design4.v
|   |   |-- design5.v
|   |   |-- design6.v
|   |
|   |-- genlibs/                    // The folder to store the genlib files
|   |
|   |-- gates/                      // The folder to store gate information
|   |
|   |-- cost.sh                     // The main bash file to run our project
|   |-- modify.sh                   // modify mapped netlist into standard form (in order to check equivalence easier in abc)
|   |-- eda_final.py                // The python file to generate genlib files
|   |-- README                      // README file of ICCAD contest case 1, NOT README file of our final project
|    
|-- EDA_final_slide.pdf         // The presentation slide
|-- final data.xlsx             // The experimental results
|-- report.pdf                  // The final report
|-- verCore.c                   // a modified file from abc, to read the testbenches    
|-- README.md

=====
PRELIMINARY:

## Need to put our files (release/, verCore.c) in abc-master to run it
file location:

abc/
|-- abc
|-- src/
|   |-- base/
|   |   |-- ver/
|   |   |   |-- verCore.c
| 
|  ... something_else_in_abc ...
|
|-- release/

then type 'make' under abc/

# If there's any Permission denied:
chmod -R 777 /release 

======
HOW TO RUN:

cd release

## To get our optimal mapped netlist and calculate the cost
./cost.sh -cost_function <cost_function_path> -library <lib_path> -netlist <design.v> -output <design_optimized.v>

# for example. if we want to get the optimal mapped netlist from libarary lib1.json and netlist design1.v under estimator cost_estimator_8, we can run:
./cost.sh -cost_function estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design1.v -output netlists/design1_map.v
# then the optimal cost will be print, and the mapped netlist will be store in your <design_optimized.v>:
Minimum cost: cost = 1.651453
Best genlib file: genlibs/genlib2.genlib
Optimized netlist saved to: netlists/design1_map.v


## To simply generate genlibs only:
python3 eda_final.py <cost_function_path> <lib_path>

## To modify the mapped netlist into standard form ,in order to check equivalence directly using cec function in abc
./modify.sh -netlist <design_map.v> -output <design_modify.v>