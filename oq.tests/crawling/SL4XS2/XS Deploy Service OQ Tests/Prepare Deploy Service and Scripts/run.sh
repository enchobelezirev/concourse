#!/bin/bash
script_dir="$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"
cd "${script_dir}";
source "${script_dir}/env.sh"
paralelJobs=();
rc=0;
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Refresh Hana"
bash "Refresh Hana/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Refresh Hana";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Recreate Working Directory"
bash "Recreate Working Directory/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Recreate Working Directory";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Login and Target"
bash "Login and Target/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Login and Target";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Free Allocated Ports"
bash "Free Allocated Ports/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Free Allocated Ports";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Delete File System Service"
bash "Delete File System Service/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Delete File System Service";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Update Deploy Service"
bash "Update Deploy Service/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Update Deploy Service";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Update CF CLI Plugins"
bash "Update CF CLI Plugins/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Update CF CLI Plugins";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Recreate Database Service"
bash "Recreate Database Service/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/Recreate Database Service";
exit 1; fi
echo "[INF]Running substep ./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/purge mta configurations"
bash "purge mta configurations/run.sh";
if [[ $? -ne 0 ]] ; then 
echo "EXECUTION FAILED!./SL4XS2/XS Deploy Service OQ Tests/Prepare Deploy Service and Scripts/purge mta configurations";
exit 1; fi
exit $rc;
