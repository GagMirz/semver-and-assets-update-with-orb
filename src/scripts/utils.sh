#!/bin/bash
# SC2206,SC2236 justification: Meaningless warning/error. 
# SC1090 justification: file should be created outside, path is not fixed, can't specify source.
# SC2154 justification: Variable assigned outside of script file(Depends on SC1090).

SourceParameters() {
    [[ -f "${cnfp}" ]] && source "${cnfp}" || [[ "${1}" == "required" ]] && exit 127
}
