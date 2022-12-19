setup() {
    source "./src/scripts/commit_message.sh"
}

# 1 Should increment tag when
@test "1.1 commit hash given" {
    # Main/master branch initial commit hash
    run get_commit_message "e472db1ca43eac2ad3baecf86e6ef02641b093e1"

    [ "${output}" == "feat: Initial commit." ] # Initial commit message retrieved
    [ "${status}" == "0" ]      # Check status to be 0
}