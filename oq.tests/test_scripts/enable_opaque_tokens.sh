export PARENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
source ${PARENT_DIR}/test_functions.sh
generate_local_executable "$0"
set -e

if [[ ${RT} != "xs" ]]; then
    echo "Runtime is not XS - no need to enable the opaque tokens as they are already enabled..."
    exit 0
fi
enable_opaque_tokens_on_xs