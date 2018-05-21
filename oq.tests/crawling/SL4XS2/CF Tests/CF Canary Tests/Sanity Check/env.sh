#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Sanity Check"
export ASPACE_NAME="sanity-check"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export DEPLOY_SERVICE_URL="deploy-service.cfapps.sap.hana.ondemand.com"
export RECREATE_SPACE="YES"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="sanity-check"
