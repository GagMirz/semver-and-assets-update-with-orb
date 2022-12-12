#!/bin/bash

export PYTHONIOENCODING=utf8
# shellcheck disable=SC2154
PULL_REQUEST_BASE_REF=$(python3 -c "import sys, json, re; \
title=sys.argv[1]; \
matches=re.findall( \
'(?<=[-{1,2}|\/])(?P<name>[a-zA-Z0-9]*)[ |:|\"]*(?P<value>[\w|.|?|=|&|+| |:|\/|\\]*)(?=[ |\"]|$)', \
title); \
release=[argument for argument in matches if argument[0] == \"${flag_name}\"][0][1];"
${text})

echo "export ${answer_variable}=${PULL_REQUEST_BASE_REF}" >> "$BASH_ENV"
