#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Job Scheduler Scenario from Local MTAR"
export ADDITIONAL_OPTIONS="--keep-files"
export APP_LOCATION="jobscheduler-test"
export APP_NAME="jobscheduler-assembly"
export APP_URL="http://nexus.wdf.sap.corp:8081/nexus/content/repositories/deploy.milestones.xmake/com/sap/xs/jobscheduler/jobscheduler-assembly"
export APP_VERSION="1.5.5"
export ASPACE_NAME="jobscheduler-scenario"
export EXPECTED_APPLICATIONS="jobscheduler-db jobscheduler-service jobscheduler-broker jobscheduler-backend jobscheduler-dashboard"
export EXPECTED_SERVICES="jobscheduler-db-container jobscheduler-sbss jobscheduler-securestore jobscheduler-uaa"
export SPACE_NAME="jobscheduler-scenario"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
