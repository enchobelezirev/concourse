#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash "/root/XSOQTests/test_scripts/test_deploy.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/CF Tests/CF Canary Tests/Sanity Check/Execute Sanity Check/Deploy" -v dimitar.donchev@sap.com <<<./SL4XS2/CF Tests/CF Canary Tests/Sanity Check/Execute Sanity Check/Deploy;
exit 1; fi
