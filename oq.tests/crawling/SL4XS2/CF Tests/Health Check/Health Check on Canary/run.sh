#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/Health Check/Health Check on Canary/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Health Check/Health Check on Canary/Login and Target";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Health Check/Health Check on Canary/Deploy with auto abort"
bash "Deploy with auto abort/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Health Check/Health Check on Canary/Deploy with auto abort";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Health Check/Health Check on Canary/Undeploy"
bash "Undeploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Health Check/Health Check on Canary/Undeploy";
exit 1; fi
exit $rc;
