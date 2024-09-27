#!/bin/bash   

# Trap to handle shell script errors 
trap 'error_handler' ERR
error_handler() {
    error_time=$(date '+%Y-%m-%d %H:%M:%S')
    echo -e "\n\033[0;31mWarning\033[0m: make.sh failed at ${error_time}. Check above for details." # display warning in terminal
    exit 1 # early exit with error code
}

# Set paths
# (Make sure REPO_ROOT is set to point to the root of the repository!)
MAKE_SCRIPT_DIR=$(dirname "$(realpath "$0")")
REPO_ROOT=$(realpath "$MAKE_SCRIPT_DIR/../")
MODULE=$(basename "$MAKE_SCRIPT_DIR")
LOGFILE="${MAKE_SCRIPT_DIR}/output/make.log"

# Check setup
source "${REPO_ROOT}/lib/shell/check_setup.sh"

# Tell user what we're doing
echo -e "\n\nMaking module \033[35m${MODULE}\033[0m with shell ${SHELL}"

# Load settings & tools
source "${REPO_ROOT}/local_env.sh"
source "${REPO_ROOT}/lib/shell/run_shell.sh"
#source "${REPO_ROOT}/lib/shell/run_xxx.sh"

# Clear output directory
# (Guarantees that all output is produced from a clean run of the code)
rm -rf "${MAKE_SCRIPT_DIR}/output"
mkdir -p "${MAKE_SCRIPT_DIR}/output"

# Copy and/or symlink input files to local /input/ directory
# (Make sure this section is updated to pull in all needed input files!)
rm -rf "${MAKE_SCRIPT_DIR}/input"
mkdir -p "${MAKE_SCRIPT_DIR}/input"
# cp my_source_files "${MAKE_SCRIPT_DIR}/input/"

# Run scripts
# (Do this in a subshell so we return to the original working directory
# after scripts are run)
 echo -e "\nmake.sh started at $(date '+%Y-%m-%d %H:%M:%S')"

(
 trap 'error_handler' ERR # reactivate trap in subshell

cd "${MAKE_SCRIPT_DIR}/source"

run_shell my_shell_script.sh "${LOGFILE}"
# run_xxx my_script.xx "${LOGFILE}"
)

cd "${MAKE_SCRIPT_DIR}" # return to original working directory

echo -e "\nmake.sh finished at $(date '+%Y-%m-%d %H:%M:%S')" | tee -a "${LOGFILE}"
