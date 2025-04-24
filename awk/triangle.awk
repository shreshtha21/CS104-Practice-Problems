# These variables are initialized on the command line (using '-v'):
# - type

function equilateral (a, b, c) {
    return triangle(a, b, c) && 
        a == b && a == c && b == c ? "true" : "false"
}

function isosceles (a, b, c) {
    return triangle(a, b, c) &&
        (a == b || a == c || b == c) ? "true" : "false"
}

function scalene (a, b, c) {
    return triangle(a, b, c) &&
        a != b && a != c && b != c ? "true" : "false"
}

function triangle (a, b, c) {
    return a > 0 && b > 0 && c > 0 &&
        a + b >= c &&
        b + c >= a &&
        a + c >= b
}

BEGIN {
    FS = " "
}

{
    print @type($1, $2, $3)
}