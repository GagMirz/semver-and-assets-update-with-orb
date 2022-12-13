#!/bin/bash
# shellcheck disable=SC2154
# SC2154 justification: Variable assigned outside of script file.
# shellcheck disable=all

[[ -f $cnfp ]] && source $cnfp

# Add default values
[[ -z $commit_hash ]] && commit_hash=$CIRCLE_SHA1
[[ -z $answer ]] && answer="COMMIT_MESSAGE"

message=$(git log --format=oneline -n 1 $CIRCLE_SHA1)

# :41 to exclude commit hash from msg
echo "export ${answer}=${PULL_REQUEST_BASE_REF:41}" >> "$BASH_ENV"
