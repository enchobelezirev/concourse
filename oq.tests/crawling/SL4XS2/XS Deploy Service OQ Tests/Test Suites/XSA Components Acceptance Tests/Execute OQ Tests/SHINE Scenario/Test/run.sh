#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Test/Deploy 1"
bash "Deploy 1/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Test/Deploy 1";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Test/Deploy 2"
bash "Deploy 2/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Test/Deploy 2";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Test/List MTA components"
bash "List MTA components/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Test/List MTA components";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Test/Undeploy"
bash "Undeploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario/Test/Undeploy";
exit 1; fi
exit $rc;
