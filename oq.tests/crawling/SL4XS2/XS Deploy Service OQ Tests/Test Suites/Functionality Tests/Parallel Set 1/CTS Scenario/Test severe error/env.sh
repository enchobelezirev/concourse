#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Test severe error"
export APP_LOCATION="anatz_provider_2.0.0-severe-error.mtar"
export EXPECTED_ERROR_CODE="SEVERE_ERROR"
export MTA_ID="anatz-severe-error"
