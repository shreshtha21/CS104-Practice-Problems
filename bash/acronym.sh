#!/bin/bash

to_acronym() {
    local phrase=$(echo "$1" | sed 's/-/ /g')
    phrase=$(echo "$phrase" | sed 's/[^a-zA-Z0-9 ]//g')
    local acronym=""
    for word in $phrase; do
        acronym="${acronym}$(echo "${word:0:1}" | tr 'a-z' 'A-Z')"
    done
    echo "$acronym"
}

if [ -z "$1" ]; then
    echo "Usage: ./acronym.sh \"Your phrase here\""
else
    to_acronym "$1"
fi
