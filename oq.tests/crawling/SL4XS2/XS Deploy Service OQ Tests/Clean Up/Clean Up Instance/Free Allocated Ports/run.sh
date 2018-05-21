#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
bash -ex '/root/crawling/SL4XS2/XS Deploy Service OQ Tests/Clean Up/Clean Up Instance/Free Allocated Ports/run.sh_commands'
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/XS Deploy Service OQ Tests/Clean Up/Clean Up Instance/Free Allocated Ports" -v dimitar.donchev@sap.com <<<./SL4XS2/XS Deploy Service OQ Tests/Clean Up/Clean Up Instance/Free Allocated Ports;
exit 1; fi
