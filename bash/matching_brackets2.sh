declare -a brackets
i=0
sentence="$*"
while [[ $sentence != "" ]]; do
    char=${sentence:0:1}
    if [[ $char == "(" || $char == "{" || $char == "[" ]]; then
        brackets[$i]=$char
        ((i++))
    fi
    if [[ $char == ")" || $char == "}" || $char == "]" ]]; then
        j=$((i-1))
        if [[ $char == ")" && ${brackets[$j]} != "(" ]]; then
            echo "Invalid"
            exit 1
        fi
        if [[ $char == "}" && ${brackets[$j]} != "{" ]]; then
            echo "Invalid"
            exit 1
        fi
        if [[ $char == "]" && ${brackets[$j]} != "[" ]]; then
            echo "Invalid"
            exit 1
        fi
        ((i--))
        unset brackets[$i]
    fi
    sentence=${sentence:1}
done
if (( i==0 )); then
    echo "Valid"
else
    echo "Invalid"
fi