#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/Java Sample Application Scenario/Miscellaneous tests/Abort a failed deployment/Attempt to deploy and abort failed deployment"
bash "Attempt to deploy and abort failed deployment/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/Java Sample Application Scenario/Miscellaneous tests/Abort a failed deployment/Attempt to deploy and abort failed deployment";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/Java Sample Application Scenario/Miscellaneous tests/Abort a failed deployment/Undeploy"
bash "Undeploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Execute OQ Tests/Java Sample Application Scenario/Miscellaneous tests/Abort a failed deployment/Undeploy";
exit 1; fi
exit $rc;
