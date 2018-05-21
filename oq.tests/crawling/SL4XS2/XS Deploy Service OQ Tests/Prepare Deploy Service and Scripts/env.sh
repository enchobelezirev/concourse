#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Prepare Deploy Service and Scripts"
export ASPACE_NAME="SAP"
export RECREATE_SPACE="NO"
export RT_CLIENTS_HOME_ROOT="${TEST_WORKING_DIRECTORY}"
export SPACE_NAME="SAP"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
