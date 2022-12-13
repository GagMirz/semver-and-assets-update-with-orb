#!/bin/bash

# shellcheck disable=SC2154,SC2206,SC2236
# SC2154 justification: Variable assigned outside of script file. 
# SC2206,SC2236 justification: Meaningless warning/error. 
# shellcheck disable=all

source $config_path

# Add default values
[[ -z $version ]] && version="v0.0.0"
[[ -z $option ]] && option="p"
[[ -z $answer ]] && answer="VERSION"

echo $version
echo $option
echo $answer

while read -r -n1 op; do
  case $op in
    M ) major=true;;
    m ) minor=true;;
    p ) patch=true;;
  esac
done < <(echo -n "$option")

echo $major
echo $minor
echo $patch

a=( ${version//./ } )

if [ "${a[0]:0:1}" == "v" ]; then
  a[0]=${a[0]:1}
  vFlag="v"
fi

if [ ! -z $major ]; then
  ((a[0]=a[0]+1))
  a[1]=0
  a[2]=0
fi

if [ ! -z $minor ]; then
  ((a[1]=a[1]+1))
  a[2]=0
fi

if [ ! -z $patch ]; then
  ((a[2]=a[2]+1))
fi

version="${vFlag}${a[0]}.${a[1]}.${a[2]}"
echo $vFlag
echo ${a[0]}
echo ${a[1]}
echo ${a[2]}
echo "export ${answer}=${version}" >> "$BASH_ENV"
