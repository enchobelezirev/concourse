#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/Prepare/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/Prepare/Login and Target";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/Prepare/Delete File System Service"
bash "Delete File System Service/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/Prepare/Delete File System Service";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/Prepare/Restart deploy service"
bash "Restart deploy service/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/Prepare/Restart deploy service";
exit 1; fi
exit $rc;
