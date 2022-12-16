#!/usr/bin/env bats

# setup() {
#     source "$PROJECT_ROOT/src/helper.sh"
#     load 'test_helper/bats-assert/load'
    
#     source ./src/scripts/utils.sh
# }

setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    # ... the remaining setup is unchanged

    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # make executables in src/ visible to PATH
    PATH="$DIR/../src:$PATH"
}

# 1 Should load file when
@test "1.1: config file given, required tag missing " {
    # mkdir -p "/home/circleci/"
    # touch "/home/circleci/.test.utils.config "
    # config_file="/home/circleci/.test.utils.config"

    # echo "NEW_PARAMETER=value" > $config_file

    # SourceParameters "${config_file}"

    # assert_equal "${NEW_PARAMETER}" "value" # Check for no exit error
    
}