BEGIN{
    FS= ","
    OFS=":"
}

NR==1{
    for(i=1;i<=NF;i++){printf "%s,", $i}
    printf "Amount\n"
}

NR>1{
    principle=$3;
    rate=$5;
    duration=$2;
    amt = principle*(rate^duration);
    for(i=1;i<NF;i++){printf "%s,", $i}
    printf "%.0f", amt
    printf "\n"
}