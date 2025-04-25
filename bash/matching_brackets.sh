#!/bin/bash

# Function to check if the string has balanced brackets, braces, and parentheses
check_balance() {
    local input="$1"
    # Initialize an empty array (acting as a stack)
    declare -a stack

    # Traverse the input string
    for (( i=0; i<${#input}; i++ )); do
        char="${input:i:1}"

        # Check for opening brackets, braces, or parentheses
        case "$char" in
            '(' | '{' | '[')
                # Push to stack
                stack+=("$char")
                ;;
            ')' | '}' | ']')
                # Check if the stack is empty or the top doesn't match
                if [ ${#stack[@]} -eq 0 ]; then
                    echo "Unbalanced: Missing opening for $char"
                    return 1
                fi
                top="${stack[-1]}"
                if [ "$char" == ")" ] && [ "$top" == "(" ]; then
                    # Pop from stack if matched
                    unset 'stack[${#stack[@]}-1]'
                elif [ "$char" == "}" ] && [ "$top" == "{" ]; then
                    unset 'stack[${#stack[@]}-1]'
                elif [ "$char" == "]" ] && [ "$top" == "[" ]; then
                    unset 'stack[${#stack[@]}-1]'
                else
                    echo "Unbalanced: Mismatched $char"
                    return 1
                fi
                ;;
        esac
    done

    # If the stack is empty, the string is balanced
    if [ ${#stack[@]} -eq 0 ]; then
        echo "Balanced"
    else
        echo "Unbalanced: Extra opening brackets"
        return 1
    fi
}

# Read input
read -p "Enter string to check balance: " input
check_balance "$input"


##2nd approach
#!/usr/bin/env bash

# associative array for checking matches
declare -A parens=( [\[]=\] [\(]=\) [{]=} )

main () {
    stack=""
    # iterate character-wise through the input
    for (( i=0; i<${#1}; i++ )); do
        char="${1:$i:1}"
        # ignoring all input that is not a bracket
        case $char in
            # if char is a left bracket
            "(" | "[" | "{")
                # push the character onto the stack
                stack=$char$stack
            ;;
            # if char is a right bracket
            ")" | "]" | "}")
                # peek the top of the stack if it's not empty
                # if char matches the peeked element
                if [[ ${#stack} -ne 0 && ${parens["${stack:0:1}"]} == $char ]]; then
                    # pop off the top element from the stack and continue
                    stack=${stack:1}
                    # if they don't match, echo false and exit
                else
                    echo "false"
                    exit 0
                fi
            ;;
        esac
    done

    # if the stack is empty
    [[ -z $stack ]] && echo "true" || echo "false"
}

main "$@"