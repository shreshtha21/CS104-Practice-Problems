#!/usr/bin/bash
n=$1
m=$1
declare -a codes
declare -a manvi
manvi[0]="wink"
manvi[1]="double blink"
manvi[2]="close your eyes"
manvi[3]="jump"
i=0
j=0
while ((n>0)); do
if [[ $n%2 -eq 1 ]]; then
    codes[$i]=${manvi[$j]}
    ((i++))
fi
n=$((n/2))
((j++))
done

if [[ $m -lt 16 ]]; then
for (( k=0 ; k<i ; k++)); do
    echo -n "${codes[k]} "
done
else
for (( k=i ; k>=0 ; k--)); do
    echo -n "${codes[k]} "
done
fi