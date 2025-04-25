#!/usr/bin/bash
a=$1
b=$2

if [[ ${#a} -ne ${#b} ]]; then
echo "no"
exit
fi

declare -a alp=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
declare -a arr1
declare -a arr2 
declare -a freq1
declare -a freq2
for ((i=0;i<${#a};i++)); do
    arr1[i]=${a:i:1}
done

for ((i=0;i<${#a};i++)); do
    arr2[i]=${b:i:1}
done

for (( i=0 ; i<${#a} ; i++ )); do
    for (( j=0 ; j<26 ; j++ )); do
        if [[ ${arr1[i]} == ${alp[j]} ]]; then
            ((freq1[j]++))
        fi
    done
done

for (( i=0 ; i<${#a} ; i++ )); do
    for (( j=0 ; j<26 ; j++ )); do
        if [[ ${arr2[i]} == ${alp[j]} ]]; then
            ((freq2[j]++))
        fi
    done
done

for ((i=0; i<26; i++)); do
    if [[ ${freq1[i]} -ne ${freq2[i]} ]]; then
        echo "no"
        exit
    fi
done

echo "yes"