#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Async services with user-provided service"
export APP_LOCATION="async-services/async-services-with-user-provided"
export ASPACE_NAME="async-services-with-user-provided-pure"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export EXPECTED_APPLICATIONS="ztana"
export EXPECTED_SERVICES="test-resource test-user-provided"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="async-services-with-user-provided-pure"
