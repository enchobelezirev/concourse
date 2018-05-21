#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Space-Scoped Service Broker Scenario/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Space-Scoped Service Broker Scenario/Login and Target";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Space-Scoped Service Broker Scenario/Deploy"
bash "Deploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Space-Scoped Service Broker Scenario/Deploy";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Space-Scoped Service Broker Scenario/Undeploy"
bash "Undeploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Space-Scoped Service Broker Scenario/Undeploy";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Space-Scoped Service Broker Scenario/Delete Space"
bash "Delete Space/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Space-Scoped Service Broker Scenario/Delete Space";
exit 1; fi
exit $rc;
