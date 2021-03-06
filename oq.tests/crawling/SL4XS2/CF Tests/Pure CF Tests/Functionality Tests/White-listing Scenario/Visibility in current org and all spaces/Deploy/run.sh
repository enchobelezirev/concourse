#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/White-listing Scenario/Visibility in current org and all spaces/Deploy/Deploy provider"
bash "Deploy provider/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/White-listing Scenario/Visibility in current org and all spaces/Deploy/Deploy provider";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/White-listing Scenario/Visibility in current org and all spaces/Deploy/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/White-listing Scenario/Visibility in current org and all spaces/Deploy/Login and Target";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/White-listing Scenario/Visibility in current org and all spaces/Deploy/Deploy consumer"
bash "Deploy consumer/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/White-listing Scenario/Visibility in current org and all spaces/Deploy/Deploy consumer";
exit 1; fi
exit $rc;
