#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Test content error"
export APP_LOCATION="anatz_provider_2.0.0-content-error.mtar"
export EXPECTED_ERROR_CODE="CONTENT_ERROR"
export MTA_ID="anatz-content-error"
