#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/SAP UI 5 Scenario (cont.)"
export APP_LOCATION="sapui5-scenario"
export ASPACE_NAME="SAP"
export EXPECTED_APPLICATIONS="sapui5_fesv3"
export SPACE_NAME="SAP"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
