#!/bin/bash   
set -e

# Set paths
# (Make sure REPO_ROOT is set to point to the root of the repository!)
MAKE_SCRIPT_DIR=$(dirname "$(realpath "$0")")
REPO_ROOT=$(realpath "$MAKE_SCRIPT_DIR/../")
MODULE=$(basename "$MAKE_SCRIPT_DIR")
LOGFILE="${MAKE_SCRIPT_DIR}/output/make.log"

# Tell user what we're doing
echo -e "\n\nMaking \033[35m${MODULE}\033[0m module with shell: ${SHELL}"

# Check setup; load settings & tools
source "${REPO_ROOT}/lib/shell/check_setup.sh"
source "${REPO_ROOT}/local_env.sh"

# Define the input and output directories
SLIDES_SOURCE=${REPO_ROOT}/extensions/powerpoint

echo "Executing: run_pptx.sh"
${SLIDES_SOURCE}/run_pptx.sh