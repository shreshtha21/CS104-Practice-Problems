#!/usr/bin/bash
declare -A freq
for (( i=0; i<${#1}; i++ )); do
    char="${1:i:1}"
    char=$(echo "$char" | tr '[:upper:]' '[:lower:]')
    if [[ "$char" =~ [a-z] ]]; then
        freq[$char]=1
    fi
done

if [[ ${#freq[@]} -eq 26 ]]; then
    echo "yes"
else
    echo "no"
fi
