#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Login and Target";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Blue Green Deploy MTA Version 3.0.0"
bash "Blue Green Deploy MTA Version 3.0.0/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Blue Green Deploy MTA Version 3.0.0";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Blue Green Deploy MTA Version 3.1.0 _ABORT_"
bash "Blue Green Deploy MTA Version 3.1.0 _ABORT_/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Blue Green Deploy MTA Version 3.1.0 _ABORT_";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Blue Green Deploy MTA Version 3.1.0"
bash "Blue Green Deploy MTA Version 3.1.0/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Blue Green Deploy MTA Version 3.1.0";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Undeploy MTA"
bash "Undeploy MTA/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Undeploy MTA";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Delete Space"
bash "Delete Space/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 4/Failed Update Scenario/Delete Space";
exit 1; fi
exit $rc;
