#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Only async services"
export APP_LOCATION="async-services/only-async-services"
export ASPACE_NAME="only-async-services-pure"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export EXPECTED_APPLICATIONS="ztana"
export EXPECTED_SERVICES="test-resource test-resource-1"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="only-async-services-pure"
