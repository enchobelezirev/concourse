#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 5/Inject Existing Service Keys Credentials in App Env/With newly created service keys/Deploy"
bash "Deploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 5/Inject Existing Service Keys Credentials in App Env/With newly created service keys/Deploy";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 5/Inject Existing Service Keys Credentials in App Env/With newly created service keys/Validate Injected Service Keys Credentials"
bash "Validate Injected Service Keys Credentials/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 5/Inject Existing Service Keys Credentials in App Env/With newly created service keys/Validate Injected Service Keys Credentials";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 5/Inject Existing Service Keys Credentials in App Env/With newly created service keys/Undeploy"
bash "Undeploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 5/Inject Existing Service Keys Credentials in App Env/With newly created service keys/Undeploy";
exit 1; fi
exit $rc;
