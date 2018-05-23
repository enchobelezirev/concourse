#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
cd 
bash "/workspace/test_scripts/update_cli_plugin.sh"
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Update CF CLI Plugins" -v dimitar.donchev@sap.com <<<./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Update CF CLI Plugins;
exit 1; fi
