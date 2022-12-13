#!/bin/bash
# shellcheck disable=SC2154
# SC2154 justification: Variable assigned outside of script file.
# shellcheck disable=all
echo $commit_hash

[[ -f $cnfp ]] && source $cnfp
echo $commit_hash
# Add default values
[[ -z $commit_hash ]] && commit_hash=$CIRCLE_SHA1
echo $commit_hash

[[ -z $answer ]] && answer="COMMIT_MESSAGE"

message=$(git log --format=oneline -n 1 $CIRCLE_SHA1)
echo $answer
# :41 to exclude commit hash from msg
echo "export ${answer}=${message:41}" >> "$BASH_ENV"
