#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash "/root/XSOQTests/test_scripts/test_deploy_no_buildpack.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no Buildpack/Attempt to deploy when no buildpack exists" -v dimitar.donchev@sap.com <<<./SL4XS2/XS Deploy Service OQ Tests/Sequential Test Suite/Test with no Buildpack/Attempt to deploy when no buildpack exists;
exit 1; fi
