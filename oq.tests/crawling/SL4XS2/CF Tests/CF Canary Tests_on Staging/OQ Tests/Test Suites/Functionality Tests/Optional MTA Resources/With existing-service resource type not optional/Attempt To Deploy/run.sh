#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash 
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Optional MTA Resources/With existing-service resource type not optional/Attempt To Deploy" -v dimitar.donchev@sap.com <<<./SL4XS2/CF Tests/CF Canary Tests_on Staging/OQ Tests/Test Suites/Functionality Tests/Optional MTA Resources/With existing-service resource type not optional/Attempt To Deploy;
exit 1; fi
