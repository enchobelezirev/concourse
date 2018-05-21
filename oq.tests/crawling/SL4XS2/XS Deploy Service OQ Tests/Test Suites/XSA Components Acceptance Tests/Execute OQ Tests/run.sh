#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/Java Sample Application Scenario"
bash "Java Sample Application Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/Java Sample Application Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/NodeJS Sample Application Scenario"
bash "NodeJS Sample Application Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/NodeJS Sample Application Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/DevX Scenario"
bash "DevX Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/DevX Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/XSA Admin Scenario"
bash "XSA Admin Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/XSA Admin Scenario";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario"
bash "SHINE Scenario/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/SHINE Scenario";
exit 1; fi
exit $rc;
