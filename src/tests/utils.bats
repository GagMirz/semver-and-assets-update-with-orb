#!/usr/bin/env bats

setup() {
    source "./src/scripts/utils.sh"
    
    touch "/home/.bash_test"
    BASH_ENV="/home/{$USER}/.bash_test"
}

# SourceParameters()
# 1 Should load file when
@test "1.1: config file given, required tag missing" {
    mkdir -p "/home/circleci/"
    touch "/home/circleci/.test.utils.config "
    config_file="/home/circleci/.test.utils.config"

    echo "FIRST_PARAMETER=first_value" >$config_file
    echo "SECOND_PARAMETER=second_value" >>$config_file

    SourceParameters "${config_file}"

    [ "${?}" == "0" ]                           # Check status to be 0
    [ -n "${FIRST_PARAMETER}" ]                 # Check for existance
    [ "${FIRST_PARAMETER}" == "first_value" ]   # Check for value
    [ -n "${SECOND_PARAMETER}" ]                # Check for existance
    [ "${SECOND_PARAMETER}" == "second_value" ] # Check for value
}

@test "1.2 config file give, required tag given" {
    mkdir -p "/home/circleci/"
    touch "/home/circleci/.test.utils.config "
    config_file="/home/circleci/.test.utils.config"

    echo "FIRST_PARAMETER=first_value" >$config_file
    echo "SECOND_PARAMETER=second_value" >>$config_file

    SourceParameters "${config_file}" "required"

    [ "${?}" == "0" ]                           # Check status to be 0
    [ -n "${FIRST_PARAMETER}" ]                 # Check for existance
    [ "${FIRST_PARAMETER}" == "first_value" ]   # Check for value
    [ -n "${SECOND_PARAMETER}" ]                # Check for existance
    [ "${SECOND_PARAMETER}" == "second_value" ] # Check for value
}

# 2 Shouldn't load file when
@test "2.1 file path is wrong, required tag missing" {
    run SourceParameters "/some/unknown/path/to_file"

    [ "${status}" == "0" ] # Check status to be 0
}

# 3 Should throw error when
@test "3.1 file path is wrong, required tag given" {
    run SourceParameters "/some/unknown/path/to_file" "required"

    [ "${status}" == "127" ] # Check status to be 127
}

# CreateAnswer()
# 4 Should create invironment variable when
@test "4.1 variable given, value given" {
    CreateAnswer "VariableName" "VariableValue"

    source $BASH_ENV

    [ "${VariableName}" == "VariableValue" ] # Check if variable was created
}
