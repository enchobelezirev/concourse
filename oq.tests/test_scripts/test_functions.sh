SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );

#TODO - these probably are no longer set
#Variables inherited from **** execution, which mess-up the nodejs maven build
unset SUDO_GID;
unset SUDO_UID;
unset SUDO_USER;

declare -a MODULES_ARR

OAUTH_TOKEN=""
CSRF_TOKEN=""
API_ENDPOINT=""
API_URL=""

source "${SCRIPT_DIR}/test_utils.sh"

function dummy_test_function(){
  echo_info "DOING SOME IMPORTANT SCENARIO VALIDATION HERE..."
  return 0;
}

function test_blue_green_deploy() {
    local temp_location="temp-${RANDOM}"
    create_directory ${temp_location}
    local action="${SLP_ACTION}"
    if [ -z "${action}" ]; then
      action="resume"
    fi

    execute_blue_green_deploy "${MTAR_LOCATION}" "${ADDITIONAL_OPTIONS}" | tee ${temp_location}/bg-deploy-output.txt
    grep -q "Process finished" ${temp_location}/bg-deploy-output.txt;
    local finished=$0 #if found(fnished)->0 if not finished -> 1;
    if  [ $finished != 0 ] && [ "${action}" != "none" ] ; then #if not finished and SLP_ACTION is not 'none'
        execute_action_on_process ${temp_location}/bg-deploy-output.txt "${action}"
        assert_call_was_successful "Resume"
    fi
    ${RT} a > ${temp_location}/xs-a-output.txt
    assert_components_exist applications ${temp_location}/xs-a-output.txt ${EXPECTED_APPLICATIONS}
    assert_components_do_not_exist applications ${temp_location}/xs-a-output.txt ${UNEXPECTED_APPLICATIONS}
    ${RT} s > ${temp_location}/xs-s-output.txt
    assert_components_exist services ${temp_location}/xs-s-output.txt ${EXPECTED_SERVICES}

    delete_directory ${temp_location}
}

function test_deploy() {
    local temp_directory_location="temp-${RANDOM}"
    local apps_output_location="${temp_directory_location}/${RT}-apps-output.txt"
    local services_output_location="${temp_directory_location}/${RT}-services-output.txt"
    local service_brokers_output_location="${temp_directory_location}/${RT}-service-brokers-output.txt"
    create_directory ${temp_directory_location}

    execute_deploy "${MTAR_LOCATION}" "${ADDITIONAL_OPTIONS}" "${RESTART_ON_FAILURE}"

    ${RT} apps > ${apps_output_location}
    assert_components_exist applications ${apps_output_location} ${EXPECTED_APPLICATIONS}
    ${RT} services > ${services_output_location}
    assert_components_exist services ${services_output_location} ${EXPECTED_SERVICES}
    ${RT} service-brokers > ${service_brokers_output_location}
    assert_components_exist service-brokers  ${service_brokers_output_location} ${EXPECTED_SERVICE_BROKERS}

    delete_directory ${temp_directory_location}
}

function test_undeploy() {
    if [ -z ${MTA_ID} ]; then
        MTA_ID=$(get_mta_id ${APP_LOCATION}/mtad.yaml)
        echo_info "MTA ID detected from app location: ${APP_LOCATION} is ${MTA_ID}"
    fi
    local temp_directory_location="temp-${APP_LOCATION}"
    local apps_output_location="${temp_directory_location}/${RT}-apps-output.txt"
    local mtas_output_location="${temp_directory_location}/${RT}-mtas-output.txt"
    local services_output_location="${temp_directory_location}/${RT}-services-output.txt"
    local service_brokers_output_location="${temp_directory_location}/${RT}-service-brokers-output.txt"
    create_directory ${temp_directory_location}

    execute_undeploy ${MTA_ID}
    
    ${RT} apps > ${apps_output_location}
    assert_components_do_not_exist apps ${apps_output_location} ${EXPECTED_APPLICATIONS}
    ${RT} services > ${services_output_location}
    assert_components_do_not_exist services ${services_output_location} ${EXPECTED_SERVICES}
    ${RT} service-brokers > ${service_brokers_output_location}
    assert_components_do_not_exist service-brokers  ${service_brokers_output_location} ${EXPECTED_SERVICE_BROKERS}
    ${RT} mtas > ${mtas_output_location}
    assert_components_do_not_exist MTAs ${mtas_output_location} ${MTA_ID}

    delete_directory ${temp_directory_location}
}


function download_and_extract_version_from_global_metadata {
        echo_info "Downloading metadata from url ${1} to version_xml:${version_xml}"
        wget --no-proxy -nv -O "${version_xml}" "$1"
        if [ $? -ne 0 ]; then
                echo_error "Unable to download '$1'"
                exit 1
        fi
        echo_info "Extracting latest version from version_xml..."
        VER=$(xmllint --xpath "/metadata/versioning/latest/text()" "${version_xml}")
        echo_info "VER is ${VER}"
}

function download_and_extract_version_from_concrete_metadata {
        echo_info "Downloading metadata from url ${1} to version_xml:${version_xml}"
        wget --no-proxy -nv -O "${version_xml}" "$1"
        if [ $? -ne 0 ]; then
                echo_error "Unable to download '$1'"
                exit 1
        fi
        echo_info "Extracting latest version from version_xml..."
        VER=$(xmllint --xpath "//snapshotVersion[extension='pom']/value/text()" "${version_xml}") 
}

