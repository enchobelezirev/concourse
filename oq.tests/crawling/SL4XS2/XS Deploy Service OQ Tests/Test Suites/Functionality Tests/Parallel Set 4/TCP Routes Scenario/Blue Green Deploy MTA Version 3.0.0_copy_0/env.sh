#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Blue Green Deploy MTA Version 3.0.0_copy_0"
export APP_LOCATION="tcp-routes-archives/"
export EXPECTED_APPLICATIONS="tcp-route-module"
