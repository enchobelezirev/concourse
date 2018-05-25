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

function detect_xs_root {
    XS_ROOT="$(dirname $(dirname $(realpath $(which xs))))"
	echo "${XS_ROOT}"
}

function update_xs_cli_plugin {
    get_latest_version    
    # XS_CLIENT_PATH=`whereis xs | sed -n 's/^xs: \(\/.*\)\/bin\/.*$/\1/p'`;
    local xs_root="$(detect_xs_root)"
    echo_info "detected xs root directory: ${xs_root}"
    local CLI_PLUGIN_DIR="${xs_root}/jars/cli-plugins/ds"    
    echo_info "deleting deploy-service client plugin jars in $CLI_PLUGIN_DIR"
    rm -rfv $CLI_PLUGIN_DIR/*jar
    #echo_info "adding slf4j jars"
    #cp "${ROOT_SCRIPTS_DIR}/setup_resources/slf4j-jars/*" "$CLI_PLUGIN_DIR/"
    echo_info "Latest version of cli plugin is ${VERSION_VALUE}"
    local XS_BUILD_ASSEMBLY_VERSION_URL="${NEXUS_URL}content/repositories/build.snapshots/com/sap/cloud/lm/sl/xs2/com.sap.cloud.lm.sl.xs2.cmd.assembly/${VERSION_VALUE}"
    echo "XS_BUILD_ASSEMLBY_VERSION_URL=${XS_BUILD_ASSEMBLY_VERSION_URL}"
    local XS_BUILD_ASSEMBLY_META_URL="${XS_BUILD_ASSEMBLY_VERSION_URL}/maven-metadata.xml"
    local XS2_ASSEMBLY="com.sap.cloud.lm.sl.xs2.cmd.assembly"
    download_and_extract_version_from_concrete_metadata ${XS_BUILD_ASSEMBLY_META_URL}
    local cli_version_value=$VER
    echo_info "Downloading latest cli-plugin for version ${cli_version_value}..."
    wget --no-proxy -O "${DEPLOY_SERVICE_DIR}/${XS2_ASSEMBLY}-${cli_version_value}-all.zip" "${XS_BUILD_ASSEMBLY_VERSION_URL}/${XS2_ASSEMBLY}-${cli_version_value}-all.zip"
    unzip "${DEPLOY_SERVICE_DIR}/${XS2_ASSEMBLY}-${cli_version_value}-all.zip" -d "${CLI_PLUGIN_DIR}"
}

function check_status_code {
        if [ $? -ne 0 ]; then
                echo_error "Operation $1 failed."
                download_deploy_service_logs
                exit 1
        fi
}

function enable_opaque_tokens_on_xs {
    echo "Detecting XS Location folder..."
    detect_xs_root
    echo "XS Location detected: ${XS_ROOT}"
    # echo "Detecting xs command..."
    # ${XS_ROOT}/bin/xs target
    # check_status_code "${XS_ROOT}/bin/xs target"
    # if [ "$?" -ne 0 ]; then
    #     echo "XS command not found in ${XS_ROOT}/bin/xs"
    #     exit 1
    # fi
    # echo "XS Script location: ${XS_ROOT}/bin/xs"
    # echo "Testing XS script agains oauth-token command..."
    # TOKEN=$(xs oauth-token)
    # echo $TOKEN
    echo "Changing xs script to support opaque tokens..."
    OPAQUE_TOKEN_ENABLE_STRING="-Dcom.sap.xs2rt.client.opaqueToken=true"
    cat ${REPLACEMENT_XS_SCRIPT}
    rm -rf ${XS_ROOT}/bin/xs
    mv ${REPLACEMENT_XS_SCRIPT} ${XS_ROOT}/bin/
    echo "XS script changed."
    cat ${XS_ROOT}/bin/xs
    # echo "Validating that the opaque-tokens are supported..."
    # OPAQUE_TOKEN=$(xs oauth-token)
    # echo $OPAQUE_TOKEN
    # if [[ $TOKEN == $OPAQUE_TOKEN ]]; then
    #     echo "Token not changed successfully. Fisrt token: ${TOKEN}, expected opaque token but got: ${OPAQUE_TOKEN}"
    #     exit 1
    # fi
}

function disable_opaque_tokens_on_xs {
    echo "Detecting XS Location folder..."
    detect_xs_root
    echo "XS Location detected: ${XS_ROOT}"
    echo "Detecting xs command"
    # ${XS_ROOT}/bin/xs target
    # check_status_code "${XS_ROOT}/bin/xs target"
    # if [ "$?" -ne 0 ]; then
    #     echo "XS command not found in ${XS_ROOT}/bin/xs"
    #     exit 1
    # fi
    # echo "XS Script location: ${XS_ROOT}/bin/xs"
    # echo "Testing XS script agains oauth-token command..."
    # OPAQUE_TOKEN=$(xs oauth-token)
    # echo $OPAQUE_TOKEN
    echo "Changing xs script not to support opaque tokens..."
    OPAQUE_TOKEN_ENABLE_STRING=""
    cat ${REPLACEMENT_XS_SCRIPT}
    rm -rf ${XS_ROOT}/bin/xs
    mv ${REPLACEMENT_XS_SCRIPT} ${XS_ROOT}/bin/
    echo "XS script changed."
    echo "Validating that the opaque-tokens are supported..."
    TOKEN=$(xs oauth-token)
    echo $TOKEN
    if [[ $TOKEN == $OPAQUE_TOKEN ]]; then
        echo "Token not changed successfully. Fisrt token: ${OPAQUE_TOKEN}, expected jwt token but got: ${TOKEN}"
        exit 1
    fi
}

function login {
    local recreate_space="${1}"

    if [[ ! -d "${RT_HOME}" ]] ; then
        mkdir -pv "${RT_HOME}" 
    fi
    
    ${RT} logout;    
    #using deploy-service/oq-tests default target to achieve login.
    ${RT} login -a ${RT_API_ENDPOINT} -u "${USER_NAME}" -p "${USER_PASS}" --skip-ssl-validation -o "${DEFAULT_ORG}" -s "${DEFAULT_SPACE}"
    if [ $? -ne 0 ] ; then
        echo_error "Could not log-in : -a ${RT_API_ENDPOINT} -u ${USER_NAME}"
        return 1;
    fi
    
    ${RT} t -o "${ORG_NAME}" -s "${SPACE_NAME}" 
    local target_rc=$?;
    if [[ "${recreate_space}" != "recreateSpace" ]] ; then
        if [ $target_rc -eq 0 ] ; then 
            return 0;
        else
            echo_error "Targeting -o ${ORG_NAME} -s ${SPACE_NAME} failed and no RECREATE_SPACE is set"
            return 1;
            
        fi
    fi

    ${RT} space "${SPACE_NAME}";
    if [[ $? -eq 0 ]] && [[ ${target_rc} -eq 0 ]] ; then
        delete_space_content ${RT} "${SPACE_NAME}"
    fi
    ${RT} create-space "${SPACE_NAME}" -o "${ORG_NAME}"
    ${RT} set-space-role "${USER_NAME}" "${ORG_NAME}" "${SPACE_NAME}" SpaceDeveloper
    ${RT} target -o "${ORG_NAME}" -s "${SPACE_NAME}"
    target_rc=$?
    echo_info "Space ${SPACE_NAME} creation return code: ${target_rc}"
    return ${target_rc};
}

function delete_space_content() {
        #if successfully targeted
        local RT=${1};
        local SPACE_NAME=${2};
        
        delete_services ${RT}
        delete_applications ${RT}     
}

function delete_services {
    local RT=${1}
    # Delete leftover services
    services=$(${RT} services | grep -vE 'Getting|Found|name|-------*' | cut -d ' ' -f 1)
    # Create an array
    services=(${services// /})
    echo_info "Services to delete: " ${services[@]}
    for ((x=0; x<${#services[@]}; x++)) ; do
        ${RT} ds ${services[x]} -f || true
    done
}

function delete_applications {

    local RT=${1}
    # Delete leftover applications (TODO why skip the auditlog?)
    applications=$(${RT} apps | grep -vE 'Getting|Found|name|-------*' | cut -d ' ' -f 1)
    # Create an array
    applications=(${applications// /})
    echo_info "Applications to delete: " ${applications[@]}
    for ((x=0; x<${#applications[@]}; x++));
      do
       ${RT} d ${applications[x]} -f || true
      done
}
