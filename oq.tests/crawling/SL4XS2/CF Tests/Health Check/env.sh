#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Health Check"
export APP_LOCATION="health-check-mtar"
export ASPACE_NAME="deploy-service-test"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export MTAR_LOCATION="${APP_LOCATION}/anatz.mtar"
export MTA_ID="anatz"
export ORG_NAME="SAP_xsa"
export RECREATE_SPACE="NO"
export RT_API_ENDPOINT="https://api.cf.sap.hana.ondemand.com"
export RT_CLIENTS_HOME_ROOT="${TEST_WORKING_DIRECTORY}/CfSessions"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="deploy-service-test"
export TEST_WORKING_DIRECTORY="${TEST_WORKING_DIRECTORIES_COMMON_ROOT}/${LANDSCAPE}"
