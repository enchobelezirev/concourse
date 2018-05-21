#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Deploy"
export APP_LOCATION="optional-mta-resources/mta-with-not-existing-resource-type"
export EXPECTED_APPLICATIONS="ztana"
