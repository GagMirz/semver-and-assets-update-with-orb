#!/bin/bash
# shellcheck disable=SC2154,SC1090
# SC1090 justification: file should be created outside, path is not fixed, can't specify source.
# SC2154 justification: Variable assigned outside of script file(Depends on SC1090).

#######################################
# Source parameters file into bash
# ARGUMENTS:
#   Path to configuration file
#   Is file required or no
# RETURN:
#   0 if print succeeds
#   127 if file is required and missing
#   non-zero on other errors
#######################################
SourceParameters() {
    if [[ -f "${1}" ]]; then
        source "${1}"
    else
        if [[ "${2}" == "required" ]]; then
            exit 127
        fi
    fi

    return 0
}

#######################################
# Create answer variable and insert into shared file 
# GLOBALS:
#   BASH_ENV
# ARGUMENTS:
#   Variable name
#   Variable value
# RETURN:
#   0 if print succeeds
#   non-zero on error.
#######################################
CreateAnswer() {
    echo "export $1=\"$2\"" >>"$BASH_ENV"
    
    return 0
}
