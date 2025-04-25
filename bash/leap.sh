#!/usr/bin/bash

n=$1

leapyear() {
    local n=$1
    if (( (n % 4 == 0 && n % 100 != 0) || n % 400 == 0 )); then
        echo "true"
    else
        echo "false"
    fi
}

if [[ $(leapyear "$n") == "true" ]]; then
    echo "yes"
else
    echo "no"
fi