function get_latest_version {
    echo_info "Downloading latest deploy service version from ${XS_DEPLOY_SNAPSHOTS_URL}..."
    create_directory "${DEPLOY_SERVICE_DIR}" #if not yet created
    version_xml="${DEPLOY_SERVICE_DIR}/version.xml"
    download_and_extract_version_from_global_metadata ${XS_DEPLOY_SNAPSHOTS_URL}/maven-metadata.xml
    echo ${VERSION_VALUE}
    if [[ ${VERSION_VALUE} == "" ]]; then
        echo ${VERSION_VALUE}
        VERSION_VALUE=$VER
    fi
    echo_info "Latest version is ${VERSION_VALUE}"
}

function get_latest_war_and_yml {
        get_latest_version
        local XS_SNAPSHOT_URL="${XS_DEPLOY_SNAPSHOTS_URL}/${VERSION_VALUE}"
        local XS_CURRENT_SNAPSHOT_URL="${XS_SNAPSHOT_URL}/maven-metadata.xml"
        echo_info "Downloading snapshot for version: ${VERSION_VALUE} ..."
        download_and_extract_version_from_concrete_metadata ${XS_CURRENT_SNAPSHOT_URL}
        local VER_WAR=$VER
        echo_info "Latest build version is: ${VERSION_VALUE}"
        echo_info "Downloading latest war file..."
        if [[ ${PURE_CF} == "true" ]]; then
            PROJECT_NAME=com.sap.cloud.lm.sl.cf.web
        else
            PROJECT_NAME=com.sap.cloud.lm.sl.xs2.web
            echo_info "Downloading latest xs2-manifest.yml..."
            wget --no-proxy -nv -O "$DEPLOY_SERVICE_DIR/target/manifests/xs2-manifest.yml" "${XS_SNAPSHOT_URL}/${PROJECT_NAME}-$VER_WAR-xs2-manifest.yml"
        fi
        wget --no-proxy -nv -O "$DEPLOY_SERVICE_DIR/target/${PROJECT_NAME}-${VERSION_VALUE}.war" "${XS_SNAPSHOT_URL}/${PROJECT_NAME}-$VER_WAR.war"
        echo_info "Downloading latest manifest.yml..."
        wget --no-proxy -nv -O "$DEPLOY_SERVICE_DIR/target/manifests/manifest.yml" "${XS_SNAPSHOT_URL}/${PROJECT_NAME}-$VER_WAR-manifest.yml"
}

function update_deploy_service_content {
echo "Printing environemnt"
env
    mkdir -pv $DEPLOY_SERVICE_DIR/target/manifests
    get_latest_war_and_yml
}


function update_on_cf {
  cf push -f $DEPLOY_SERVICE_DIR/target/manifests/${new_manifest_name} -n ${DEPLOY_SERVICE_HOST} --no-start
  cf set-env deploy-service XS_TARGET_URL ${RT_API_ENDPOINT}
  cf restart deploy-service
}

function get_xs_api_endpoint {
        get_xs_endpoint controllerEndpoint
        API_ENDPOINT=${ENDPOINT}
        if [[ -z ${API_ENDPOINT} ]] ; then
            API_ENDPOINT="https://$(hostname -f):30030"
        fi
}

function get_xs_endpoint {
        ENDPOINT_LINE=$(xs version 2>&1 | grep $1)
        IFS='=' read -ra API <<< "$ENDPOINT_LINE"
        ENDPOINT=${API[1]}
}

function update_on_xs {
  cd $DEPLOY_SERVICE_DIR
  (
  set +e
  xs services | grep deploy-service-fss | grep "deploy-service$" 2>&1 >/dev/null
  if [[ $? -ne 0 ]] ; then
        xs cs fs-storage free deploy-service-fss
  fi
  ) 
  xs push -f $DEPLOY_SERVICE_DIR/target/manifests/xs2-manifest.yml --no-start
  get_xs_api_endpoint
  xs set-env deploy-service XS_TARGET_URL ${API_ENDPOINT}
  xs restart deploy-service
  check_status_code "xs push"
}


function generate_local_executable {
    echo $@;
    echo "generating local executable for ${1}"
    local original_path=$1
    local script_name=`basename ${original_path}`
    local original_dir=`dirname ${original_path}`
    local script_location="/var/tmp/${script_name}_$(date +"%m-%d-%y_%H-%M-%S").sh"
    echo "#!/bin/bash" > ${script_location}
    export -p | grep -v -E '(PWD)|(OLDPWD)|(SHELL)|(STORAGE)|(CPU)|(tesi)|(custom\.)|(smtp\.server)|(sl_auto)|(skip\.verifyDVDs)|(report\.recipients\.error)|(repo\.root\.dir)|(production\.server\.location)|(dashboard\.purpose)|(custom\.script\.run\.dir)|(ENV\.SL_AUTO_HOST)|(test\.purpose)' >> ${script_location}
    echo "cd $(pwd)" >> ${script_location}
    echo "eval ${original_path}" >> ${script_location}
    chmod a+x ${script_location};
    echo "re-execute script location is ${script_location}"
}
