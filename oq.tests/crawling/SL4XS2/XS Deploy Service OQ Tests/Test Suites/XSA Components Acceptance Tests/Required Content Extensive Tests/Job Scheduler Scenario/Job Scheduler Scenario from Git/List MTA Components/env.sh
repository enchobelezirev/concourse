#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/List MTA Components"
export APP_LOCATION="jobscheduler"
export EXPECTED_APPLICATIONS="jobscheduler-backend-green jobscheduler-broker-green jobscheduler-dashboard-green jobscheduler-db-green jobscheduler-rest-green jobscheduler-service-green"
export EXPECTED_SERVICES="jobscheduler-sbss jobscheduler-db-container jobscheduler-uaa jobscheduler-securestore"
export MTA_ID="com.sap.xs.jobscheduler"
