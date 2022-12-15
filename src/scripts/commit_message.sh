#!/bin/bash
# shellcheck disable=SC2154,SC1090
# SC1090 justification: file should be created outside, path is not fixed, can't specify source.
# SC2154 justification: Variable assigned outside of script file(Depends on SC1090).

# shellcheck source=src/scripts/utils.sh
source src/scripts/utils.sh
SourceParameters

# Add default values
[[ -z "${commit_hash}" ]] && commit_hash=$CIRCLE_SHA1
[[ -z "${answer}" ]] && answer="COMMIT_MESSAGE"

get_commit_message() {

    local message
    message=$(git log --format=oneline -n 1 "${commit_hash}")

    # :41 to exclude commit hash from msg
    echo "${message:41}"
}

CreateAnswer "${answer}" "$(get_commit_message)"
