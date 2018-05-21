#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/SAP UI 5"
export APP_LOCATION="sapui5-scenario"
export APP_NAME="sapui5-dist-xsa"
export APP_URL="https://nexus.wdf.sap.corp:8443/nexus/service/local/repositories/deploy.releases/content/com/sap/ui5/dist/sapui5-dist-xsa"
export ASPACE_NAME="SAP"
export COMMAND="xs"
export EXPECTED_APPLICATIONS="sapui5_fesv4"
export RECREATE_SPACE="NO"
export SPACE_NAME="SAP"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
