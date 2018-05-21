#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Test warn"
export CTS_FROM_GIT_CONFIG_TEMPLATE_XML="cts-from-git-config-template-warn.xml"
export EXPECTED_APPLICATIONS="anatz-git-warn-module"
export EXPECTED_ERROR_CODE="WARNING"
export GIT_REPOSITORY_LIST_PARAMETERS_XML="git-repository-list-parameters-warn.xml"
export MTA_ID="anatz-git-warn"
