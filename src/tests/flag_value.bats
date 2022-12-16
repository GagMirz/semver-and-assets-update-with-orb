#!/usr/bin/env bats

setup() {
    source "./src/scripts/flag_value.sh"
}

# 1 Should return flag value when
@test "1.1 text given, flag given, text contains flag and value" {
    run get_flag_value "some text with -r flag" "r"

    [ "${output}" == "flag" ]
    [ "${status}" == "0" ]
}

@test "1.2 text given, flag given, text contains flag and value, two same flags, should return first" {
    run get_flag_value "some text with -r flag -r other_flag" "r"

    [ "${output}" == "flag" ]
    [ "${status}" == "0" ]
}

@test "1.3 text given, flag given, text contains flag and value, text contains other flags before given" {
    run get_flag_value "some text with -t tip_flag -f fake_flag -r flag" "r"

    [ "${output}" == "flag" ]
    [ "${status}" == "0" ]
}

@test "1.3 text given, flag given, text contains flag and value, text contains other flags after given" {
    run get_flag_value "some text with -r flag -t tip_flag -f fake_flag" "r"

    [ "${output}" == "flag" ]
    [ "${status}" == "0" ]
}

@test "1.3 text given, flag given, text contains flag and value, text contains other flags before and after given" {
    run get_flag_value "some text with -t tip_flag -f fake_flag -r flag -n new_flag -m meaningless_flag" "r"

    [ "${output}" == "flag" ]
    [ "${status}" == "0" ]
}
