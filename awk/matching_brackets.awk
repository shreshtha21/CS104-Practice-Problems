# matching-brackets: returns true if all brackets match, false otherwise
#   input: a string of brackets, curly braces, and parenthesis
#   output: true if all brackets match, false otherwise
BEGIN {
    # Consider each character a separate field.
    FS = ""
    # Map each opening bracket type to its corresponding closing bracket
    open_bracket["["] = "]"
    open_bracket["("] = ")"
    open_bracket["{"] = "}"

    # Create the inverse between closing and opening brackets
    for (bracket in open_bracket) {
        closed_bracket[open_bracket[bracket]] = bracket
    }
}

{
    top = 0
    for (i = 1; i <= NF; i++) {
        if ($i in open_bracket) {
            # Add new bracket on top of the stack
            stack[++top] = $i
        } else if ($i in closed_bracket) {
            # Check if the type of bracket closed matches the last opened bracket
            if (stack[top] == closed_bracket[$i]) {
                # Pop off last opening bracket if it matches
                top--
            } else {
                print "false"
                next
            }
        }
    }
    # Check if all opening braces are closed
    print (top == 0 ? "true" : "false")
}