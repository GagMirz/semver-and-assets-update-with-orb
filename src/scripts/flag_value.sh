#!/bin/bash
# shellcheck disable=SC2154,SC1090
# SC1090 justification: file should be created outside, path is not fixed, can't specify source.
# SC2154 justification: Variable assigned outside of script file(Depends on SC1090).

[[ -f $cnfp ]] && source $cnfp

# Add default values
[[ -z $text ]] && exit 128
[[ -z $flag ]] && exit 128
[[ -z $answer ]] && answer="FLAG_VALUE"

export PYTHONIOENCODING=utf8

PULL_REQUEST_BASE_REF=$(python3 -c "import re; \
text = \"${text}\"; \
matches = re.findall( \
    r'(?<=[-{1,2}|\/])(?P<name>[a-zA-Z0-9]*)[ |:|\\\"]*(?P<value>[\w]*)(?=[ |\\\"]|$)', \
    text); \
matches = [argument for argument in matches if argument[0] == \"${flag}\"];
value = matches[0][1] if len(matches) else \"\"; \
print(value)")

echo "export ${answer}=${PULL_REQUEST_BASE_REF}" >> "$BASH_ENV"
