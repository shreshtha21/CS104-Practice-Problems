#!/bin/bash
arr=("$@")
n=$#
swap(){
    temp=${arr[$1]}
    arr[$1]=${arr[$2]}
    arr[$2]=$temp
}
for ((i=0;i<n-1;i++)); do
    for ((j=0;j<n-i-1;j++)); do
        if [[ ${arr[j]} -gt ${arr[$((j+1))]} ]]; then
            swap $j $((j+1))
        fi
    done
done
for ((i=0;i<n;i++)); do
    echo -n "${arr[i]} " 
done
echo
