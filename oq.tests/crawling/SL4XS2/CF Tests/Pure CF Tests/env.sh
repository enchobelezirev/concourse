#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Pure CF Tests"
export ASPACE_NAME="oq-tests-pure"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export DEFAULT_ORG="${ORG_NAME}"
export DEFAULT_SPACE="oq-tests-pure"
export DEPLOY_SERVICE_HOST="deploy-service-oq-tests-pure"
export DEPLOY_SERVICE_URL="deploy-service-oq-tests-pure.cfapps.sap.hana.ondemand.com"
export LANDSCAPE="pure_canary"
export ORG_NAME="deploy-service"
export PURE_CF="true"
export RECREATE_SPACE="NO"
export RT_API_ENDPOINT="https://api.cf.sap.hana.ondemand.com"
export RT_CLIENTS_HOME_ROOT="${TEST_WORKING_DIRECTORY}/CfSessions"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="oq-tests-pure"
export TEST_WORKING_DIRECTORY="${TEST_WORKING_DIRECTORIES_COMMON_ROOT}/${LANDSCAPE}"
export USER_NAME="p1940021538"
export USER_PASS="Toor1234"
export XS_DEPLOY_SNAPSHOTS_URL="http://nexus.wdf.sap.corp:8081/nexus/content/repositories/build.snapshots/com/sap/cloud/lm/sl/cf/com.sap.cloud.lm.sl.cf.web/"
