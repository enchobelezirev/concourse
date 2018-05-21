#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Blue Green Deploy"
export ADDITIONAL_OPTIONS=". --git-uri https://github.wdf.sap.corp/i330847/jobscheduler-1.3.2.git --git-skip-ssl-validation --do-not-fail-on-missing-permissions"
