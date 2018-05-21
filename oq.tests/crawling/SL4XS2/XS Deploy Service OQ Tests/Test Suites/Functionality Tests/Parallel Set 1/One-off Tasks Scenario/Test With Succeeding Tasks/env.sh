#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Test With Succeeding Tasks"
export APP_LOCATION="one-off-task-archives/succeeding"
export EXPECTED_APPLICATION="module-containing-tasks"
