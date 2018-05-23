export PARENT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd );
source $(dirname "${PARENT_DIR}")/test_functions.sh

if [[ -z ${RT_API_ENDPOINT} && ${RT} -eq "xs" ]] ; then
        get_xs_api_endpoint;
        RT_API_ENDPOINT=${API_ENDPOINT};
fi
#Other required input: 
#USER_NAME= to be set
#USER_PASS= to be set
#ORG_NAME to be set
#SPACE_NAME to be set to target space name
#DEFAULT_SPACE_NAME existing space for initial login
#DEFAULT_ORG_NAME existing org for initial login
#RT_HOME to have a value set to CF_HOME or to the directory where the XSCLIENT_CONTEXTFILE resides
#XSCLIENT_CONTEXTFILE or CF_HOME to be already set
#RECREATE_SPACE recreateSpace or YES would trigger recreation
if [[ "${RECREATE_SPACE}" == "recreateSpace"  ||  "${RECREATE_SPACE}" == "YES" ]] ; then
    login "recreateSpace";
else
    login ;
fi

