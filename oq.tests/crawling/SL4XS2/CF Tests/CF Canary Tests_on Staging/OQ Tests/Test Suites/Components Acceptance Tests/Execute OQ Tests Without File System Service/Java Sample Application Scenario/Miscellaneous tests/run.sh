#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Execute OQ Tests Without File System Service/Java Sample Application Scenario/Miscellaneous tests/Download of process logs"
bash "Download of process logs/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Execute OQ Tests Without File System Service/Java Sample Application Scenario/Miscellaneous tests/Download of process logs";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Execute OQ Tests Without File System Service/Java Sample Application Scenario/Miscellaneous tests/Abort a failed deployment"
bash "Abort a failed deployment/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Execute OQ Tests Without File System Service/Java Sample Application Scenario/Miscellaneous tests/Abort a failed deployment";
exit 1; fi
exit $rc;
