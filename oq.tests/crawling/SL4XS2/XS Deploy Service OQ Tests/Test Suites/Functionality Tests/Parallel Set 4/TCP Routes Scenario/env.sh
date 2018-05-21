#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/TCP Routes Scenario"
export ASPACE_NAME="tcp-routes"
export SPACE_NAME="tcp-routes"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
