BEGIN{
    FS=";"
}
{
    if ($4 == "/bin/false") {
        printf $1
        printf "\n"
    }
}