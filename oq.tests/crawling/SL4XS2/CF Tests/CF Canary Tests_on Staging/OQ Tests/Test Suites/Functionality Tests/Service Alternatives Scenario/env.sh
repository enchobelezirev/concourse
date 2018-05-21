#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Service Alternatives Scenario"
export ASPACE_NAME="service-alternatives-scenario"
export DEPLOY_SERVICE_URL="https://mo-e627dbf44.mo.sap.corp:51080"
export SPACE_NAME="service-alternatives-scenario"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
