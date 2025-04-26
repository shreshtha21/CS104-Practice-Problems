while IFS=':' read -r -a arr; do
    sed -e "s/student_name/${arr[0]}/" -e "s/roll_no/${arr[1]}/" $2
    echo
    echo
done < $1