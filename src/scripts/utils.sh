#!/bin/bash

SourceParameters() {
    [[ -f "${cnfp}" ]] && source "${cnfp}" || [[ "${1}" == "required" ]] && exit 127
}
