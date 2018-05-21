#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/NodeJS Sample Application Scenario"
export ADDITIONAL_OPTIONS="--no-namespaces-for-services -e nodejs-test/config-op.mtaext"
export APP_LOCATION="nodejs-test"
export ASPACE_NAME="nodejs-sample"
export EXPECTED_APPLICATIONS="node-hello-world node-hello-world-backend node-hello-world-db"
export EXPECTED_SERVICES="node-hdi-container node-uaa"
export REPOSITORY_URL="https://github.wdf.sap.corp/xs2-samples/node-hello-world.git"
export SPACE_NAME="nodejs-sample"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
