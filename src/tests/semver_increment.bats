#!/usr/bin/env bats

setup() {
    source "./src/scripts/semver_increment.sh"
}

# 1 Should increment tag when
@test "1.1 version given, p option" {
    run semver_increment "v0.0.1" "p"

    [ "${output}" == "v0.0.2" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v3.2.10" "p"

    [ "${output}" == "v3.2.11" ] # New tag retrieved
    [ "${status}" == "0" ]       # Check status to be 0

    run semver_increment "v0.0.10" "p"

    [ "${output}" == "v0.0.11" ] # New tag retrieved
    [ "${status}" == "0" ]       # Check status to be 0
}
