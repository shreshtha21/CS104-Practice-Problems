BEGIN{
    FS = " "
    OFS =";"
}

NR==1{
    for(i=1;i<=NF;i++){printf "%s;", $i}
    printf "Comments\n"
}

NR>1{
    if ($1 ~ /[0-9]{2}B[0-9]{4}/) {
    if ($2~/(^.cpp$)/ && $3 ~ /(^.txt$)/ && $4 ~ /(^.pdf$)/) {
        $5="-"
    }
    else if ($2~/^(-)$/ || $3~/^(-)$/ || $4~/^(-)$/){
        $5="Wrong Submission Format"
    }
    else if ($2~/^[A-Za-z0-9_]+\.cpp$/ && $3~/^[A-Za-z0-9_]+\.txt$/ && $4~/^[A-Za-z0-9_a]+\.pdf$/) {
        $5="Correct Submission Format"
    }
    else {
        $5="Wrong Submission Format"
    }
    sum=0;
    for(i=1;i<NF;i++){printf "%s;", $i}
    printf $5
    printf "\n"
    }
}