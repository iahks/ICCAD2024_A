
if [ "$#" -ne 2 ]; then
    echo "Usage: ./check_all.sh -cost_function <cost_function>"
    exit 1
fi

cost_function=""
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -cost_function) cost_function="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

./cada0038 -cost_function $cost_function -library lib/lib1.json -netlist netlists/design1.v -output netlists/design1_map.v
./cada0038 -cost_function $cost_function -library lib/lib1.json -netlist netlists/design2.v -output netlists/design2_map.v
./cada0038 -cost_function $cost_function -library lib/lib1.json -netlist netlists/design3.v -output netlists/design3_map.v
./cada0038 -cost_function $cost_function -library lib/lib1.json -netlist netlists/design4.v -output netlists/design4_map.v
./cada0038 -cost_function $cost_function -library lib/lib1.json -netlist netlists/design5.v -output netlists/design5_map.v
./cada0038 -cost_function $cost_function -library lib/lib1.json -netlist netlists/design6.v -output netlists/design6_map.v

$cost_function -library lib/lib1.json -netlist netlists/design1_map.v -output cf2_ex1.out
$cost_function -library lib/lib1.json -netlist netlists/design2_map.v -output cf2_ex1.out
$cost_function -library lib/lib1.json -netlist netlists/design3_map.v -output cf2_ex1.out
$cost_function -library lib/lib1.json -netlist netlists/design4_map.v -output cf2_ex1.out
$cost_function -library lib/lib1.json -netlist netlists/design5_map.v -output cf2_ex1.out
$cost_function -library lib/lib1.json -netlist netlists/design6_map.v -output cf2_ex1.out

# ./cada0038 -cost_function estimators/cost_estimator_2 -library lib/lib1.json -netlist netlists/design1.v -output netlists/design1_map.v
# ./cada0038 -cost_function estimators/cost_estimator_2 -library lib/lib1.json -netlist netlists/design2.v -output netlists/design2_map.v
# ./cada0038 -cost_function estimators/cost_estimator_2 -library lib/lib1.json -netlist netlists/design3.v -output netlists/design3_map.v
# ./cada0038 -cost_function estimators/cost_estimator_2 -library lib/lib1.json -netlist netlists/design4.v -output netlists/design4_map.v
# ./cada0038 -cost_function estimators/cost_estimator_2 -library lib/lib1.json -netlist netlists/design5.v -output netlists/design5_map.v
# ./cada0038 -cost_function estimators/cost_estimator_2 -library lib/lib1.json -netlist netlists/design6.v -output netlists/design6_map.v

# ./cada0038 -cost_function estimators/cost_estimator_3 -library lib/lib1.json -netlist netlists/design1.v -output netlists/design1_map.v
# ./cada0038 -cost_function estimators/cost_estimator_3 -library lib/lib1.json -netlist netlists/design2.v -output netlists/design2_map.v
# ./cada0038 -cost_function estimators/cost_estimator_3 -library lib/lib1.json -netlist netlists/design3.v -output netlists/design3_map.v
# ./cada0038 -cost_function estimators/cost_estimator_3 -library lib/lib1.json -netlist netlists/design4.v -output netlists/design4_map.v
# ./cada0038 -cost_function estimators/cost_estimator_3 -library lib/lib1.json -netlist netlists/design5.v -output netlists/design5_map.v
# ./cada0038 -cost_function estimators/cost_estimator_3 -library lib/lib1.json -netlist netlists/design6.v -output netlists/design6_map.v

# ./cada0038 -cost_function estimators/cost_estimator_4 -library lib/lib1.json -netlist netlists/design1.v -output netlists/design1_map.v
# ./cada0038 -cost_function estimators/cost_estimator_4 -library lib/lib1.json -netlist netlists/design2.v -output netlists/design2_map.v
# ./cada0038 -cost_function estimators/cost_estimator_4 -library lib/lib1.json -netlist netlists/design3.v -output netlists/design3_map.v
# ./cada0038 -cost_function estimators/cost_estimator_4 -library lib/lib1.json -netlist netlists/design4.v -output netlists/design4_map.v
# ./cada0038 -cost_function estimators/cost_estimator_4 -library lib/lib1.json -netlist netlists/design5.v -output netlists/design5_map.v
# ./cada0038 -cost_function estimators/cost_estimator_4 -library lib/lib1.json -netlist netlists/design6.v -output netlists/design6_map.v

