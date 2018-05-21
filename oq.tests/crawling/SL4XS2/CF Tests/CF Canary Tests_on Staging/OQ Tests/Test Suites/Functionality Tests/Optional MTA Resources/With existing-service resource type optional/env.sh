#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/With existing-service resource type optional"
export ASPACE_NAME="existing-service-optional"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export DEPLOY_SERVICE_URL="deploy-service-i076083.cfapps.sap.hana.ondemand.com"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="existing-service-optional"
