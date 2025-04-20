#!/bin/bash
file=$1
declare -A count
for word in $(cat "$file"); do
    count[$word]=$((count[$word] + 1))
done
for word in "${!count[@]}"; do
    echo "$word: ${count[$word]}"
done
