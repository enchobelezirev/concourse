#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
# TODO: add those to the params
# export STEP_PATH="${STEP_PATH}/Deploy"
# export APP_LOCATION="/workspace/test_resources/opaque-tokens-resources"
# export EXPECTED_APPLICATIONS="ztana"
