#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Components Acceptance Tests/Clean Up Required Content/Remove SAP UI5 Content"
bash "Remove SAP UI5 Content/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests/OQ Tests/Test Suites/Components Acceptance Tests/Clean Up Required Content/Remove SAP UI5 Content";
exit 1; fi
exit $rc;
