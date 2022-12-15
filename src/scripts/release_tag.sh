#!/bin/bash
# shellcheck disable=SC2154,SC1090
# SC1090 justification: file should be created outside, path is not fixed, can't specify source.
# SC2154 justification: Variable assigned outside of script file(Depends on SC1090).

# shellcheck source=src/scripts/utils.sh
source src/scripts/utils.sh
SourceParameters

# Add default values
[[ -z "${username}" ]] && username="${CIRCLE_PROJECT_USERNAME}"
[[ -z "${repository}" ]] && repository="${CIRCLE_PROJECT_REPONAME}"
[[ -z "${token}" ]] && token=""
[[ -z "${answer}" ]] && answer="TAG"

get_release_tag() {
    local tag
    tag=$(curl "https://api.github.com/repos/${username}/${repository}/releases/latest" -s -H "Authorization: ${token}" | jq .name -r)

    echo "${tag}"
}

CreateAnswer "${answer}" "$(get_release_tag)"
