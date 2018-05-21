#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Blue Green Deploy MTA Version 3.1.0 _ABORT_"
export APP_LOCATION="failed-update-scenario-archives/version-3.1.0"
export EXPECTED_APPLICATIONS="bar-blue baz-blue bar-green baz-green"
export SLP_ACTION="abort"
