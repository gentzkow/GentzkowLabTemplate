#!/bin/bash   

unset run_shell
run_shell () {

    # get arguments
    program="$1"
    logfile="$2"

    # set shell command
    shellCmd="$(basename "${SHELL}")"

    # run program, add output to logfile
    echo "Executing: ${shellCmd} ${program}"
    (
        ${shellCmd} ${program} >> "${logfile}"

        # report on errors
        return_code=$?
        if [ $return_code -ne 0 ]; then
            # Log an error message if the command failed
            echo "Error: ${program} failed with exit code $return_code"
        fi
    )
}
