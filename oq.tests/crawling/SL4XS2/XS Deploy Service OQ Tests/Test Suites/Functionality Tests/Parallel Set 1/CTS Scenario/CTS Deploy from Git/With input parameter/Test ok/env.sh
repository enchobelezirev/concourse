#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Test ok"
export CTS_FROM_GIT_CONFIG_TEMPLATE_XML="cts-from-git-config-template-ok.xml"
export EXPECTED_APPLICATIONS="anatz-git-ok-module"
export EXPECTED_ERROR_CODE="OK"
export EXPECTED_SERVICES="anatz-git-service"
export GIT_REPOSITORY_LIST_PARAMETERS_XML="git-repository-list-parameters-ok.xml"
export MTA_ID="anatz-git-ok"
