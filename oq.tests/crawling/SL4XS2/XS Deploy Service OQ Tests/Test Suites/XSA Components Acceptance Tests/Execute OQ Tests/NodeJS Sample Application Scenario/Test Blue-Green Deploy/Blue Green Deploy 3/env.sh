#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Blue Green Deploy 3"
export EXPECTED_APPLICATIONS="node-hello-world-green node-hello-world-backend-green node-hello-world-db-green"
export UNEXPECTED_APPLICATIONS="node-hello-world node-hello-world-backend node-hello-world-db"
