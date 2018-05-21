#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Test content error"
export CTS_FROM_GIT_CONFIG_TEMPLATE_XML="cts-from-git-config-template-content-error.xml"
export EXPECTED_ERROR_CODE="CONTENT_ERROR"
export GIT_REPOSITORY_LIST_PARAMETERS_XML="git-repository-list-parameters-content-error.xml"
export MTA_ID="anatz-git-content-error"
