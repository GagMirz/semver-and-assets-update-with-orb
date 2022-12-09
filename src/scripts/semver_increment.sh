#!/bin/bash
# Increment a version string using Semantic Versioning terminology.

# shellcheck disable=SC2154
while read -r -n1 op; do
  case $op in
    M ) major=true;;
    m ) minor=true;;
    p ) patch=true;;
  esac
done < <(echo -n "$option")

# shellcheck disable=SC2206 
a=( ${version//./ } )

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