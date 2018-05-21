#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
pwd
bash "test_scripts/update_deploy_service.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Update Deploy Service" -v encho.belezirev@sap.com <<<./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Update Deploy Service;
exit 1; fi
