#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Service tags scenario"
export ASPACE_NAME="oq-tests-service-tags"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="oq-tests-service-tags"
