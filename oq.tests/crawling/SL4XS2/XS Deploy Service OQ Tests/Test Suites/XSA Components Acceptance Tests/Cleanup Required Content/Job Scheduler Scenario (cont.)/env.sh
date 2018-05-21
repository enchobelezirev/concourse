#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Job Scheduler Scenario (cont.)"
export APP_LOCATION="jobscheduler-test"
export ASPACE_NAME="required-content-jobscheduler"
export EXPECTED_APPLICATIONS="jobscheduler-db jobscheduler-service jobscheduler-broker jobscheduler-backend jobscheduler-dashboard"
export EXPECTED_SERVICES="jobscheduler-db-container jobscheduler-sbss jobscheduler-securestore jobscheduler-uaa"
export SPACE_NAME="required-content-jobscheduler"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
