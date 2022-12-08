#!/bin/bash

# Increment a version string using Semantic Versioning terminology.

while getopts ":Mmp" option
do
  case $Option in
    M ) major=true;;
    m ) minor=true;;
    p ) patch=true;;
  esac
done

if [ -z $version ]; then
  version="0.0.0"
fi

# Build array from version string.
a=( ${version//./ } )

# Increment version numbers as requested.
if [ ! -z $major ]; then
  vFlag="v"
  ((a[0]++))
  a[1]=0
  a[2]=0
fi

if [ ! -z $minor ]; then
  ((a[1]++))
  a[2]=0
fi

if [ ! -z $patch ]; then
  ((a[2]++))
fi

version="${vFlag}${a[0]}.${a[1]}.${a[2]}"