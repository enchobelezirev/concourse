#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/Prepare"
bash "Prepare/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/Prepare";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/SAP UI 5"
bash "SAP UI 5/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/SAP UI 5";
exit 1; fi
exit $rc;
