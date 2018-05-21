#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Update Services Scenario"
export APP_LOCATION="update-services"
export ASPACE_NAME="update-services-scenario-pure"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export EXPECTED_MAIN_LOG="expected-main-log-cf-pure.txt"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="update-services-scenario-pure"
