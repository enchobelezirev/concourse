#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/SHINE Scenario"
export APP_LOCATION="shine-scenario"
export APP_NAME="sap-xsac-shine"
export APP_URL="http://nexus.wdf.sap.corp:8081/nexus/content/repositories/build.milestones.xmake/com/sap/refapps/sap-xsac-shine"
export ASPACE_NAME="shine"
export EXPECTED_APPLICATIONS="shine-user-db shine-core-db shine-core-js shine-user-js shine-user-java shine-web shine-site-web shine-site-content"
export EXPECTED_SERVICES="shine-container shine-auditlog shine-user-container shine-scheduler shine-uaa sap-portal-services-host sap-portal-services-client"
export SPACE_NAME="shine"
export XSCLIENT_CONTEXTFILE="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
