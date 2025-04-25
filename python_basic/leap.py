import sys

n=int(sys.argv[1])
def leapyear(n):
    leap=False
    if n % 4 == 0:
        leap=True
    if n % 100 == 0:
        leap=False
    if n % 400 ==0:
        leap=True
    return leap

if leapyear(n):
    print(f"yes")
else:
    print(f"no")