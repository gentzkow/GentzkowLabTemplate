#!/bin/bash   
set -e

# Set paths
# (Make sure REPO_ROOT is set to point to the root of the repository!)
MAKE_SCRIPT_DIR=$(dirname "$(realpath "$0")")
REPO_ROOT=$(realpath "$MAKE_SCRIPT_DIR/../")
MODULE=$(basename "$MAKE_SCRIPT_DIR")
LOGFILE="${MAKE_SCRIPT_DIR}/output/make.log"

# Check setup
source "${REPO_ROOT}/lib/shell/check_setup.sh"

# Load settings & tools
source "${REPO_ROOT}/local_env.sh"
source "${REPO_ROOT}/lib/shell/run_shell.sh"
#source "${REPO_ROOT}/lib/shell/run_python.sh"
#source "${REPO_ROOT}/lib/shell/run_stata.sh"
#source "${REPO_ROOT}/lib/shell/run_R.sh"
#source "${REPO_ROOT}/lib/shell/run_latex.sh"

# Clear output directory
# (Guarantees that all output is produced from a clean run of the code)
rm -rf "${MAKE_SCRIPT_DIR}/output"
mkdir -p "${MAKE_SCRIPT_DIR}/output"

# Copy and/or symlink input files to local /input/ directory
# (Make sure this section is updated to pull in all needed input files!)
rm -rf "${MAKE_SCRIPT_DIR}/input"
mkdir -p "${MAKE_SCRIPT_DIR}/input"
# cp "${REPO_ROOT}/1_data/output/mydata_cleaned.csv" "${MAKE_SCRIPT_DIR}/input"

# Tell user what we're doing
echo -e "\n\nMaking module \033[35m${MODULE}\033[0m with shell ${SHELL}"

# Run scripts
# (Do this in a subshell so we return to the original working directory
# after scripts are run)
(
    cd "${MAKE_SCRIPT_DIR}"
    echo -e "make.sh started at $(date '+%Y-%m-%d %H:%M:%S')"

    cd source
    run_shell my_shell_script.sh "${LOGFILE}"
	# run_python my_python_script.py "${LOGFILE}"
	# run_R my_r_script.R "${LOGFILE}"
	# run_stata my_r_script.do "${LOGFILE}"
    # run_latex my_latex_file.tex "${LOGFILE}"

) 2>&1 | tee "${LOGFILE}"

echo -e "make.sh finished at $(date '+%Y-%m-%d %H:%M:%S')" | tee -a "${LOGFILE}"
