#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Blue Green Deploy 2"
export EXPECTED_APPLICATIONS="xsa-admin-green xsa-admin-backend-green"
export UNEXPECTED_APPLICATIONS="xsa-admin-blue xsa-admin-backend-blue"
