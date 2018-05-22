export PARENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
echo $PARENT_DIR
ls -a -l $PARENT_DIR
source ${PARENT_DIR}/test_functions.sh
echo "Printing the env"
env
generate_local_executable "$0"
set -e
update_deploy_service_content
if [[ $RUNTIME == "xs" ]]; then
  update_on_xs
else
  update_on_cf
fi
