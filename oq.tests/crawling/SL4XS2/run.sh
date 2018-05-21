#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/Update Test Scripts"
bash "Update Test Scripts/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/Update Test Scripts";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests"
bash "XS Deploy Service OQ Tests/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests"
bash "CF Tests/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests";
exit 1; fi
exit $rc;
