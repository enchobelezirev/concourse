#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Update Service Plan Scenario"
export APP_LOCATION="update-service-plan-scenario-xs"
export ASPACE_NAME="update-service-plan-scenario-space"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export EXPECTED_APPLICATIONS="test-update-service-plan"
export EXPECTED_SERVICES="service-with-new-plan"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="update-service-plan-scenario-space"
