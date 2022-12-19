#!/bin/bash
# shellcheck disable=SC2154,SC1090
# SC1090 justification: file should be created outside, path is not fixed, can't specify source.
# SC2154 justification: Variable assigned outside of script file(Depends on SC1090).

#######################################
# Get commit message
# ARGUMENTS:
#   Commit hash
# OUTPUTS:
#   Commit message with excluded commit hash
# RETURN:
#   non-zero on error
#######################################
get_commit_message() {
    [[ -z "${1}" ]] && exit 128

    local message
    message=$(git log --format=oneline -n 1 "${1}")

    # :41 to exclude commit hash from msg
    echo "${message:41}"

    return 0
}

# Will not run if sourced from another script.
# This is done so this script may be tested.
ORB_TEST_ENV="bats-core"
if [ "${0#*"$ORB_TEST_ENV"}" = "$0" ]; then
    # Import utils.
    eval "$SCRIPT_UTILS"
    SourceParameters "${cnfp}"

    # Add default values
    [[ -z "${commit_hash}" ]] && commit_hash=$CIRCLE_SHA1
    [[ -z "${answer}" ]] && answer="COMMIT_MESSAGE"

    CreateAnswer "${answer}" "$(get_commit_message "${commit_hash}")"
fi
