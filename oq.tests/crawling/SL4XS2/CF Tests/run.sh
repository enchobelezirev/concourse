#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests"
bash "CF Canary Tests/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/CF Canary Tests_on Staging"
bash "CF Canary Tests_on Staging/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/CF Canary Tests_on Staging";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Pure CF Tests"
bash "Pure CF Tests/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Pure CF Tests";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/CF Tests/Health Check"
bash "Health Check/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/CF Tests/Health Check";
exit 1; fi
exit $rc;
