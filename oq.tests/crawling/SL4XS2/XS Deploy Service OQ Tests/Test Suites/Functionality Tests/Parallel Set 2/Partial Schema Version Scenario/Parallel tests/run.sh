#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR (Quoted)"
bash "MAJOR (Quoted)/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR (Quoted)";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR.MINOR (Quoted)"
bash "MAJOR.MINOR (Quoted)/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR.MINOR (Quoted)";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR"
bash "MAJOR/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR.MINOR"
bash "MAJOR.MINOR/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR.MINOR";
exit 1; fi
exit $rc;
