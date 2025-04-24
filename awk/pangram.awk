BEGIN {
    split("abcdefghijklmnopqrstuvwxyz", alphabet, "")
}


{
    result = "true"
    $0 = tolower($0)
    for (i in alphabet) {
        if ($0 !~ alphabet[i]) result = "false"
    }

    print result

}