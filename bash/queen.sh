#!/usr/bin/env bash
a=$1
b=$2

declare -A alp
alp[a]=1;
alp[b]=2;
alp[c]=3;
alp[d]=4;
alp[e]=5;
alp[f]=6;
alp[g]=7;
alp[h]=8;

a2=${a:0:1}
a1=${a:1:1}
b2=${b:0:1}
b1=${b:1:1}
a0=${alp[$a2]}
b0=${alp[$b2]}

if [[ $a0 -eq $b0 ]]; then
echo "yes"

elif [[ $a1 -eq $b1 ]]; then
echo "yes"

elif [[ $(($a0 - $b0)) -eq $(($b1 - $a1)) ]]; then
echo "yes"

elif [[ $(($a0 - $b0)) -eq $(($a1 - $b1)) ]]; then
echo "yes"

else
echo "no"
fi