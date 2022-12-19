setup() {
    source "./src/scripts/commit_message.sh"
}

# get_commit_message()
# 1 Should increment tag when
@test "1.1 commit hash given" {
    # Main/master branch initial commit hash, assertion value should be manually updated as well
    run get_commit_message "e472db1ca43eac2ad3baecf86e6ef02641b093e1"

    [ "${output}" == "feat: Initial commit." ] # Initial commit message retrieved
    [ "${status}" == "0" ]                     # Check status to be 0
}

# 2 Should throw an error when
@test "2.1 commit hash not given" {
    run get_commit_message ""

    [ "${status}" == "128" ] # Check status to be 128
    [ "${output}" == "" ]    # Check stdout is clear
}
