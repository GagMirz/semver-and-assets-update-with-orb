setup() {
    source "./src/scripts/release_tag.sh"
    source "./src/tests/helpers.sh"
}

# get_release_tag()
# 1 Should increment tag when
@test "1.1 username given, repository given, token given" {
    run get_release_tag "${CIRCLE_PROJECT_USERNAME}" "${CIRCLE_PROJECT_REPONAME}" "${GITHUB_TOKEN}"

    [ "${output}" != "" ]  # Initial commit message retrieved
    [ "${status}" == "0" ] # Check status to be 0

    run isSemVer "${output}"

    [ "${output}" == "true" ] # Initial commit message retrieved
    [ "${status}" == "0" ]    # Check status to be 0
}

# 2 Should throw an error when
@test "2.1 username not given, repository given" {
    run get_release_tag "" "${CIRCLE_PROJECT_REPONAME}"

    [ "${status}" == "128" ] # Check status to be 128
    [ "${output}" == "" ]    # Check stdout is clear
}

@test "2.2 username given, repository not given" {
    run get_release_tag "${CIRCLE_PROJECT_USERNAME}" ""

    [ "${status}" == "129" ] # Check status to be 129
    [ "${output}" == "" ]    # Check stdout is clear
}

@test "2.3 username not given, repository not given" {
    run get_release_tag "" ""

    [ "${status}" == "128" ] # Check status to be 129
    [ "${output}" == "" ]    # Check stdout is clear
}
