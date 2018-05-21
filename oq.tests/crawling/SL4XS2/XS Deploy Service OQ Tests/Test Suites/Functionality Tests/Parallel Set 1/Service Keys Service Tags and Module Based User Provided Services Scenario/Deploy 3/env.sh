#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Deploy 3"
export ADDITIONAL_OPTIONS="--no-start --delete-service-keys"
export APP_LOCATION="services-test-archive/version-1.2.0"
