#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Download di core"
export APP_LOCATION="di-core"
export APP_NAME="sap-xsac-di"
export APP_URL="http://nexus.wdf.sap.corp:8081/nexus/content/repositories/build.releases/com/sap/di/sap-xsac-di"
