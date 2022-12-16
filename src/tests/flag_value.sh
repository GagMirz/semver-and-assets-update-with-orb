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
