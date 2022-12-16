#!/usr/bin/env bats

setup() {
    source "./src/scripts/utils.sh"
}

# 1 Should load file when
@test "1.1: config file given, required tag missing " {
    mkdir -p "/home/circleci/"
    touch "/home/circleci/.test.utils.config "
    config_file="/home/circleci/.test.utils.config"

    echo "FIRST_PARAMETER=first_value" > $config_file
    echo "SECOND_PARAMETER=second_value" >> $config_file

    SourceParameters "${config_file}"

    [ -n "${FIRST_PARAMETER}" ] # CHeck for existance
    [ "${FIRST_PARAMETER}" == "first_value" ] # Check for value
    [ -n "${SECOND_PARAMETER}" ] # CHeck for existance
    [ "${SECOND_PARAMETER}" == "second_value" ] # Check for value
}

@test "1.2 config file give, required tag given" {
    mkdir -p "/home/circleci/"
    touch "/home/circleci/.test.utils.config "
    config_file="/home/circleci/.test.utils.config"

    echo "FIRST_PARAMETER=first_value" > $config_file
    echo "SECOND_PARAMETER=second_value" >> $config_file

    SourceParameters "${config_file}" "required"

    [ -n "${FIRST_PARAMETER}" ] # CHeck for existance
    [ "${FIRST_PARAMETER}" == "first_value" ] # Check for value
    [ -n "${SECOND_PARAMETER}" ] # CHeck for existance
    [ "${SECOND_PARAMETER}" == "second_value" ] # Check for value
}