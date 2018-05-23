export PARENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
source ${PARENT_DIR}/test_functions.sh
generate_local_executable "$0"
set -e
if [[ $RUNTIME == "xs" ]]; then
  update_xs_cli_plugin
else
  update_cf_cli_plugin
fi
