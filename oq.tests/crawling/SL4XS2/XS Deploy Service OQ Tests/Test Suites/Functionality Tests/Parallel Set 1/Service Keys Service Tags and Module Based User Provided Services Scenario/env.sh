#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Service Keys Service Tags and Module Based User Provided Services Scenario"
export ADDITIONAL_OPTIONS="--no-start --version-rule ALL"
export ASPACE_NAME="service-keys"
export EXPECTED_APPLICATIONS="foo bar baz"
export EXPECTED_SERVICES="hdi-test-service service-with-tags techical-user-provider"
export SPACE_NAME="service-keys"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
