#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Plugins Scenario"
bash "Plugins Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Plugins Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Circular Dependencies Scenario"
bash "Circular Dependencies Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Circular Dependencies Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Inject Existing Service Keys Credentials in App Env"
bash "Inject Existing Service Keys Credentials in App Env/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Inject Existing Service Keys Credentials in App Env";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Blue Green with Content Change"
bash "Blue Green with Content Change/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Blue Green with Content Change";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Unauthorized space access"
bash "Unauthorized space access/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Unauthorized space access";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Service tags scenario"
bash "Service tags scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Service tags scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Space-Scoped Service Broker Scenario"
bash "Space-Scoped Service Broker Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Space-Scoped Service Broker Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/White-listing Scenario"
bash "White-listing Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/White-listing Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Update Services Scenario"
bash "Update Services Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Update Services Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Update Service Plan Scenario"
bash "Update Service Plan Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Update Service Plan Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Service Alternatives Scenario"
bash "Service Alternatives Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Service Alternatives Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Optional MTA Resources"
bash "Optional MTA Resources/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Optional MTA Resources";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Special characters in org and space"
bash "Special characters in org and space/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Special characters in org and space";
exit 1; fi
exit $rc;
