#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/White-listing Scenario/Visibility in current org and space/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/White-listing Scenario/Visibility in current org and space/Login and Target";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/White-listing Scenario/Visibility in current org and space/Deploy"
bash "Deploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/White-listing Scenario/Visibility in current org and space/Deploy";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/White-listing Scenario/Visibility in current org and space/Delete Space"
bash "Delete Space/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/White-listing Scenario/Visibility in current org and space/Delete Space";
exit 1; fi
exit $rc;
