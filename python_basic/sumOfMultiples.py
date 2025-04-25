def sum_of_multiples(tot, a):
    multiples = set()
    for m in range(1, tot):
        for f in a:
            if f == 0:
                continue
            if m % f == 0:
                multiples.add(m)
    return sum(multiples)

a = list(map(int, input().split()))
print("Raw input:", a)
tot = a[0]
a.pop(0)
print("tot:", tot)
print("factors:", a)

b = sum_of_multiples(tot, a)
print(f"Result: {b}")
