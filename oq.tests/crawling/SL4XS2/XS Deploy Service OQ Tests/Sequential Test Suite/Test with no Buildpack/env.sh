#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Test with no Buildpack"
export APP_LOCATION="no-buildpack-java"
export ASPACE_NAME="java-no-buildpack"
export BUILDPACK_DIR_NAME="java_xs_buildpack"
export BUILDPACK_NAME="sap_java_buildpack"
export BUILDPACK_POSITION="0"
export EXPECTED_APPLICATIONS="hello-router hello-backend"
export REPOSITORY_URL="https://github.wdf.sap.corp/xs2-samples/java-hello-world.git"
export SPACE_NAME="java-no-buildpack"
export USER_NAME="${XS_ADMIN_USER_NAME}"
export USER_PASS="${XS_ADMIN_USER_PASS}"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
