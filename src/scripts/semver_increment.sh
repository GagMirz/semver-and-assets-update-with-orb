#!/bin/bash
# Increment a version string using Semantic Versioning terminology.
echo 1
# shellcheck disable=SC2154
while read -r -n1 op; do
  case $op in
    M ) major=true;;
    m ) minor=true;;
    p ) patch=true;;
  esac
done < <(echo -n "$option")
echo 2

# shellcheck disable=SC2206 
a=( ${version//./ } )
echo 3

# shellcheck disable=SC2236
if [ ! -z $major ]; then
  vFlag="v"
  ((a[0]++))
  a[1]=0
  a[2]=0
fi
echo 4

# shellcheck disable=SC2236
if [ ! -z $minor ]; then
  ((a[1]++))
  a[2]=0
fi
echo 5
echo ${a[0]}
echo ${a[1]}
echo ${a[2]+1}
echo ${major}
echo ${minor}
echo ${patch}
# shellcheck disable=SC2236
if [ ! -z $patch ]; then
  ((a[2]++))
fi
echo 6

version="${vFlag}${a[0]}.${a[1]}.${a[2]}"
echo "export VERSION=${version}" >> "$BASH_ENV"