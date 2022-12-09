#!/bin/bash
echo 1
# Increment a version string using Semantic Versioning terminology.
echo 2

while read -r -n1 op; do
  case $op in
    M ) major=true;;
    m ) minor=true;;
    p ) patch=true;;
  esac
# shellcheck disable=SC2154
done < <(echo -n "$option")
echo 3

# shellcheck disable=SC2206 
a=( ${version//./ } )
echo 4

# shellcheck disable=SC2236
if [ ! -z $major ]; then
  vFlag="v"
  ((a[0]++))
  a[1]=0
  a[2]=0
fi

# shellcheck disable=SC2236
if [ ! -z $minor ]; then
  echo ${a[0]}
  echo ${a[1]}
  echo ${a[2]}
  echo 4.1
  ((a[1]++))
  echo 4.2
  a[2]=0
  echo 4.3
fi
echo 6

# shellcheck disable=SC2236
if [ ! -z $patch ]; then
  ((a[2]++))
fi
echo 7

version="${vFlag}${a[0]}.${a[1]}.${a[2]}"
echo "export VERSION=${version}" >> "$BASH_ENV"
echo $version