#!/usr/bin/bash

sum_of_best_four() {
    local a=$1
    local b=$2
    local c=$3
    local d=$4
    min=$1
    if [[ $2 -lt $min ]]; then
    min=$2
    fi
    if [[ $3 -lt $min ]]; then
    min=$3
    fi
    if [[ $4 -lt $min ]]; then
    min=$4
    fi
    sum=$((a + b + c + d - min))
    echo "$sum"
}

one=$1
two=$2
three=$3
four=$4

summ=$( sum_of_best_four "$one" "$two" "$three" "$four" )
echo "$summ"