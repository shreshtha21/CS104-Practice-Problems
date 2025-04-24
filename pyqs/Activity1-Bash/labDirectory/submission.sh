#!/usr/bin/bash
folder=$1
count=0

declare -a files
files=($(ls "$folder"))
declare -a names

for file in ${files[@]}; do
if [[ $file == *.py ]]; then
rm "$folder/$file"
((count++))
names[$count]=$file
fi
done

echo $count
{
for name in "${names[@]}"; do
    echo "Deleted $name"
done
} >log.txt
