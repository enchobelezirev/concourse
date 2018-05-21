#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/Inject Existing Service Keys Credentials in App Env/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/Inject Existing Service Keys Credentials in App Env/Login and Target";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/Inject Existing Service Keys Credentials in App Env/Not found service keys"
bash "Not found service keys/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/Inject Existing Service Keys Credentials in App Env/Not found service keys";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/Inject Existing Service Keys Credentials in App Env/With Existing service keys"
bash "With Existing service keys/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/Inject Existing Service Keys Credentials in App Env/With Existing service keys";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/Inject Existing Service Keys Credentials in App Env/Delete Space"
bash "Delete Space/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Functionality Tests/Inject Existing Service Keys Credentials in App Env/Delete Space";
exit 1; fi
exit $rc;
