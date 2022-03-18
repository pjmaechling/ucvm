#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=albacore

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_albacore_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_albacore_ge.txt  > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -120.9472    32.8000      0.000  -3816.266    180.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -120.9472    32.8000    100.000  -3816.266    180.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -120.9472    32.8000   1000.000  -3816.266    180.000   albacore   5836.841      0.000   2682.607       none      0.000      0.000      0.000      crust   5836.841      0.000   2682.607
 -120.9472    32.8000  10000.000  -3816.266    180.000   albacore   7108.140   3935.400   2999.656       none      0.000      0.000      0.000      crust   7108.140   3935.400   2999.656
 -120.9472    32.8000  50000.000  -3816.266    180.000   albacore   7273.924   4257.000   3049.749       none      0.000      0.000      0.000      crust   7273.924   4257.000   3049.749
 -121.9472    32.8000      0.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -121.9472    32.8000    100.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -121.9472    32.8000   1000.000      0.000      0.000   albacore   5859.139      0.000   2687.149       none      0.000      0.000      0.000      crust   5859.139      0.000   2687.149
 -121.9472    32.8000  10000.000      0.000      0.000   albacore   7483.623   3991.700   3115.859       none      0.000      0.000      0.000      crust   7483.623   3991.700   3115.859
 -121.9472    32.8000  50000.000      0.000      0.000   albacore   7675.450   4529.600   3178.933       none      0.000      0.000      0.000      crust   7675.450   4529.600   3178.933
 -124.6000    33.0000      0.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -124.6000    33.0000    100.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -124.6000    33.0000   1000.000      0.000      0.000   albacore   8475.267      0.000   3466.310       none      0.000      0.000      0.000      crust   8475.267      0.000   3466.310
 -124.6000    33.0000  10000.000      0.000      0.000   albacore   7958.509   5046.100   3276.319       none      0.000      0.000      0.000      crust   7958.509   5046.100   3276.319
 -124.6000    33.0000  50000.000      0.000      0.000   albacore   7637.493   4523.000   3166.260       none      0.000      0.000      0.000      crust   7637.493   4523.000   3166.260
 -119.7660    34.0000      0.000    387.008    710.100   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -119.7660    34.0000    100.000    387.008    710.100   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -119.7660    34.0000   1000.000    387.008    710.100   albacore   3578.835   2102.600   2331.034       none      0.000      0.000      0.000      crust   3578.835   2102.600   2331.034
 -119.7660    34.0000  10000.000    387.008    710.100   albacore   5506.123   3234.900   2619.158       none      0.000      0.000      0.000      crust   5506.123   3234.900   2619.158
 -119.7660    34.0000  50000.000    387.008    710.100   albacore   7657.578   4498.900   3172.954       none      0.000      0.000      0.000      crust   7657.578   4498.900   3172.954
 -118.5249    33.8028      0.000   -333.000    180.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -118.5249    33.8028    100.000   -333.000    180.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -118.5249    33.8028   1000.000   -333.000    180.000   albacore   3517.219   2066.400   2321.113       none      0.000      0.000      0.000      crust   3517.219   2066.400   2321.113
 -118.5249    33.8028  10000.000   -333.000    180.000   albacore   5304.424   3116.400   2583.846       none      0.000      0.000      0.000      crust   5304.424   3116.400   2583.846
 -118.5249    33.8028  50000.000   -333.000    180.000   albacore   7568.047   4446.300   3143.318       none      0.000      0.000      0.000      crust   7568.047   4446.300   3143.318
 -118.2851    34.0223      0.000     56.230    293.500   albacore   2961.484   1739.900   2215.322       none      0.000      0.000      0.000      crust   2961.484   1739.900   2215.322
 -118.2851    34.0223    100.000     56.230    293.500   albacore   2961.484   1739.900   2215.322       none      0.000      0.000      0.000      crust   2961.484   1739.900   2215.322
 -118.2851    34.0223   1000.000     56.230    293.500   albacore   3027.866   1778.900   2229.901       none      0.000      0.000      0.000      crust   3027.866   1778.900   2229.901
 -118.2851    34.0223  10000.000     56.230    293.500   albacore   5760.757   3384.500   2667.364       none      0.000      0.000      0.000      crust   5760.757   3384.500   2667.364
 -118.2851    34.0223  50000.000     56.230    293.500   albacore   7470.176   4388.800   3111.530       none      0.000      0.000      0.000      crust   7470.176   4388.800   3111.530
 -118.0642    34.2264      0.000   1702.281    710.100   albacore   3463.774   2035.000   2312.281       none      0.000      0.000      0.000      crust   3463.774   2035.000   2312.281
 -118.0642    34.2264    100.000   1702.281    710.100   albacore   3463.774   2035.000   2312.281       none      0.000      0.000      0.000      crust   3463.774   2035.000   2312.281
 -118.0642    34.2264   1000.000   1702.281    710.100   albacore   3520.794   2068.500   2321.696       none      0.000      0.000      0.000      crust   3520.794   2068.500   2321.696
 -118.0642    34.2264  10000.000   1702.281    710.100   albacore   5745.949   3375.800   2664.443       none      0.000      0.000      0.000      crust   5745.949   3375.800   2664.443
 -118.0642    34.2264  50000.000   1702.281    710.100   albacore   7440.049   4371.100   3101.874       none      0.000      0.000      0.000      crust   7440.049   4371.100   3101.874
 -116.5067    33.8231      0.000    126.000    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.5067    33.8231    100.000    126.000    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.5067    33.8231   1000.000    126.000    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.5067    33.8231  10000.000    126.000    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.5067    33.8231  50000.000    126.000    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Elevation coordinates as z mode.
 -120.9472    32.8000      0.000  -3816.266    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.9472    32.8000    100.000  -3816.266    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.9472    32.8000   1000.000  -3816.266    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.9472    32.8000  10000.000  -3816.266    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.9472    32.8000  50000.000  -3816.266    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.9472    32.8000      0.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -121.9472    32.8000    100.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -121.9472    32.8000   1000.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.9472    32.8000  10000.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.9472    32.8000  50000.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -124.6000    33.0000      0.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -124.6000    33.0000    100.000      0.000      0.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -124.6000    33.0000   1000.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -124.6000    33.0000  10000.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -124.6000    33.0000  50000.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -119.7660    34.0000      0.000    387.008    710.100   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -119.7660    34.0000    100.000    387.008    710.100   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -119.7660    34.0000   1000.000    387.008    710.100   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -119.7660    34.0000  10000.000    387.008    710.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -119.7660    34.0000  50000.000    387.008    710.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.5249    33.8028      0.000   -333.000    180.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -118.5249    33.8028    100.000   -333.000    180.000   albacore   1500.000      0.000   1290.000       none      0.000      0.000      0.000      crust   1500.000      0.000   1290.000
 -118.5249    33.8028   1000.000   -333.000    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.5249    33.8028  10000.000   -333.000    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.5249    33.8028  50000.000   -333.000    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.2851    34.0223      0.000     56.230    293.500   albacore   2961.484   1739.900   2215.322       none      0.000      0.000      0.000      crust   2961.484   1739.900   2215.322
 -118.2851    34.0223    100.000     56.230    293.500   albacore   2961.484   1739.900   2215.322       none      0.000      0.000      0.000      crust   2961.484   1739.900   2215.322
 -118.2851    34.0223   1000.000     56.230    293.500   albacore   2961.484   1739.900   2215.322       none      0.000      0.000      0.000      crust   2961.484   1739.900   2215.322
 -118.2851    34.0223  10000.000     56.230    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.2851    34.0223  50000.000     56.230    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0642    34.2264      0.000   1702.281    710.100   albacore   3520.794   2068.500   2321.696       none      0.000      0.000      0.000      crust   3520.794   2068.500   2321.696
 -118.0642    34.2264    100.000   1702.281    710.100   albacore   3520.794   2068.500   2321.696       none      0.000      0.000      0.000      crust   3520.794   2068.500   2321.696
 -118.0642    34.2264   1000.000   1702.281    710.100   albacore   3463.774   2035.000   2312.281       none      0.000      0.000      0.000      crust   3463.774   2035.000   2312.281
 -118.0642    34.2264  10000.000   1702.281    710.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0642    34.2264  50000.000   1702.281    710.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.5067    33.8231      0.000    126.000    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.5067    33.8231    100.000    126.000    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.5067    33.8231   1000.000    126.000    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.5067    33.8231  10000.000    126.000    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -116.5067    33.8231  50000.000    126.000    293.500       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_albacore_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

