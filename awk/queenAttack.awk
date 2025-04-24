#!/usr/bin/env gawk -f

BEGIN { FS=" "}
$1 < 0 || $2 < 0 || $3 < 0 || $4 < 0 || $1 > 7 || $2 > 7 || $3 > 7 || $4 > 7 { print "invalid"; exit -1 }
$1 == $3 && $2 == $4 { print "invalid"; exit -1 }

$1 == $3 { print "true"; exit 0 }
$2 == $4 { print "true"; exit 0 }
{
    if ($1 + $2 == $3 + $4) { print "true"; exit 0 }
    if ($1 - $2 == $3 - $4) { print "true"; exit 0 }
    { print "false"; exit 0 }
}