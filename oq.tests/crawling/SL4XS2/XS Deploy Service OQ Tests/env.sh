#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/XS Deploy Service OQ Tests"
export ASPACE_NAME="SAP"
export DEFAULT_ORG="myorg"
export DEFAULT_SPACE="SAP"
export LANDSCAPE="onprem"
export ORG_NAME="myorg"
export RT_CLIENTS_HOME_ROOT="${TEST_WORKING_DIRECTORY}"
export RT_HOME="${RT_CLIENTS_HOME_ROOT}"
export RUNTIME="xs"
export SPACE_NAME="SAP"
export TEST_WORKING_DIRECTORY="${TEST_WORKING_DIRECTORIES_COMMON_ROOT}/${LANDSCAPE}"
export USER_NAME="OQ_TESTS_USER"
export USER_PASS="Toor1234"
export XS_ADMIN_USER_NAME="XSA_ADMIN"
export XS_ADMIN_USER_PASS="Toor1234"
export XS_USER_HOME_DIR="/usr/sap/XSA/home"
