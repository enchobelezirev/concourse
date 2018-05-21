#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Deploy"
export APP_LOCATION="sanity-check"
export EXPECTED_APPLICATIONS="anatz-sanity-check-module"
export EXPECTED_SERVICES="anatz-sanity-check-service"
