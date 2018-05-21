#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Test ok"
export APP_LOCATION="anatz_provider_2.0.0_ok.mtar"
export EXPECTED_APPLICATIONS="anatz-ok-module"
export EXPECTED_ERROR_CODE="OK"
export EXPECTED_SERVICES="anatz-service"
export MTA_ID="anatz-ok"
