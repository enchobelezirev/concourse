#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/SAP UI 5/Download"
bash "Download/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/SAP UI 5/Download";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/SAP UI 5/Extract Deployment Descriptor"
bash "Extract Deployment Descriptor/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/SAP UI 5/Extract Deployment Descriptor";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/SAP UI 5/Deploy"
bash "Deploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/SAP UI 5/Deploy";
exit 1; fi
exit $rc;
