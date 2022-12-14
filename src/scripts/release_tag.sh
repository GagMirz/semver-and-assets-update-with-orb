#!/bin/bash

[[ -f $cnfp ]] && source $cnfp

# Add default values
[[ -z $username ]] && username="${CIRCLE_PROJECT_USERNAME}"
[[ -z $repository ]] && repository="${CIRCLE_PROJECT_REPONAME}"
[[ -z $token ]] && token=""
[[ -z $answer ]] && answer="TAG"


tag=`curl https://api.github.com/repos/${username}/${repository}/releases/latest -s -H "Authorization: ${token}"| jq .name -r`
echo "export ${answer}=${tag}" >> "$BASH_ENV"
