#!/bin/bash
n=$1
cat=0
catalan(){
    n=$1
    if [[ n -eq 0 ]]; then
    echo 1
    return
    elif [[ n -eq 1 ]]; then
    echo 1
    return
    else
    cat=0
    for(( i=0;i<n;i++ ))
    do
    a=$(catalan $i)
    b=$(catalan $((n-i-1)))
    cat=$(( cat + a * b ))
    done
    echo $cat
    fi
}
catalan $n
