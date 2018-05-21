#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/FLP Scenario (cont.)"
export APP_LOCATION="sap-portal-services-test"
export ASPACE_NAME="required-content-flp"
export EXPECTED_APPLICATIONS="sap-portal-services"
export EXPECTED_SERVICES="hana-schema portal-sbss"
export SPACE_NAME="required-content-flp"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
