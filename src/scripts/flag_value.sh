#!/bin/bash

export PYTHONIOENCODING=utf8
# shellcheck disable=SC2154
PULL_REQUEST_BASE_REF=$(python3 -c "import sys, json, re; \
text=\"${text}\"; \
print(text); \
matches=re.findall( \
'(?<=[-{1,2}|\/])(?P<name>[a-zA-Z0-9]*)[ |:|\"]*(?P<value>[\w|.|?|=|&|+| |:|\/|\\]*)(?=[ |\"]|$)', \
text); \
value=[argument for argument in matches if argument[0] == \"${flag}\"][0][1]; \
print(value)")
# shellcheck disable=SC2154
echo "export ${answer}=${PULL_REQUEST_BASE_REF}" >> "$BASH_ENV"
