#!/bin/bash
# shellcheck disable=all
# SC2154 justification: Variable assigned outside of script file.

[[ -f $cnfp ]] && source $cnfp

# Add default values
[[ -z $username ]] && username="${CIRCLE_PROJECT_USERNAME}"
[[ -z $repository ]] && repository="${CIRCLE_PROJECT_REPONAME}"
[[ -z $token ]] && token="${GITHUB_TOKEN}"
[[ -z $answer ]] && answer="TAG"

echo $CIRCLE_PROJECT_USERNAME
echo $CIRCLE_PROJECT_REPONAME
echo $GITHUB_TOKEN
echo $username
echo $repository
echo $token
echo $answer

cat $BASH_ENV

tag=`curl https://api.github.com/repos/${username}/${repository}/releases/latest -s  --header \"Authorization\" $token| jq .name -r`
echo "export ${answer}=${tag}" >> "$BASH_ENV"