# ./cada0038 -cost_function estimators/cost_estimator_5 -library lib/lib1.json -netlist netlists/design1.v -output netlists/design1_map.v
# ./cada0038 -cost_function estimators/cost_estimator_5 -library lib/lib1.json -netlist netlists/design2.v -output netlists/design2_map.v
# ./cada0038 -cost_function estimators/cost_estimator_5 -library lib/lib1.json -netlist netlists/design3.v -output netlists/design3_map.v
# ./cada0038 -cost_function estimators/cost_estimator_5 -library lib/lib1.json -netlist netlists/design4.v -output netlists/design4_map.v
# ./cada0038 -cost_function estimators/cost_estimator_5 -library lib/lib1.json -netlist netlists/design5.v -output netlists/design5_map.v
# ./cada0038 -cost_function estimators/cost_estimator_5 -library lib/lib1.json -netlist netlists/design6.v -output netlists/design6_map.v

# ./cada0038 -cost_function estimators/cost_estimator_6 -library lib/lib1.json -netlist netlists/design1.v -output netlists/design1_map.v
# ./cada0038 -cost_function estimators/cost_estimator_6 -library lib/lib1.json -netlist netlists/design2.v -output netlists/design2_map.v
# ./cada0038 -cost_function estimators/cost_estimator_6 -library lib/lib1.json -netlist netlists/design3.v -output netlists/design3_map.v
# ./cada0038 -cost_function estimators/cost_estimator_6 -library lib/lib1.json -netlist netlists/design4.v -output netlists/design4_map.v
# ./cada0038 -cost_function estimators/cost_estimator_6 -library lib/lib1.json -netlist netlists/design5.v -output netlists/design5_map.v
# ./cada0038 -cost_function estimators/cost_estimator_6 -library lib/lib1.json -netlist netlists/design6.v -output netlists/design6_map.v

# ./cada0038 -cost_function estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design1.v -output netlists/design1_map.v
# ./cada0038 -cost_function estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design2.v -output netlists/design2_map.v
# ./cada0038 -cost_function estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design3.v -output netlists/design3_map.v
# ./cada0038 -cost_function estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design4.v -output netlists/design4_map.v
# ./cada0038 -cost_function estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design5.v -output netlists/design5_map.v
# ./cada0038 -cost_function estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design6.v -output netlists/design6_map.v

# ./estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design1_map.v -output cf2_ex1.out
# ./estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design2_map.v -output cf2_ex1.out
# ./estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design3_map.v -output cf2_ex1.out
# ./estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design4_map.v -output cf2_ex1.out
# ./estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design5_map.v -output cf2_ex1.out
# ./estimators/cost_estimator_7 -library lib/lib1.json -netlist netlists/design6_map.v -output cf2_ex1.out

# ./cada0038 -cost_function estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design1.v -output netlists/design1_map.v
# ./cada0038 -cost_function estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design2.v -output netlists/design2_map.v
# ./cada0038 -cost_function estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design3.v -output netlists/design3_map.v
# ./cada0038 -cost_function estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design4.v -output netlists/design4_map.v
# ./cada0038 -cost_function estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design5.v -output netlists/design5_map.v
# ./cada0038 -cost_function estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design6.v -output netlists/design6_map.v

# ./estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design1_map.v -output cf2_ex1.out
# ./estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design2_map.v -output cf2_ex1.out
# ./estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design3_map.v -output cf2_ex1.out
# ./estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design4_map.v -output cf2_ex1.out
# ./estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design5_map.v -output cf2_ex1.out
# ./estimators/cost_estimator_8 -library lib/lib1.json -netlist netlists/design6_map.v -output cf2_ex1.out
