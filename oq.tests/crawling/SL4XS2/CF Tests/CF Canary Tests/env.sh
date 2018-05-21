#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/CF Canary Tests"
export ASPACE_NAME="i058256"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export CF_PLUGIN_HOME="/root/"
export DEFAULT_ORG="${ORG_NAME}"
export DEFAULT_SPACE="i058256"
export DEPLOY_SERVICE_HOST="deploy-service-i058256"
export DEPLOY_SERVICE_URL="deploy-service-i058256.cfapps.sap.hana.ondemand.com"
export LANDSCAPE="canary"
export ORG_NAME="deploy-service"
export RECREATE_SPACE="NO"
export RT_API_ENDPOINT="https://api.cf.sap.hana.ondemand.com"
export RT_CLIENTS_HOME_ROOT="${TEST_WORKING_DIRECTORY}/CfSessions"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="i058256"
export TEST_WORKING_DIRECTORY="${TEST_WORKING_DIRECTORIES_COMMON_ROOT}/${LANDSCAPE}"
export USER_NAME="p1940021538"
export USER_PASS="Toor1234"
