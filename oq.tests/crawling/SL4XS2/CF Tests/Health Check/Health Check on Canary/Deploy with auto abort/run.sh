#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash "/root/XSOQTests/test_scripts/test_deploy_auto_abort.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/CF Tests/Health Check/Health Check on Canary/Deploy with auto abort" -v dimitar.donchev@sap.com <<<./SL4XS2/CF Tests/Health Check/Health Check on Canary/Deploy with auto abort;
exit 1; fi
