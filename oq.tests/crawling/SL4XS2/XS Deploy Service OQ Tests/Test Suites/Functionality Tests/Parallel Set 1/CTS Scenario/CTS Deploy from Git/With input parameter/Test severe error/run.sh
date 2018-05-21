#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/CTS Scenario/CTS Deploy from Git/With input parameter/Test severe error/Deploy_prerequisite"
bash "Deploy_prerequisite/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/CTS Scenario/CTS Deploy from Git/With input parameter/Test severe error/Deploy_prerequisite";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/CTS Scenario/CTS Deploy from Git/With input parameter/Test severe error/Deploy"
bash "Deploy/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/CTS Scenario/CTS Deploy from Git/With input parameter/Test severe error/Deploy";
exit 1; fi
exit $rc;
