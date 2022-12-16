#!/usr/bin/env bats

setup() {
    source "./src/scripts/flag_value.sh"
}

# 1 Should return flag value when
@test "1.1 text given, flag given, text contains flag and value" {
    run get_flag_value "some text with -r flag" "r"

    [ "${output}" == "flag" ] # Check flag value to be retrieved
    [ "${status}" == "0" ] # Check status to be 0 # Check status to be 0
}

@test "1.2 text given, flag given, text contains flag and value, two same flags, should return first" {
    run get_flag_value "some text with -r flag -r other_flag" "r"

    [ "${output}" == "flag" ] # Check flag value to be retrieved
    [ "${status}" == "0" ] # Check status to be 0 # Check status to be 0
}

@test "1.3 text given, flag given, text contains flag and value, text contains other flags before given" {
    run get_flag_value "some text with -t tip_flag -f fake_flag -r flag" "r"

    [ "${output}" == "flag" ] # Check flag value to be retrieved
    [ "${status}" == "0" ] # Check status to be 0
}

@test "1.4 text given, flag given, text contains flag and value, text contains other flags after given" {
    run get_flag_value "some text with -r flag -t tip_flag -f fake_flag" "r"

    [ "${output}" == "flag" ] # Check flag value to be retrieved
    [ "${status}" == "0" ] # Check status to be 0
}

@test "1.5 text given, flag given, text contains flag and value, text contains other flags before and after given" {
    run get_flag_value "some text with -t tip_flag -f fake_flag -r flag -n new_flag -m meaningless_flag" "r"

    [ "${output}" == "flag" ] # Check flag value to be retrieved
    [ "${status}" == "0" ] # Check status to be 0
}

# 1 Should return empty string when
@test "2.1 text given, flag given, text doesn't contain given flag and value" {
    run get_flag_value "some text with -t tip_flag -f fake_flag -n new_flag -m meaningless_flag" "r"

    [ "${output}" == "" ] # Check flag value to be empty
    [ "${status}" == "0" ] # Check status to be 0
}

@test "2.2 text given, flag given, text contains given flag but not value" {
    run get_flag_value "some text with -t tip_flag -f fake_flag -n new_flag -m meaningless_flag -r" "r"

    [ "${output}" == "" ] # Check flag value to be empty
    [ "${status}" == "0" ] # Check status to be 0
}

# 3 Should throw error when
@test "3.1 text given, flag not given" {
    run get_flag_value "" "r"

    [ "${status}" == "129" ] # Check status to be 129
    [ "${output}" == "" ] # Check flag value to be empty
}

@test "3.2 text not given, flag given" {
    run get_flag_value "some text with -t tip_flag -f fake_flag -n new_flag -m meaningless_flag" ""

    [ "${status}" == "130" ] # Check status to be 130
    [ "${output}" == "" ] # Check flag value to be empty
}

@test "3.2 text not given, flag not given" {
    run get_flag_value "" ""

    [ "${status}" == "129" ] # Check status to be 129 
    [ "${output}" == "" ] # Check flag value to be empty
}