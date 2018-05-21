#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Prepare/Download"
bash "Download/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Prepare/Download";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Prepare/Extract deployment descriptor"
bash "Extract deployment descriptor/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Prepare/Extract deployment descriptor";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Prepare/Prepare extension descriptor"
bash "Prepare extension descriptor/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Prepare/Prepare extension descriptor";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Prepare/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Prepare/Login and Target";
exit 1; fi
exit $rc;
