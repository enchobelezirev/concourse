#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
# source "${script_dir}/env.sh"
cd 
env
bash "${TEST_WORKING_DIRECTORY}/oq-test-git-repo/oq.tests/test_scripts/test_deploy.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Optional MTA Resources/With existing-service resource type not optional/Deploy" -v dimitar.donchev@sap.com <<<./SL4XS2/XS Deploy Service OQ Tests/Test Suites/Functionality Tests/Parallel Set 1/Optional MTA Resources/With existing-service resource type not optional/Deploy;
exit 1; fi
