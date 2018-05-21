#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash 
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Execute OQ Tests Without File System Service/Java Sample Application Scenario/Delete test files" -v dimitar.donchev@sap.com <<<./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Components Acceptance Tests/Execute OQ Tests Without File System Service/Java Sample Application Scenario/Delete test files;
exit 1; fi
