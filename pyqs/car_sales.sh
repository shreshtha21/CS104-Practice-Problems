#!/usr/bin/env bash

# Function to check if a file exists
file_exists() {
    if [ ! -f "$1" ]; then
        echo "ERROR: File does not exist"
        exit 1
    fi
}

# Function to calculate most sold color
most_sold_color() {
    file="$1"
    column="$2"
    value="$3"
    declare -A count
    if [ "$#" -eq 3 ]; then
        while read -r line; do
            color=$(echo "$line" | cut -d ',' -f 4)
            if [ "$column" == "type" ] && [ "$value" != "$(echo "$line" | cut -d ',' -f 1)" ]; then
                continue
            elif [ "$column" == "price" ] && [ "$value" != "$(echo "$line" | cut -d ',' -f 2)" ]; then
                continue
            elif [ "$column" == "year" ] && [ "$value" != "$(echo "$line" | cut -d ',' -f 3)" ]; then
                continue
            fi
            quantity=$(echo "$line" | cut -d ',' -f 5)
            ((count["$color"]+=quantity))
        done < "$file"
    else
        while read -r line; do
            color=$(echo "$line" | cut -d ',' -f 4)
            quantity=$(echo "$line" | cut -d ',' -f 5)
            ((count["$color"]+=quantity))
        done < "$file"
    fi
    max_color=""
    max_count=0
    for color in "${!count[@]}"; do
        if [ "${count[$color]}" -gt "$max_count" ]; then
            max_color="$color"
            max_count="${count[$color]}"
        fi
    done
    if [ -z "$max_color" ]; then
        echo "NRF"
    else
        echo "$max_color"
    fi
}

# Function to calculate total sales
total_sales() {
    file="$1"
    price="$2"
    color="$3"
    total=0
    present=0
    while read -r line; do
        p=$(echo "$line" | cut -d ',' -f 2)
        c=$(echo "$line" | cut -d ',' -f 4)
        q=$(echo "$line" | cut -d ',' -f 5)
        if [ "$#" -eq 1 ]; then
            ((total += p * q))
            present=1
        elif [ "$#" -eq 2 ] && [ "$p" -gt "$price" ]; then
            ((total += p * q))
            present=1
        elif [ "$#" -eq 3 ] && [ "$p" -gt "$price" ] && [ "$c" == "$color" ]; then
            ((total += p * q))
            present=1
        fi
    done < "$file"
    if [ "$present" -eq 0 ]; then
        echo "NRF"
        exit 0
    else
        echo "$total"
    fi
}

# Main script
if [ "$#" -eq 0 ]; then
    echo "ERROR: No arguments provided"
    exit 1
fi
if [ "$#" -eq 1 ]; then
    echo "ERROR: No query type provided"
    exit 1
fi

file_exists "$1"

query_type="$2"
if [ "$query_type" != "1" ] && [ "$query_type" != "2" ]; then
    echo "ERROR: Invalid query type"
    exit 1
fi

if [ "$query_type" -eq 1 ]; then
    if [ "$#" -eq 2 ]; then
        most_sold_color "$1"
        exit 0
    else
        most_sold_color "$1" "$3" "$4"
        exit 0
    fi
    
elif [ "$query_type" -eq 2 ]; then
    if [ "$#" -eq 2 ]; then
        total_sales "$1"
        exit 0
    elif [ "$#" -eq 3 ]; then
        total_sales "$1" "$3"
        exit 0
    else
        total_sales "$1" "$3" "$4"
        exit 0
    fi
fi
