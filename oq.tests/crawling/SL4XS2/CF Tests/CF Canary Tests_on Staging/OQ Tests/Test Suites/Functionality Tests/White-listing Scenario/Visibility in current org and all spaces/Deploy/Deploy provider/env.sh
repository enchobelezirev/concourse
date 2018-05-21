#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Deploy provider"
export APP_LOCATION="whitelisting-test/current-org-and-all-spaces/provider"
export EXPECTED_APPLICATIONS="provider"
