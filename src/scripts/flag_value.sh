#!/bin/bash
# shellcheck disable=SC2154,SC1090
# SC1090 justification: file should be created outside, path is not fixed, can't specify source.
# SC2154 justification: Variable assigned outside of script file(Depends on SC1090).

#######################################
# Get given flag value from a string
# ARGUMENTS:
#   String with flags
#   Flag F.E. r/l/some_flag
# OUTPUTS:
#   Value of given flag
# RETURN:
#   non-zero on error
#######################################
get_flag_value() {
    export PYTHONIOENCODING=utf8

    local flag_value
    flag_value=$(python3 -c "import re; \
    text = \"${1}\"; \
    matches = re.findall( \
        r'(?<=[-{1,2}|\/])(?P<name>[a-zA-Z0-9]*)[ |:|\\\"]*(?P<value>[\w]*)(?=[ |\\\"]|$)', \
        text); \
    matches = [argument for argument in matches if argument[0] == \"${2}\"]; \
    value = matches[0][1] if len(matches) else \"\"; \
    print(value);")

    echo "${flag_value}"
    return 0
}

# Will not run if sourced from another script.
# This is done so this script may be tested.
ORB_TEST_ENV="bats-core"
if [ "${0#*"$ORB_TEST_ENV"}" = "$0" ]; then
    # shellcheck source=src/scripts/utils.sh
    source src/scripts/utils.sh
    SourceParameters "${cnfp}" required
    echo "${answer}"

    # Add default values
    [[ -z ${text} ]] && exit 128
    [[ -z ${flag} ]] && exit 128
    [[ -z ${answer} ]] && answer="FLAG_VALUE"

    CreateAnswer "${answer}" "$(get_flag_value "${text}" "${flag}")"
fi
