with open("q2-input.txt", "r") as file:
    setoflines = set()
    for line in file:
        parts = line.strip().split(',')
        for part in parts:
            setoflines.add(part)
    print(len(setoflines))