#!/bin/bash
toFind=$1
argsNo=$#
for ((i=2; i<=argsNo; i++)); do
    arg=${!i}
    if [[ "$toFind" == "$arg" ]]; then
        echo "YES"
        exit 0
    fi
done
echo "NO"