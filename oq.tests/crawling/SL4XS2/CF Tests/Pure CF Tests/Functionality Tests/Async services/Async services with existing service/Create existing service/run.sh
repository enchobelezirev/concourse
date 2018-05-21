#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
bash -ex '/root/crawling/SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Async services with existing service/Create existing service/run.sh_commands'
if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";
mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! ./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Async services with existing service/Create existing service" -v dimitar.donchev@sap.com <<<./SL4XS2/CF Tests/Pure CF Tests/Functionality Tests/Async services/Async services with existing service/Create existing service;
exit 1; fi
