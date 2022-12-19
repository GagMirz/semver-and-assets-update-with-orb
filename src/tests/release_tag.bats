setup() {
    source "./src/scripts/release_tag.sh"
    source "./src/tests/helpers.sh"
}

# 1 Should increment tag when
@test "1.1 commit hash given" {
    # Main/master branch initial commit hash, assertion value should be manually updated as well
    run get_release_tag "${CIRCLE_PROJECT_USERNAME}" "${CIRCLE_PROJECT_REPONAME}"

    [ "${output}" != "" ]  # Initial commit message retrieved
    [ "${status}" == "0" ] # Check status to be 0

    run isSemVer "${output}"

    [ "${output}" == "true" ]  # Initial commit message retrieved
    [ "${status}" == "0" ] # Check status to be 0
}

# 2 Should throw an error when