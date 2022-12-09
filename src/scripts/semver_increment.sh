#!/bin/bash

# Increment a version string using Semantic Versioning terminology.

while $option ":Mmp" op
do
  case $op in
    M ) major=true;;
    m ) minor=true;;
    p ) patch=true;;
  esac
done

if [ -n "${version}" ]; then
  version="0.0.0"
fi

# shellcheck disable=SC2206 
a=( ${version//./ } )

# Increment version numbers as requested.
if [ ! -n $major ]; then
  vFlag="v"
  ((a[0]++))
  a[1]=0
  a[2]=0
fi

if [ ! -n $minor ]; then
  ((a[1]++))
  a[2]=0
fi

if [ ! -n $patch ]; then
  ((a[2]++))
fi

version="${vFlag}${a[0]}.${a[1]}.${a[2]}"