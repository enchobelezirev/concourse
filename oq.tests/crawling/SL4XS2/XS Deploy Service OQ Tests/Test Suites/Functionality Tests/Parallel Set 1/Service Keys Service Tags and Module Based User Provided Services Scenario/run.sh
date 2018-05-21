#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Login and Target";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Deploy 1"
bash "Deploy 1/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Deploy 1";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Undeploy"
bash "Undeploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Undeploy";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Delete Space"
bash "Delete Space/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Delete Space";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Keys 1"
bash "List Service Keys 1/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Keys 1";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Tags 1"
bash "List Service Tags 1/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Tags 1";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Deploy 2"
bash "Deploy 2/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Deploy 2";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Keys 2"
bash "List Service Keys 2/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Keys 2";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Tags 2"
bash "List Service Tags 2/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Tags 2";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Deploy 3"
bash "Deploy 3/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/Deploy 3";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Keys 3"
bash "List Service Keys 3/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Keys 3";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Tags 3"
bash "List Service Tags 3/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Service Keys Service Tags and Module Based User Provided Services Scenario/List Service Tags 3";
exit 1; fi
exit $rc;
