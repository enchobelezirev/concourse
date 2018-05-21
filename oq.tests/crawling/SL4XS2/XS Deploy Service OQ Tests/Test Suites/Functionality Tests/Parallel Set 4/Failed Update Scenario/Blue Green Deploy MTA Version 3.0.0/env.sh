#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Blue Green Deploy MTA Version 3.0.0"
export APP_LOCATION="failed-update-scenario-archives/version-3.0.0"
export EXPECTED_APPLICATIONS="bar-blue baz-blue"
