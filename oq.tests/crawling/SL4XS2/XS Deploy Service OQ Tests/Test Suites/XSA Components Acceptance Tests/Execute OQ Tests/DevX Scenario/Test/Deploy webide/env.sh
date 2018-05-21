#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Deploy webide"
export ADDITIONAL_OPTIONS="--no-namespaces-for-services -e webide/sap-xsac-webide.mtaext"
export APP_LOCATION="webide"
export EXPECTED_APPLICATIONS="webide"
export EXPECTED_SERVICES="devx-uaa"
