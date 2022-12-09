#!/bin/bash

# Increment a version string using Semantic Versioning terminology.

option="<< parameters.level >>"
version=`curl https://api.github.com/repos/${CIRCLE_PROJECT_USERNAME}/${CIRCLE_PROJECT_REPONAME}/releases/latest -s | jq .name -r`

while read -n1 op; do
  case $op in
    M ) major=true;;
    m ) minor=true;;
    p ) patch=true;;
  esac
  echo $op 
done < <(echo -n "$option")

if [ -z $version ]; then
  version="0.0.0"
fi

# shellcheck disable=SC2206 
a=( ${version//./ } )

# Increment version numbers as requested.
# shellcheck disable=SC2236
if [ ! -z $major ]; then
  vFlag="v"
  ((a[0]++))
  a[1]=0
  a[2]=0
fi

# shellcheck disable=SC2236
if [ ! -z $minor ]; then
  ((a[1]++))
  a[2]=0
fi

# shellcheck disable=SC2236
if [ ! -z $patch ]; then
  ((a[2]++))
fi

version="${vFlag}${a[0]}.${a[1]}.${a[2]}"
echo "export VERSION=${version}" >> "$BASH_ENV"
