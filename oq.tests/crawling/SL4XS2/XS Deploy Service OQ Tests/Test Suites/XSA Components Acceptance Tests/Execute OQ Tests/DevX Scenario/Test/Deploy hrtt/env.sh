#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Deploy hrtt"
export ADDITIONAL_OPTIONS="--do-not-fail-on-missing-permissions"
export APP_LOCATION="devx-hrtt"
export EXPECTED_APPLICATIONS="hrtt-core hrtt-service sqlanlz-ui"
export EXPECTED_SERVICES="hrtt-datasource cockpit-datasource hrtt-uaa"
