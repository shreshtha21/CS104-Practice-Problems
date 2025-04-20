tosort=[]
with open("buggy_marksheet.txt","r") as file:
    for line in file:
        parts=line.strip().split("_")
        sections=(parts[2])
        lastpart=parts[3].strip().split(" ")
        marks=(lastpart[1])
        tosort.append((int(sections),int(marks),line.strip()))
    sortans=sorted(tosort, key=lambda x:(x[0],-x[1]))
    for item in sortans:
        print(item[2])