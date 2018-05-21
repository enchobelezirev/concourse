#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Execute OQ Tests With File System Service/Java Sample Application Scenario"
bash "Java Sample Application Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Execute OQ Tests With File System Service/Java Sample Application Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Execute OQ Tests With File System Service/NodeJS Sample Application Scenario"
bash "NodeJS Sample Application Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Execute OQ Tests With File System Service/NodeJS Sample Application Scenario";
exit 1; fi
exit $rc;
