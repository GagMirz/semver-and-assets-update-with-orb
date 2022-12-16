#!/bin/bash
# shellcheck disable=SC2154,SC1090
# SC1090 justification: file should be created outside, path is not fixed, can't specify source.
# SC2154 justification: Variable assigned outside of script file(Depends on SC1090).

# 1 is configuration file required or not
SourceParameters() {
    if [[ -f "${1}" ]]; then
        source "${2}"
    else
        if [[ "${2}" == "required" ]]; then
            exit 127
        fi
    fi
}

# 1 variable name
# 2 variable value
CreateAnswer() {
    echo "export $1=\"$2\"" >>"$BASH_ENV"
}
