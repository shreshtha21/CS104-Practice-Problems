BEGIN{
    FS=",";
    min=1e9;
}

NR>1{
    if($5=="PASS"){
        sum=$2+$3+$4;
        if(min>sum) {
            min=sum;
            ind=$1;
        }
    }
    
}

END{
    print ind;
}