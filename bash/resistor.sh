#!/bin/bash

# Define the color-to-digit mapping
declare -A colors
colors=(
    [black]=0
    [brown]=1
    [red]=2
    [orange]=3
    [yellow]=4
    [green]=5
    [blue]=6
    [violet]=7
    [grey]=8
    [white]=9
)

# Read the three color bands from the user
color1=$1
color2=$2
color3=$3

# Get the digit for the first two colors
digit1=${colors[$color1]}
digit2=${colors[$color2]}

# Get the multiplier from the third color (how many zeros to add)
multiplier=${colors[$color3]}

# Calculate the base value (first two color digits)
base_value=$((digit1 * 10 + digit2))

# Add the zeros (multiply by 10^multiplier)
value=$((base_value * 10 ** multiplier))

# Determine the appropriate metric prefix
if ((value >= 1000000)); then
    value_label="$((value / 1000000)) megaohms"
elif ((value >= 10000)); then
    value_label="$((value / 1000)) kiloohms"
else
    value_label="${value} ohms"
fi

# Output the result
echo $value_label
