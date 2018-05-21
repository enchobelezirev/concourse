#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Deploy di core"
export ADDITIONAL_OPTIONS="--no-namespaces-for-services -e di-core/ext.mtaext --keep-files"
export APP_LOCATION="di-core"
export EXPECTED_APPLICATIONS="di-local-npm-registry di-core devx-ui5 di-runner di-cert-admin-ui di-space-enablement-ui"
export EXPECTED_SERVICES="devx-auditlog devx-uaa devx-fs devx-npm-cache-fs di-core-hdi di-core-schema"
export EXT_DESCRIPTOR="sap-xsac-di.mtaext"
