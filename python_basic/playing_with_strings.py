def valid(word, inputindices):
    if len(inputindices)!=len(word):
        return False
    for i in range(0,len(word)):
        if int(inputindices[i]) >= len(word):
            return False
    return True

with open("q4-input.txt","r") as file:
    lines=[]
    for line in file:
        lines.append(line.strip())
    word=lines[0]
    inputindices=lines[1].split(" ")
    if valid(word, inputindices):
        newword=[]
        for i in range(0,len(word)):
            newword.append(word[int(inputindices[i])])
        for letter in newword:
            print(letter,end="")
    else:
        print(f"INVALID INPUT")