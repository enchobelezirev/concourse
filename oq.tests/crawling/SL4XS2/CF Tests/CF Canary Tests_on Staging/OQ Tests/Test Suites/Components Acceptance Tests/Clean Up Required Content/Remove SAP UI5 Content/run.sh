#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Clean Up Required Content/Remove SAP UI5 Content/Undeploy"
bash "Undeploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Clean Up Required Content/Remove SAP UI5 Content/Undeploy";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Clean Up Required Content/Remove SAP UI5 Content/Delete test files"
bash "Delete test files/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Clean Up Required Content/Remove SAP UI5 Content/Delete test files";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Clean Up Required Content/Remove SAP UI5 Content/Delete Space"
bash "Delete Space/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Clean Up Required Content/Remove SAP UI5 Content/Delete Space";
exit 1; fi
exit $rc;
