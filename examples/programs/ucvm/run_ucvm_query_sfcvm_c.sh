#!/bin/bash
#
#  ucvm_query_sfcvm_c
#
#    -c ge : query by elevation
#    -c gd : query by depth
#


if [ -z "$UCVM_INSTALL_PATH" ]; then
  echo "Need to set UCVM_INSTALL_PATH to run >" ${0##*/} 
  exit
fi
source $UCVM_INSTALL_PATH/conf/ucvm_env.sh

BIN_DIR=${UCVM_INSTALL_PATH}/bin
CONF_DIR=${UCVM_INSTALL_PATH}/conf
TEST_DIR=${UCVM_INSTALL_PATH}/tests/inputs
MODEL=sfcvm

expect=$(mktemp) || exit 1
result=$(mktemp) || (trap 'rm -f "$expect"'; exit 1)

${BIN_DIR}/ucvm_query -c gd -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_sfcvm_gd.txt  > $result 2>&1
${BIN_DIR}/ucvm_query -c ge -m ${MODEL} -f ${CONF_DIR}/ucvm.conf < ${TEST_DIR}/test_latlons_sfcvm_ge.txt  >> $result 2>&1

cat > $expect << EOF_EXPECTED_RESULT
Using Geo Depth coordinates as z mode.
 -121.9410    37.4550      0.000      1.493    203.485      sfcvm   1800.240    500.080   2015.496       none      0.000      0.000      0.000      crust   1800.240    500.080   2015.496
 -121.7340    37.4790   5000.000    504.404    733.400      sfcvm   5487.782   3294.963   2663.167       none      0.000      0.000      0.000      crust   5487.782   3294.963   2663.167
 -121.5810    37.3810   3000.000    569.260    733.400      sfcvm   5366.372   3228.584   2648.829       none      0.000      0.000      0.000      crust   5366.372   3228.584   2648.829
 -122.2878    37.8661      0.000     21.814    290.260      sfcvm    708.571     80.500   1596.412       none      0.000      0.000      0.000      crust    708.571     80.500   1596.412
 -122.2878    37.8661    500.000     21.814    290.260      sfcvm   3530.000   1881.703   2656.129       none      0.000      0.000      0.000      crust   3530.000   1881.703   2656.129
 -122.2878    37.8661   1000.000     21.814    290.260      sfcvm   4529.317   2692.206   2656.129       none      0.000      0.000      0.000      crust   4529.317   2692.206   2656.129
 -122.2878    37.8661   3000.000     21.814    290.260      sfcvm   5429.492   3263.424   2656.139       none      0.000      0.000      0.000      crust   5429.492   3263.424   2656.139
 -122.2878    37.8661   5000.000     21.814    290.260      sfcvm   5547.601   3326.718   2670.395       none      0.000      0.000      0.000      crust   5547.601   3326.718   2670.395
 -122.1535    37.5291      0.000     -1.000    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -122.1535    37.5291    500.000     -1.000    180.000      sfcvm   3526.290   1878.454   2656.129       none      0.000      0.000      0.000      crust   3526.290   1878.454   2656.129
 -122.1535    37.5291   1000.000     -1.000    180.000      sfcvm   4526.398   2690.095   2656.129       none      0.000      0.000      0.000      crust   4526.398   2690.095   2656.129
 -122.1535    37.5291   3000.000     -1.000    180.000      sfcvm   5429.190   3263.260   2656.129       none      0.000      0.000      0.000      crust   5429.190   3263.260   2656.129
 -122.1535    37.5291   5000.000     -1.000    180.000      sfcvm   5547.494   3326.662   2670.382       none      0.000      0.000      0.000      crust   5547.494   3326.662   2670.382
 -121.4809    36.2370      0.000    252.237    385.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.4809    36.2370    500.000    252.237    385.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.4809    36.2370   1000.000    252.237    385.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.4809    36.2370   3000.000    252.237    385.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.4809    36.2370   5000.000    252.237    385.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.0850    37.2060      0.000    122.967    517.530       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.0850    37.2060    500.000    122.967    517.530       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.0850    37.2060   1000.000    122.967    517.530       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.0850    37.2060   3000.000    122.967    517.530       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.0850    37.2060   5000.000    122.967    517.530       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.8143    36.6509      0.000     43.756    313.533       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.8143    36.6509    500.000     43.756    313.533       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.8143    36.6509   1000.000     43.756    313.533       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.8143    36.6509   3000.000     43.756    313.533       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.8143    36.6509   5000.000     43.756    313.533       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
Using Geo Elevation coordinates as z mode.
 -122.2878    37.8661     21.685     21.814    290.260      sfcvm    712.442     80.524   1598.042       none      0.000      0.000      0.000      crust    712.442     80.524   1598.042
 -122.2878    37.8661   -478.315     21.814    290.260      sfcvm   3530.258   1881.929   2656.129       none      0.000      0.000      0.000      crust   3530.258   1881.929   2656.129
 -122.2878    37.8661   -978.315     21.814    290.260      sfcvm   4529.573   2692.395   2656.129       none      0.000      0.000      0.000      crust   4529.573   2692.395   2656.129
 -122.2878    37.8661  -2978.315     21.814    290.260      sfcvm   5429.549   3263.455   2656.139       none      0.000      0.000      0.000      crust   5429.549   3263.455   2656.139
 -122.2878    37.8661  -4978.315     21.814    290.260      sfcvm   5547.609   3326.722   2670.396       none      0.000      0.000      0.000      crust   5547.609   3326.722   2670.396
 -122.1535    37.5291     -1.000     -1.000    180.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -122.1535    37.5291   -501.000     -1.000    180.000      sfcvm   3526.290   1878.454   2656.129       none      0.000      0.000      0.000      crust   3526.290   1878.454   2656.129
 -122.1535    37.5291  -1001.000     -1.000    180.000      sfcvm   4526.398   2690.095   2656.129       none      0.000      0.000      0.000      crust   4526.398   2690.095   2656.129
 -122.1535    37.5291  -3001.000     -1.000    180.000      sfcvm   5429.190   3263.260   2656.129       none      0.000      0.000      0.000      crust   5429.190   3263.260   2656.129
 -122.1535    37.5291  -5001.000     -1.000    180.000      sfcvm   5547.494   3326.662   2670.382       none      0.000      0.000      0.000      crust   5547.494   3326.662   2670.382
 -121.4809    36.2370    265.969    252.237    385.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.4809    36.2370   -234.031    252.237    385.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.4809    36.2370   -734.031    252.237    385.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.4809    36.2370  -2734.031    252.237    385.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.4809    36.2370  -4734.031    252.237    385.100       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.0850    37.2060    112.967    122.967    517.530       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.0850    37.2060   -387.033    122.967    517.530       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.0850    37.2060   -887.033    122.967    517.530       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.0850    37.2060  -2887.033    122.967    517.530       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -120.0850    37.2060  -4887.033    122.967    517.530       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.8143    36.6509     43.731     43.756    313.533       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.8143    36.6509   -496.269     43.756    313.533       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.8143    36.6509   -956.269     43.756    313.533       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.8143    36.6509  -2956.269     43.756    313.533       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
 -121.8143    36.6509  -4956.269     43.756    313.533       none      0.000      0.000      0.000       none      0.000      0.000      0.000       none      0.000      0.000      0.000
EOF_EXPECTED_RESULT

echo "Running examples_programs_ucvm ucvm_query_sfcvm_c"
if diff $result $expect > /dev/null 2>&1
then
  echo [SUCCESS]
else
  echo [FAILURE]
fi

trap 'rm -f "$expect" "$result"' exit

