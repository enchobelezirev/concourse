#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash "/root/XSOQTests/test_scripts/test_undeploy.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/CTS Scenario/CTS Deploy from Git/With XML file/Test ok/Undeploy" -v dimitar.donchev@sap.com <<<./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/CTS Scenario/CTS Deploy from Git/With XML file/Test ok/Undeploy;
exit 1; fi
