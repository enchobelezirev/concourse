export PARENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
source ${PARENT_DIR}/test_functions.sh
generate_local_executable "$0"
set -e

if [[ ${RT} != "xs" ]]; then
    echo "Runtime is not XS - no need to disable the opaque tokens..."
    exit 0
fi
disable_opaque_tokens_on_xs