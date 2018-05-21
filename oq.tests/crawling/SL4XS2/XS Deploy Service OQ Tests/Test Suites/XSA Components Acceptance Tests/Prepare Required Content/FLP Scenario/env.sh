#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/FLP Scenario"
export ADDITIONAL_OPTIONS="--keep-files"
export APP_LOCATION="sap-portal-services-test"
export APP_NAME="sap-portal-services-assembly"
export APP_URL="https://nexus.wdf.sap.corp:8443/nexus/service/local/repositories/build.releases/content/com/sap/xs/sap/portal/services/sap-portal-services-assembly/"
export APP_VERSION="1.6.8"
export ASPACE_NAME="required-content-flp"
export EXPECTED_APPLICATIONS="sap-portal-services"
export EXPECTED_SERVICES="hana-schema portal-sbss"
export SPACE_NAME="required-content-flp"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
