#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Remove SAP UI5 Content"
export APP_LOCATION="sapui5-scenario"
export ASPACE_NAME="oq-tests-ui5"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export EXPECTED_APPLICATIONS="sapui5"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="oq-tests-ui5"
