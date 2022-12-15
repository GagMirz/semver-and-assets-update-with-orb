#!/bin/bash
# shellcheck disable=SC2154,SC1090
# SC1090 justification: file should be created outside, path is not fixed, can't specify source.
# SC2154 justification: Variable assigned outside of script file(Depends on SC1090).

SourceParameters() {
    echo 1
    if [[ -f "${cnfp}" ]]; then
        echo 2
        source "${cnfp}"
    else
        echo 3
        [[ "${1}" == "required" ]] && exit 127
    fi
    echo 4
}
