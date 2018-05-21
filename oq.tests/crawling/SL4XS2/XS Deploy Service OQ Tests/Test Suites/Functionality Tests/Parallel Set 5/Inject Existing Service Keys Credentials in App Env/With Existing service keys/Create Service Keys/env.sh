#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Create Service Keys"
export SERVICE_INSTANCE="hdi-test-service"
export SERVICE_KEYS="servicekey1 servicekey2 service-key-3"
