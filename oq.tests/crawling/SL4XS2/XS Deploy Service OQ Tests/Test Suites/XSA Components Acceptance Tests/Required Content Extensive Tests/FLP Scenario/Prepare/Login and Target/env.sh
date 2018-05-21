#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/Login and Target"
export USER_NAME="${XS_ADMIN_USER_NAME}"
export USER_PASS="${XS_ADMIN_USER_PASS}"
