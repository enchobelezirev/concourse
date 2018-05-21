#!/bin/bash
current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
parent_dir="$(dirname -- "${current_dir}")";
if [ -f "${parent_dir}/env.sh" ] ; then
        source "${parent_dir}/env.sh";
fi
export STEP_PATH="${STEP_PATH}/MAJOR (Quoted)"
export APP_LOCATION="partial-schema-version-archives/major-quoted"
export EXPECTED_APPLICATIONS="major-quoted"
