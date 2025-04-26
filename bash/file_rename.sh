mkdir output
file=$(ls *\.jpg)
mv $file output
cd output || exit
files=$(ls)
for filename in $files; do
    date=$(echo "$filename"|sed -E 's/[a-zA-Z]*([0-9]+)\.jpg/\1/')
    year=$((10#${date:4:4}))
    month=$((10#${date:2:2}))
    day=$((10#${date:0:2}))
    if [[ "$date" -eq 26112008 ]]; then
        filenamenew=$(echo "$filename"|sed -E 's/([a-zA-Z]*)([0-9]+)(\.jpg)/\1\2_today\3/')
        mv "$filename" "$filenamenew"
    elif [[ "$date" -ge 19112008 && "$date" -le 25112008 ]]; then
        filenamenew=$(echo "$filename"|sed -E 's/([a-zA-Z]*)([0-9]+)(\.jpg)/\1\2_weekold\3/')
        mv "$filename" "$filenamenew"
    elif [[ "$year" -lt 2008 || ( "$day" -le 18 && "$month" -eq 11 && "$year" -eq 2008 ) || ( "$month" -lt 11 && "year" -eq 2008 ) ]]; then
        filenamenew=$(echo "$filename"|sed -E 's/([a-zA-Z]*)([0-9]+)(\.jpg)/\1\2_quiteold\3/')
        mv "$filename" "$filenamenew"
    else 
        rm $filename
    fi
done