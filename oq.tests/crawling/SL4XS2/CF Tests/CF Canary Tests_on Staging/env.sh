#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/CF Canary Tests_on Staging"
export ASPACE_NAME="oq-tests"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export DEFAULT_ORG="${ORG_NAME}"
export DEFAULT_SPACE="oq-tests"
export DEPLOY_SERVICE_URL="deploy-service.cfapps.stagingaws.hanavlab.ondemand.com"
export LANDSCAPE="staging"
export ORG_NAME="deploy-service"
export RECREATE_SPACE="NO"
export RT_API_ENDPOINT="https://api.cf.stagingaws.hanavlab.ondemand.com"
export RT_CLIENTS_HOME_ROOT="${TEST_WORKING_DIRECTORY}/CfSessions"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="oq-tests"
export TEST_WORKING_DIRECTORY="${TEST_WORKING_DIRECTORIES_COMMON_ROOT}/${LANDSCAPE}"
export USER_NAME="h2148258@mvrht.com"
export USER_PASS=" Abcd1234"
export XS_DEPLOY_SNAPSHOTS_URL="http://nexus.wdf.sap.corp:8081/nexus/content/repositories/build.snapshots/com/sap/cloud/lm/sl/xs2/com.sap.cloud.lm.sl.xs2.web/"
