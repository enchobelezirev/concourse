#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Blue Green Deploy 3"
export EXPECTED_APPLICATIONS="jobscheduler-db-green jobscheduler-service-green jobscheduler-broker-green jobscheduler-backend-green jobscheduler-dashboard-green"
export UNEXPECTED_APPLICATIONS="jobscheduler-db-container jobscheduler-sbss jobscheduler-securestore jobscheduler-uaa"
