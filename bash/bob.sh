#!/bin/bash

# Read the input
input="$1"

# Check if the input is empty (silence)
if [[ -z "$input" ]]; then
    echo "Fine. Be that way!"
# Check if the input is a question (ends with a '?')
elif [[ "$input" == *? ]]; then
    # Check if it's a yelling question (ALL CAPS)
    if [[ "$input" == "${input^^}" ]]; then
        echo "Calm down, I know what I'm doing!"
    else
        echo "Sure."
    fi
# Check if the input is yelling (ALL CAPS)
elif [[ "$input" == "${input^^}" ]]; then
    echo "Whoa, chill out!"
else
    echo "Whatever."
fi
