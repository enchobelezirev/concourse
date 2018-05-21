#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash "/root/XSOQTests/test_scripts/extract_deployment_descriptor.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/SAP UI 5/Extract Deployment Descriptor" -v dimitar.donchev@sap.com <<<./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/SAP UI 5/Extract Deployment Descriptor;
exit 1; fi
