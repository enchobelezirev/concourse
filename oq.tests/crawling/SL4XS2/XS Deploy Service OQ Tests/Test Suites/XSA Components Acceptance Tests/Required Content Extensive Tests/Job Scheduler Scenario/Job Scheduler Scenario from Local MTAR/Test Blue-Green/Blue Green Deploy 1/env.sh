#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Blue Green Deploy 1"
export EXPECTED_APPLICATIONS="jobscheduler-db-blue jobscheduler-service-blue jobscheduler-broker-blue jobscheduler-backend-blue jobscheduler-dashboard-blue"
