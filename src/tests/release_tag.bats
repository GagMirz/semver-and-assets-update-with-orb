setup() {
    source "./src/scripts/release_tag.sh"
    source "./src/tests/helpers.sh"
}

# 1 Should increment tag when
@test "1.1 username given, repository given, token given" {
    # Main/master branch initial commit hash, assertion value should be manually updated as well
    run get_release_tag "${CIRCLE_PROJECT_USERNAME}" "${CIRCLE_PROJECT_REPONAME}" "${GITHUB_TOKEN}"

    [ "${output}" != "" ]  # Initial commit message retrieved
    [ "${status}" == "0" ] # Check status to be 0

    run isSemVer "${output}"

    [ "${output}" == "true" ] # Initial commit message retrieved
    [ "${status}" == "0" ]    # Check status to be 0
}

# 2 Should throw an error when
@test "2.1 username not given, repository given" {
    # Main/master branch initial commit hash, assertion value should be manually updated as well
    run get_release_tag "" "${CIRCLE_PROJECT_REPONAME}"

    [ "${status}" == "128" ] # Check status to be 128
    [ "${output}" != "" ]    # Check nothing was given to stdout
}

@test "2.2 username given, repository not given" {
    # Main/master branch initial commit hash, assertion value should be manually updated as well
    run get_release_tag "${CIRCLE_PROJECT_USERNAME}" ""

    [ "${status}" == "129" ] # Check status to be 129
    [ "${output}" != "" ]    # Check nothing was given to stdout
}
