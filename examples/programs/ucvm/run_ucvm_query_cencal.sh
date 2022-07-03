#!/bin/bash

if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=cencal

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_cencal_gd.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as default mode.
 -118.0000    34.0000      0.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000     50.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    100.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000    500.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -118.0000    34.0000   1000.000    284.191    580.043       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Depth coordinates as default mode.
 -122.2878    37.8661      0.000     21.814    290.260     cencal   1080.000    110.000   1770.000       none      0.000      0.000      0.000      crust   1080.000    110.000   1770.000
 -122.2878    37.8661    500.000     21.814    290.260     cencal   3550.000   1900.000   2660.000       none      0.000      0.000      0.000      crust   3550.000   1900.000   2660.000
 -122.2878    37.8661   1000.000     21.814    290.260     cencal   4530.000   2690.000   2660.000       none      0.000      0.000      0.000      crust   4530.000   2690.000   2660.000
 -122.2878    37.8661   3000.000     21.814    290.260     cencal   5430.000   3260.000   2660.000       none      0.000      0.000      0.000      crust   5430.000   3260.000   2660.000
 -122.2878    37.8661   5000.000     21.814    290.260     cencal   5550.000   3330.000   2670.000       none      0.000      0.000      0.000      crust   5550.000   3330.000   2670.000
 -122.1535    37.5291      0.000     -1.000    180.000     cencal   1100.000    110.000   1780.000       none      0.000      0.000      0.000      crust   1100.000    110.000   1780.000
 -122.1535    37.5291    500.000     -1.000    180.000     cencal   3580.000   1920.000   2660.000       none      0.000      0.000      0.000      crust   3580.000   1920.000   2660.000
 -122.1535    37.5291   1000.000     -1.000    180.000     cencal   4540.000   2700.000   2660.000       none      0.000      0.000      0.000      crust   4540.000   2700.000   2660.000
 -122.1535    37.5291   3000.000     -1.000    180.000     cencal   5430.000   3260.000   2660.000       none      0.000      0.000      0.000      crust   5430.000   3260.000   2660.000
 -122.1535    37.5291   5000.000     -1.000    180.000     cencal   5550.000   3330.000   2670.000       none      0.000      0.000      0.000      crust   5550.000   3330.000   2670.000
 -121.4809    36.2370      0.000    252.237    385.100     cencal   1970.000    590.000   2670.000       none      0.000      0.000      0.000      crust   1970.000    590.000   2670.000
 -121.4809    36.2370    500.000    252.237    385.100     cencal   4120.000   2380.000   2670.000       none      0.000      0.000      0.000      crust   4120.000   2380.000   2670.000
 -121.4809    36.2370   1000.000    252.237    385.100     cencal   4770.000   2860.000   2670.000       none      0.000      0.000      0.000      crust   4770.000   2860.000   2670.000
 -121.4809    36.2370   3000.000    252.237    385.100     cencal   5650.000   3380.000   2670.000       none      0.000      0.000      0.000      crust   5650.000   3380.000   2670.000
 -121.4809    36.2370   5000.000    252.237    385.100     cencal   5810.000   3460.000   2700.000       none      0.000      0.000      0.000      crust   5810.000   3460.000   2700.000
 -120.0850    37.2060      0.000    122.967    517.530     cencal   5900.000   3500.000   2880.000       none      0.000      0.000      0.000      crust   5900.000   3500.000   2880.000
 -120.0850    37.2060    500.000    122.967    517.530     cencal   5900.000   3500.000   2880.000       none      0.000      0.000      0.000      crust   5900.000   3500.000   2880.000
 -120.0850    37.2060   1000.000    122.967    517.530     cencal   5900.000   3500.000   2880.000       none      0.000      0.000      0.000      crust   5900.000   3500.000   2880.000
 -120.0850    37.2060   3000.000    122.967    517.530     cencal   5900.000   3500.000   2880.000       none      0.000      0.000      0.000      crust   5900.000   3500.000   2880.000
 -120.0850    37.2060   5000.000    122.967    517.530     cencal   5900.000   3500.000   2880.000       none      0.000      0.000      0.000      crust   5900.000   3500.000   2880.000
 -121.8143    36.6509      0.000     43.756    313.533     cencal    870.000     90.000   1670.000       none      0.000      0.000      0.000      crust    870.000     90.000   1670.000
 -121.8143    36.6509    500.000     43.756    313.533     cencal   2410.000    910.000   2170.000       none      0.000      0.000      0.000      crust   2410.000    910.000   2170.000
 -121.8143    36.6509   1000.000     43.756    313.533     cencal   2860.000   1290.000   2260.000       none      0.000      0.000      0.000      crust   2860.000   1290.000   2260.000
 -121.8143    36.6509   3000.000     43.756    313.533     cencal   5640.000   3380.000   2670.000       none      0.000      0.000      0.000      crust   5640.000   3380.000   2670.000
 -121.8143    36.6509   5000.000     43.756    313.533     cencal   5800.000   3450.000   2700.000       none      0.000      0.000      0.000      crust   5800.000   3450.000   2700.000
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_cencal"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

