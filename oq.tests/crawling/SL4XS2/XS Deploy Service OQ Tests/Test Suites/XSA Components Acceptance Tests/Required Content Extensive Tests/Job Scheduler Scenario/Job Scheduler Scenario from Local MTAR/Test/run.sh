#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/Job Scheduler Scenario/Job Scheduler Scenario from Local MTAR/Test/Deploy 1"
bash "Deploy 1/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/Job Scheduler Scenario/Job Scheduler Scenario from Local MTAR/Test/Deploy 1";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/Job Scheduler Scenario/Job Scheduler Scenario from Local MTAR/Test/Deploy 2"
bash "Deploy 2/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/Job Scheduler Scenario/Job Scheduler Scenario from Local MTAR/Test/Deploy 2";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/Job Scheduler Scenario/Job Scheduler Scenario from Local MTAR/Test/List MTA Components"
bash "List MTA Components/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/Job Scheduler Scenario/Job Scheduler Scenario from Local MTAR/Test/List MTA Components";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/Job Scheduler Scenario/Job Scheduler Scenario from Local MTAR/Test/Undeploy 1"
bash "Undeploy 1/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/Job Scheduler Scenario/Job Scheduler Scenario from Local MTAR/Test/Undeploy 1";
exit 1; fi
exit $rc;
