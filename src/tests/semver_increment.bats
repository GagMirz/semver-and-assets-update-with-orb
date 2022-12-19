#!/usr/bin/env bats

setup() {
    source "./src/scripts/semver_increment.sh"
}

# 1 Should increment tag when
@test "1.1 version given, p option" {
    local option
    option="p"

    run semver_increment "v0.0.0" "${option}"

    [ "${output}" == "v0.0.1" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v5.5.5" "${option}"

    [ "${output}" == "v5.5.6" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v10.10.10" "${option}"

    [ "${output}" == "v10.10.11" ] # New tag retrieved
    [ "${status}" == "0" ]         # Check status to be 0
}

@test "1.2 version given, m option" {
    local option
    option="m"

    run semver_increment "v0.0.0" "${option}"

    [ "${output}" == "v0.1.0" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v5.5.5" "${option}"

    [ "${output}" == "v5.6.0" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v10.10.10" "${option}"

    [ "${output}" == "v10.11.0" ] # New tag retrieved
    [ "${status}" == "0" ]        # Check status to be 0
}

@test "1.3 version given, M option" {
    local option
    option="M"

    run semver_increment "v0.0.0" "${option}"

    [ "${output}" == "v1.0.0" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v5.5.5" "${option}"

    [ "${output}" == "v6.0.0" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v10.10.10" "${option}"

    [ "${output}" == "v11.0.0" ] # New tag retrieved
    [ "${status}" == "0" ]       # Check status to be 0
}

@test "1.4 version given, mp option" {
    local option
    option="mp"

    run semver_increment "v0.0.0" "${option}"

    [ "${output}" == "v0.1.1" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v5.5.5" "${option}"

    [ "${output}" == "v5.6.1" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v10.10.10" "${option}"

    [ "${output}" == "v10.11.1" ] # New tag retrieved
    [ "${status}" == "0" ]        # Check status to be 0
}

@test "1.4 version given, Mp option" {
    local option
    option="Mp"

    run semver_increment "v0.0.0" "${option}"

    [ "${output}" == "v1.0.1" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v5.5.5" "${option}"

    [ "${output}" == "v6.0.1" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v10.10.10" "${option}"

    [ "${output}" == "v11.0.1" ] # New tag retrieved
    [ "${status}" == "0" ]       # Check status to be 0
}

@test "1.4 version given, Mm option" {
    local option
    option="Mm"

    run semver_increment "v0.0.0" "${option}"

    [ "${output}" == "v1.0.1" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v5.5.5" "${option}"

    [ "${output}" == "v6.1.0" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v10.10.10" "${option}"

    [ "${output}" == "v11.1.0" ] # New tag retrieved
    [ "${status}" == "0" ]       # Check status to be 0
}

@test "1.4 version given, Mmp option" {
    local option
    option="Mmp"

    run semver_increment "v0.0.0" "${option}"

    [ "${output}" == "v1.1.1" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v5.5.5" "${option}"

    [ "${output}" == "v6.1.1" ] # New tag retrieved
    [ "${status}" == "0" ]      # Check status to be 0

    run semver_increment "v10.10.10" "${option}"

    [ "${output}" == "v11.1.1" ] # New tag retrieved
    [ "${status}" == "0" ]       # Check status to be 0
}
