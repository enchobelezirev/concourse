#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/SAP UI 5 Scenario/Prepare"
bash "Prepare/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/SAP UI 5 Scenario/Prepare";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/SAP UI 5 Scenario/Test"
bash "Test/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/SAP UI 5 Scenario/Test";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/SAP UI 5 Scenario/Deploy in parallel "
bash "Deploy in parallel /run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/SAP UI 5 Scenario/Deploy in parallel ";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/SAP UI 5 Scenario/Delete Space"
bash "Delete Space/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/XSA Components Acceptance Tests/Required Content Extensive Tests/SAP UI 5 Scenario/Delete Space";
exit 1; fi
exit $rc;
