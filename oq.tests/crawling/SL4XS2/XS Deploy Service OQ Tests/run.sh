#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts"
bash "Prepare Deploy Service and Scripts/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites"
bash "Test Suites/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite"
bash "Sequential Test Suite/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Clean Up"
bash "Clean Up/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Clean Up";
exit 1; fi
exit $rc;
