#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Java Sample Application Scenario"
export ADDITIONAL_OPTIONS="--no-namespaces-for-services -e generic-deploy-test/config-op.mtaext"
export APP_LOCATION="generic-deploy-test"
export ASPACE_NAME="java-sample"
export BUILDPACK_DIR_NAME="xs_java_buildpack"
export BUILDPACK_NAME="sap_java_buildpack"
export BUILDPACK_POSITION="0"
export EXPECTED_APPLICATIONS="java-hello-world java-hello-world-backend java-hello-world-db"
export EXPECTED_SERVICES="java-hdi-container java-uaa"
export REPOSITORY_URL="https://github.wdf.sap.corp/xs2-samples/java-hello-world.git"
export SPACE_NAME="java-sample"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
