#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Inject Existing Service Keys Credentials in App Env"
export ASPACE_NAME="inject-service-keys-scenario"
export DEPLOY_SERVICE_URL="https://mo-e627dbf44.mo.sap.corp:51206"
export SPACE_NAME="inject-service-keys-scenario"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
