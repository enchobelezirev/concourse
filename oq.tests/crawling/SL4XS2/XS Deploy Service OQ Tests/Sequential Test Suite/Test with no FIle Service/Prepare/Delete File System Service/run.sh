#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash "/root/XSOQTests/test_scripts/delete_service_if_exists.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/Prepare/Delete File System Service" -v dimitar.donchev@sap.com <<<./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no FIle Service/Prepare/Delete File System Service;
exit 1; fi
