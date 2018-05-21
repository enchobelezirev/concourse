#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Blue Green Deploy 1"
export EXPECTED_APPLICATIONS="shine-user-db-blue shine-core-db-blue shine-core-js-blue shine-user-js-blue shine-user-java-blue shine-web-blue"
