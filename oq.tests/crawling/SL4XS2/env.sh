#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/SL4XS2"
export JAVA_HOME="/usr/lib/java/jdk1.8.0_20"
export TEST_WORKING_DIRECTORIES_COMMON_ROOT="/root/OQTestsScripts"
export XS_DEPLOY_SNAPSHOTS_URL="http://nexus.wdf.sap.corp:8081/nexus/content/repositories/build.snapshots/com/sap/cloud/lm/sl/xs2/com.sap.cloud.lm.sl.xs2.web/"
