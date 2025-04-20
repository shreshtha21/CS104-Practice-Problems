BEGIN{
    FS=","
    OFS="\t"
}

NR==1{
    for(i=1;i<=NF;i++){printf "%s\t", $i}
    printf "Average\n"
}

NR>1{
    sum=0;
    for(i=2;i<=NF;i++){sum+=$i}
    avg=sum/(NF-1)
    for(i=1;i<=NF;i++){printf "%s\t", $i}
    printf "%.2f", avg
    printf "\n"
}