#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash "/root/XSOQTests/test_scripts/test_mta.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR/List MTA components" -v dimitar.donchev@sap.com <<<./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 2/Partial Schema Version Scenario/Parallel tests/MAJOR/List MTA components;
exit 1; fi
