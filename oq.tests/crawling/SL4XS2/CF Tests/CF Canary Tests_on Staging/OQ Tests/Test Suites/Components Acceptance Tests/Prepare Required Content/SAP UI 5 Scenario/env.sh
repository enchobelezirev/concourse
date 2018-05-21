#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/SAP UI 5 Scenario"
export APP_LOCATION="sapui5-scenario"
export APP_NAME="sapui5-dist-xsa"
export APP_URL="https://nexus.wdf.sap.corp:8443/nexus/service/local/repositories/deploy.releases/content/com/sap/ui5/dist/sapui5-dist-xsa"
export APP_VERSION="1.34.8"
export ASPACE_NAME="oq-tests-ui5"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export COMMAND="xs"
export EXPECTED_APPLICATIONS="sapui5-1.34"
export RECREATE_SPACE="YES"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="oq-tests-ui5"
