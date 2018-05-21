#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Special symbols in org and space names"
export ASPACE_NAME="myorg"
export SPACE_NAME="spa/ce test sa/p"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
