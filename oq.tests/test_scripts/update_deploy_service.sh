export PARENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
source ${PARENT_DIR}/test_functions.sh
generate_local_executable "$0"
set -e
update_deploy_service_content
if [[ $RUNTIME == "xs" ]]; then
  update_on_xs
else
  update_on_cf
fi
