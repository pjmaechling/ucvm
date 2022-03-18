#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=ivlsu

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_ivlsu_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_ivlsu_ge.txt  > $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -115.8000    32.9000      0.000     13.128    228.200      ivlsu   2754.400   1197.794   2165.403       none      0.000      0.000      0.000      crust   2754.400   1197.794   2165.403
 -115.8000    32.9000   3000.000     13.128    228.200      ivlsu   5153.300   3105.437   2558.892       none      0.000      0.000      0.000      crust   5153.300   3105.437   2558.892
 -115.8000    32.9000   6000.000     13.128    228.200      ivlsu   6178.600   3630.745   2756.117       none      0.000      0.000      0.000      crust   6178.600   3630.745   2756.117
 -115.5000    32.7000      0.000     -0.968    228.200       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -115.5000    32.7000   3000.000     -0.968    228.200       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -115.5000    32.7000   6000.000     -0.968    228.200       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -115.7000    33.2000      0.000    -71.002    180.000      ivlsu   2841.300   1273.127   2187.220       none      0.000      0.000      0.000      crust   2841.300   1273.127   2187.220
 -115.7000    33.2000   3000.000    -71.002    180.000      ivlsu   4609.900   2750.054   2477.536       none      0.000      0.000      0.000      crust   4609.900   2750.054   2477.536
 -115.7000    33.2000   6000.000    -71.002    180.000      ivlsu   5941.400   3522.052   2704.210       none      0.000      0.000      0.000      crust   5941.400   3522.052   2704.210
Using Geo Elevation coordinates as z mode.
 -115.8000    32.9000     13.000     13.128    228.200      ivlsu   2754.400   1197.794   2165.403       none      0.000      0.000      0.000      crust   2754.400   1197.794   2165.403
 -115.8000    32.9000  -2987.000     13.128    228.200      ivlsu   5153.300   3105.437   2558.892       none      0.000      0.000      0.000      crust   5153.300   3105.437   2558.892
 -115.8000    32.9000  -5987.000     13.128    228.200      ivlsu   6178.600   3630.745   2756.117       none      0.000      0.000      0.000      crust   6178.600   3630.745   2756.117
 -115.8000    32.9000     14.000     13.128    228.200      ivlsu   2754.400   1197.794   2165.403       none      0.000      0.000      0.000      crust   2754.400   1197.794   2165.403
 -115.8000    32.9000  -2986.000     13.128    228.200      ivlsu   4313.300   2530.871   2436.515       none      0.000      0.000      0.000      crust   4313.300   2530.871   2436.515
 -115.8000    32.9000  -5986.000     13.128    228.200      ivlsu   6089.700   3590.596   2736.185       none      0.000      0.000      0.000      crust   6089.700   3590.596   2736.185
 -115.5000    32.7000     -1.000     -0.968    228.200       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -115.5000    32.7000  -3001.000     -0.968    228.200       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -115.5000    32.7000  -6001.000     -0.968    228.200       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -115.7000    33.2000    -71.000    -71.002    180.000      ivlsu   2841.300   1273.127   2187.220       none      0.000      0.000      0.000      crust   2841.300   1273.127   2187.220
 -115.7000    33.2000  -3071.000    -71.002    180.000      ivlsu   3881.100   2183.166   2376.495       none      0.000      0.000      0.000      crust   3881.100   2183.166   2376.495
 -115.7000    33.2000  -6071.000    -71.002    180.000      ivlsu   5624.000   3366.406   2640.949       none      0.000      0.000      0.000      crust   5624.000   3366.406   2640.949
 -115.7000    33.2000    -72.000    -71.002    180.000      ivlsu   2841.300   1273.127   2187.220       none      0.000      0.000      0.000      crust   2841.300   1273.127   2187.220
 -115.7000    33.2000  -3072.000    -71.002    180.000      ivlsu   4609.900   2750.054   2477.536       none      0.000      0.000      0.000      crust   4609.900   2750.054   2477.536
 -115.7000    33.2000  -6072.000    -71.002    180.000      ivlsu   5941.400   3522.052   2704.210       none      0.000      0.000      0.000      crust   5941.400   3522.052   2704.210
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_ivlsu_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit
