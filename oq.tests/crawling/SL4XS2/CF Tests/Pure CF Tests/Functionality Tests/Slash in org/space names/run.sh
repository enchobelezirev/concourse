#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Slash in org/space names/Setup"
bash "Setup/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Slash in org/space names/Setup";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Slash in org/space names/Execute Sanity Check"
bash "Execute Sanity Check/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Slash in org/space names/Execute Sanity Check";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Slash in org/space names/Delete Space"
bash "Delete Space/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Slash in org/space names/Delete Space";
exit 1; fi
exit $rc;
