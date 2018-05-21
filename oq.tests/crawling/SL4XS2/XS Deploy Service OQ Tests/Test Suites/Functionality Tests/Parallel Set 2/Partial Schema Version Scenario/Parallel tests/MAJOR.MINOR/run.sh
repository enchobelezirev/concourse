#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR.MINOR/Deploy"
bash "Deploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR.MINOR/Deploy";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR.MINOR/List MTA components"
bash "List MTA components/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR.MINOR/List MTA components";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR.MINOR/Undeploy"
bash "Undeploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR.MINOR/Undeploy";
exit 1; fi
exit $rc;
