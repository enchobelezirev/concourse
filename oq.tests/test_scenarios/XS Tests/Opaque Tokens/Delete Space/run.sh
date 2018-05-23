#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";en
source "${script_dir}/v.sh"
cd 
bash "/workspace/test_scripts/delete_space.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/One-off Tasks Scenario/Delete Space/Delete Space" -v dimitar.donchev@sap.com <<<./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/One-off Tasks Scenario/Delete Space/Delete Space;
exit 1; fi
