#!/usr/bin/env bats

setup() {
    source ./src/scripts/utils.sh
    load 'test_helper/bats-assert/load'
}

# 1 Should load file when
@test "1.1: config file given, required tag missing " {
    mkdir -p "/home/circleci/"
    touch "/home/circleci/.test.utils.config "
    config_file="/home/circleci/.test.utils.config"

    echo "NEW_PARAMETER=value" > $config_file

    SourceParameters "${config_file}"

    assert_equal "${NEW_PARAMETER}" "value" # Check for no exit error
}