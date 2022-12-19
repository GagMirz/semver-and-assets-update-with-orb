#!/bin/bash

isSemVer() {
    [[ -z "${1}" ]] && exit 128

    re='^[v0-9]+(\.[0-9]+)*$'
    if [[ $1 =~ $re ]]; then
        echo "true"
    else
        echo "false"
    fi

    return 0
}
