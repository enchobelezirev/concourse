#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Space-Scoped Service Broker Scenario"
export APP_LOCATION="service-broker-archive"
export ASPACE_NAME="space-scoped-service-broker-scenario-pure"
export CF_HOME="${RT_CLIENTS_HOME_ROOT}/${ASPACE_NAME}"
export EXPECTED_APPLICATIONS="products-broker products-service"
export EXPECTED_SERVICES="products-sbss"
export EXPECTED_SERVICE_BROKERS="deploy-service-test-broker"
export RT_HOME="${CF_HOME}"
export SPACE_NAME="space-scoped-service-broker-scenario-pure"
