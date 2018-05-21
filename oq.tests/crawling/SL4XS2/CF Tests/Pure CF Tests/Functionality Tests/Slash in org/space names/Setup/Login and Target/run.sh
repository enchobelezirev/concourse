#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash "/root/XSOQTests/test_scripts/login_and_target_space.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Slash in org/space names/Setup/Login and Target" -v dimitar.donchev@sap.com <<<./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Slash in org/space names/Setup/Login and Target;
exit 1; fi
