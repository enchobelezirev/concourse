#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Attempt To Deploy"
export APP_LOCATION="optional-mta-resources/existing-service-not-optional"
export EXPECTED_APPLICATIONS="ztana"
export UNEXPECTED_SERVICES="not-existing-service"
