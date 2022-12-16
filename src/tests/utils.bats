#!/usr/bin/env bats

setup() {
    source "./src/scripts/utils.sh"
}

# 1 Should load file when
@test "1.1: config file given, required tag missing" {
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

    run SourceParameters "${config_file}" "required"

    [ "${status}" == "0" ]
    [ -n "${FIRST_PARAMETER}" ] # CHeck for existance
    [ "${FIRST_PARAMETER}" == "first_value" ] # Check for value
    [ -n "${SECOND_PARAMETER}" ] # CHeck for existance
    [ "${SECOND_PARAMETER}" == "second_value" ] # Check for value
}

# 2 Shouldn't load file when
@test "2.1 file path is wrong, required tag missing" {
    run SourceParameters "/some/unknown/path/to_file"

    [ "${status}" == "0" ]
}

# 3 Should throw error when
@test "3.1 file path is wrong, required tag missing" {
    run SourceParameters "/some/unknown/path/to_file" "required"

    [ "${status}" == "127" ]
}
