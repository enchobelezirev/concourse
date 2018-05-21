#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Download hrtt"
export APP_LOCATION="devx-hrtt"
export APP_NAME="sap-xsac-hrtt"
export APP_URL="http://nexus.wdf.sap.corp:8081/nexus/content/repositories/build.milestones/com/sap/xsa/hrtt/sap-xsac-hrtt"
