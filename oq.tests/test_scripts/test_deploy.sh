export PARENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
source "${PARENT_DIR}"/test_functions.sh
generate_local_executable "$0"
#TODO - is MTAR_LOCATION ever pre-defined 

echo "This is the MTAR_LOCATION: ${MTAR_LOCATION}"
echo "This is the APP_LOCATION: ${APP_LOCATION}"
if [[ -z "${MTAR_LOCATION}" ]]; then
  MTAR_LOCATION="$(find_mtar $APP_LOCATION)"
else
  find "${MTAR_LOCATION}" -name '*.mtar' | head -1
fi
echo "MTAR_LOCATION found ${MTAR_LOCATION}"
test_deploy
