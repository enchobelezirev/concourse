#!/bin/bash
if [[ -z ${ROOT_NODE_ID} ]] ; then 
    export ROOT_NODE_ID=1441615753858 #1441615753858 SL4XSA node' 
    #80284131774 xsa deploy-service root node
    #1481282999264 CF CANARY root node
fi
if [[ -z ${SKIP_DISABLED_NODES} ]] ; then 
    export SKIP_DISABLED_NODES=true
fi

function generateParalelNodeVarName(){
    echo "_${1}_isNodeParallel"
}

#CAUTION - UGGLY LOGGIC AHEAD! If the variable is set with any value, each crawled sub-node will be evaluated for parallel execution and the result will be set for it's children. If variable is not set - no evaluation will take place, on the root and children nodes. 
if [[ ! -z ${GENERATE_PARALEL_SCRIPTS} ]] ; then 
    export GENERATE_PARALEL_SCRIPTS="$(generateParalelNodeVarName ${ROOT_NODE_ID})";
fi

#Recursive crawler function
function crawlNode {
    local nodeId="$1";
    local parentsPath="$2";
    local __isNodeParallelVar="$3"
    
    echo "[INF]Crawling ${nodeId}"
    local nodeDetails=$(curl -s https://crs.sap.corp:44233/tesi_ui/services/action/getProperties/${nodeId}/false?_=0)
    
    #processing node properties
    local nodeName=$(echo $nodeDetails | jq '."general"."name"')
    nodeName="${nodeName%\"}";
    nodeName="${nodeName#\"}";
    local nodePath="${parentsPath}/${nodeName}"
    echo "[INF]node :${nodePath}";
    
    if [[ ! -z "${__isNodeParallelVar}" ]] ; then 
        local isNodeParallel=$(echo $nodeDetails | jq '."general"."runInParallel"')
        echo "[DBG] setting ${__isNodeParallelVar}=${isNodeParallel}";
        eval "${__isNodeParallelVar}=${isNodeParallel}";
    fi
    
    mkdir -p "${nodeName}";
    cd "${nodeName}"
    local nodeDir="$(pwd)";
    
    #setup node environment script
    local envScript="${nodeDir}/env.sh"
    echo "#!/bin/bash">"${envScript}" #recreate file
    #source environment scripts up in the hierarchy
    echo 'current_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"'>>"${envScript}";
    echo 'parent_dir="$(dirname -- "${current_dir}")";'>>"${envScript}";
    echo 'if [ -f "${parent_dir}/env.sh" ] ; then'>>"${envScript}";
    echo '        source "${parent_dir}/env.sh";'>>"${envScript}";
    echo 'fi'>>"${envScript}";
    echo 
    echo "export STEP_PATH=\""'${STEP_PATH}/'"${nodeName}\"">>"${envScript}";
    #add environment modelled as tesi properties
    local nodeEnv=$(echo $nodeDetails | jq '."environment"');
    if [[ "${nodeEnv}" != "null" ]];  then
        echo "${nodeEnv}" | #filters tesi.metadata.in.this.format
        jq '."properties"| from_entries | to_entries[] | if (."key"|test("[.]")) then empty else [.key,(.value|tostring)]|join("=") end' |
        sed 's/${TESI_PROP}(\([a-zA-z 0-9]*\))/${\1}/g' | #removes the ${TESI_PARAM}(REFERENCE) and replaces it with real reference
        sed 's/^\"/export /g' | # "VAR=VAL" => export VAR="VAL" 
        sed 's/=/="/g' >>"${envScript}"
    else
        echo "[DBG]no custom env for node"
    fi
    
    #create run script
    local nodeRunScript="${nodeDir}/run.sh";
    echo "#!/bin/bash">"${nodeRunScript}" #recreate file
    echo 'script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"'>>"${nodeRunScript}";
    echo 'cd "${script_dir}";'>>"${nodeRunScript}"
    echo 'source "${script_dir}/env.sh"'>>"${nodeRunScript}";
    chmod a+x "${nodeRunScript}";
    
    if [[ "$(echo ${nodeDetails} | jq '."step"."type"=="execute_script"')" == "true" ]] ; then
        #if step is calling script
        local nodeProps=$(echo ${nodeDetails} | jq '."step"."properties"')
        local scriptRuntimeDir="$(echo ${nodeProps} | jq 'map(select(."type"=="STEP")|select(."key"=="custom.script.run.dir"))|.[]|."value"')"
        if [ -n ${scriptRuntimeDir} ] ; then
            echo "cd ${scriptRuntimeDir}">>"${nodeRunScript}"
        fi
        local executable="$(echo ${nodeProps} | jq 'map(select(."type"=="STEP")|select(."key"=="custom.script.name"))|.[]|."value"')"
        #echo "[DBG]detected executable script ${executable} executed in ${scriptRuntimeDir}";
        echo "bash ${executable}">>"${nodeRunScript}"
        echo 'if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";'>>"${nodeRunScript}";
        echo 'mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! '"${nodePath}"'" -v dimitar.donchev@sap.com <<<'"${nodePath}"';' >> "${nodeRunScript}";
        echo 'exit 1; fi'>>"${nodeRunScript}"
    fi;
    if [[ "$(echo ${nodeDetails} | jq '."step"."type"=="shell_command"')" == "true" ]] ; then
        #step is a shell command
        local commands="$(echo ${nodeDetails} | jq '."step"."commands"')"
        #echo "[DBG]detected commands source ${commands}";
        commands="${commands%\"}";
        commands="${commands#\"}";
        commands="$(echo ${commands}| sed 's/\\"/"/g')" #wondering why this works? here be dragons
        commands="$(echo ${commands}| sed 's/\\n/\n/g')"
        #echo "[DBG]detected commands result ${commands}";
        echo "${commands}">"${nodeRunScript}_commands";
        echo "bash -ex '${nodeRunScript}_commands'">> "${nodeRunScript}";
        echo 'if [[ $? -ne 0 ]] ; then echo "EXECUTION FAILED!";' >> "${nodeRunScript}";
        echo 'mailx -S smtp=mail.sap.corp -s "EXECUTION FAILED! '"${nodePath}"'" -v dimitar.donchev@sap.com <<<'"${nodePath}"';' >> "${nodeRunScript}";
        echo 'exit 1; fi'>>"${nodeRunScript}"
    fi  
    
    #stop processing if node is a leaf
    local nodeType=$(echo $nodeDetails | jq '."general"."type"')
    if [[ ${nodeType} != *"CONTAINER"* ]] ; then
        return;  
    fi
    #only used if a parallel script is being generated
    echo 'paralelJobs=();'>>"${nodeRunScript}" 
    echo 'rc=0;'>>"${nodeRunScript}" 
    local parallelStepsFound=false;
    #processing node children
    local node_children=$(curl -s https://crs.sap.corp:44233/tesi_ui/services/model/getchilds/${nodeId}?0.0) 
    node_children=$(echo $node_children | jq '."0"');
    childrenIndexes=$(echo $node_children | jq 'keys|map(select(.|test("^[0123456789]*$")))')
    childrenIndexes=${childrenIndexes%]}
    childrenIndexes=${childrenIndexes#[}
    local array=(${childrenIndexes//,/ })
    #echo "[DBG] detected children indexes ${array[@]}"
    for i in ${array[@]}; do
        cd "${nodeDir}";
        local node=$(echo ${node_children} | jq .$i) ;
        local subId=$(echo $node | jq '."id"')
        local name=$(echo $node | jq '."name"')
        local enabled=$(echo $node | jq '."enabled"')   
        echo "SubNode ${i} with name ${name} and id ${subId} enabled: ${enabled}"
        name="${name%\"}";
        name="${name#\"}";
        subId="${subId%\"}"
        subId="${subId#\"}"
        
        if [[ "${enabled}" == *"false"* && ${SKIP_DISABLED_NODES} == true ]]  ; then
            echo "skipping node ${name}!"
            continue; 
        fi

        echo "echo \"[INF]Running substep ${nodePath}/${name}\"">>"${nodeRunScript}";

        if [[ -z "${__isNodeParallelVar}" ]] ; then
            crawlNode "${subId}" "${nodePath}"
            echo "bash \"${name}/run.sh\";">>"${nodeRunScript}";
            #in non parallel execution, failure prevents the next steps execution=> exit 1;
            echo 'if [[ $? -ne 0 ]] ; then '>>"${nodeRunScript}";
            echo 'echo "EXECUTION FAILED!'"${nodePath}/${name}"'";'>>"${nodeRunScript}";
            echo 'exit 1; fi'>>"${nodeRunScript}";
        else
            #a script supporting parallelization is being generated:
            local parallelVarName="$(generateParalelNodeVarName ${subId})";
            eval "export ${parallelVarName}=\"\""
            crawlNode "${subId}" "${nodePath}" "${parallelVarName}"
            local isNodeParallel="$(eval echo \"'$'${parallelVarName}\")";
            if [[ "${isNodeParallel}" == "true" ]] ; then
                echo "bash \"${name}/run.sh\" & paralelJobs+=(\$!)">>"${nodeRunScript}";
                parallelStepsFound=true;
            else
                echo "bash \"${name}/run.sh\";">>"${nodeRunScript}";
                echo 'if [[ $? -ne 0 ]] ; then  rc=1; '>>"${nodeRunScript}";
                echo 'echo \"EXECUTION FAILED! '"${nodePath}/${name}"'\";'>>"${nodeRunScript}";
                echo 'fi'>>"${nodeRunScript}";
            fi
        fi
    done
    if [[ ! -z "${__isNodeParallelVar}" && "${parallelStepsFound}" == "true" ]] ; then
        echo 'for step in ${paralelJobs[@]} ; do wait $step; if [[ $? != 0 ]] ; then rc=1; echo \"EXECUTION FAILED! One or more parallel sub-steps of '"${nodePath}"' failed\"; fi done'>>"${nodeRunScript}"
    fi
    echo 'exit $rc;'>>"${nodeRunScript}" 
}

type jq ;
if [[ $? -ne 0 ]] ; then
     echo 'downloading jq' 
     wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -nv -O /usr/bin/jq ; chmod a+x /usr/bin/jq
fi

#Start execution
crawlNode "${ROOT_NODE_ID}" "." "${GENERATE_PARALEL_SCRIPTS}"

