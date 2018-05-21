#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Only async services/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Only async services/Login and Target";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Only async services/Deploy"
bash "Deploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Only async services/Deploy";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Only async services/Undeploy"
bash "Undeploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Only async services/Undeploy";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Only async services/Delete Space"
bash "Delete Space/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Only async services/Delete Space";
exit 1; fi
exit $rc;
