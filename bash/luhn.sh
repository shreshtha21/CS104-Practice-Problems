#!/usr/bin/env bash

# Double every second digit, starting from the right.
# If doubling the number results in a number greater than 9
# then subtract 9 from the product. Then sum all of the digits.
# If the sum is evenly divisible by 10, then the number is valid;
# else invalid.
#
# Return 0 if the given number is valid; 1 otherwise.
luhn_check() {
    [[ $1 =~ ^[[:digit:]]{2,}$ ]] || return 1   # At least 2 digits
    declare -i sum=0 digit is_double
    for (( is_double=0, i=${#1}-1; i > -1; i--, is_double^=1, sum+=digit )) {
        digit="${1:i:1}"
        (( is_double )) && {
            (( digit <<= 1 ))
            (( digit > 9 )) && (( digit -= 9 ))
        }
    }
    (( sum % 10 == 0 ))
}

# stripped all spaces from the input arguments
luhn_check "${*// /}" && echo true || echo false