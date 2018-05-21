#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Deploy Prerequisite"
export APP_LOCATION="cts-resources/anatz_provider_2.0.0-severe-error-prerequisite.mtar"
export EXPECTED_APPLICATIONS="anatz-severe-module-prerequisite"
