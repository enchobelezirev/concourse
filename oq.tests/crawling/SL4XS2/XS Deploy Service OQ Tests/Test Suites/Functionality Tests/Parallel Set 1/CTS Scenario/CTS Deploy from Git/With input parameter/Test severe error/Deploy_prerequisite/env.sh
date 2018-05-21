#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Deploy_prerequisite"
export CTS_FROM_GIT_CONFIG_TEMPLATE_XML="cts-from-git-config-template-severe-error-prerequisite.xml"
export MTA_ID="anatz-git-severe-error-prerequisite"
