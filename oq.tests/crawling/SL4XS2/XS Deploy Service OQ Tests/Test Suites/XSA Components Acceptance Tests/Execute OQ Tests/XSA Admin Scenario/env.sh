#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/XSA Admin Scenario"
export ADDITIONAL_OPTIONS="--do-not-fail-on-missing-permissions"
export APP_LOCATION="xsa-admin-scenario"
export APP_NAME="sap-xsac-admin"
export APP_URL="http://nexus.wdf.sap.corp:8081/nexus/content/repositories/build.milestones/com/sap/xsa/admin/sap-xsac-admin/"
export ASPACE_NAME="admin-scenario"
export EXPECTED_APPLICATIONS="xsa-admin xsa-admin-backend"
export EXPECTED_SERVICES="admin-uaa"
export SPACE_NAME="admin-scenario"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
