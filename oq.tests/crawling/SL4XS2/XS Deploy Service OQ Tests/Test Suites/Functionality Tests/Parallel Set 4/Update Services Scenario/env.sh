#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Update Services Scenario"
export APP_LOCATION="update-services"
export ASPACE_NAME="update-services-scenario"
export EXPECTED_MAIN_LOG="expected-main-log-op.txt"
export SPACE_NAME="update-services-scenario"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
