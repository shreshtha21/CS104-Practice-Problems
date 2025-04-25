####isme kya glti h :(

#!/usr/bin/bash
a=$1
b=$2

if [[ ${#a} -ne ${#b} ]]; then
echo "no"

else
declare -a arr1
declare -a arr2
for ((i=0;i<${#a};i++)); do
    arr1[i]=${a:i:1}
done

for ((i=0;i<${#a};i++)); do
    arr2[i]=${b:i:1}
done

count=0
letsgo=${#a}
for (( j=0 ; j<letsgo ; j++ )); do
    for (( k=0 ; k<letsgo ; k++ )); do

    if [[ ${arr1[$j]} == ${arr2[$k]} ]]; then
        ((count++))
        ${arr2[$k]}="*" 
        break
    fi

    done
done
if [[ $count -eq $letsgo ]]; then
echo "yes"
else
echo "no"
fi
fi
