#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Async services with existing service"
export APP_LOCATION="async-services/async-services-with-existing-service"
export ASPACE_NAME="async-services-with-existing-service-pure"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export EXPECTED_APPLICATIONS="ztana"
export EXPECTED_SERVICES="test-resource test-resource-1 test-resource-existing"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="async-services-with-existing-service-pure"
