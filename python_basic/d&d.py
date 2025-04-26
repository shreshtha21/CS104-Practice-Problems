import sys
a=sys.argv[1]
b=sys.argv[2]
c=sys.argv[3]
d=sys.argv[4]

def sumofmax4(a,b,c,d):
    a=float(a)
    b=int(b)
    c=int(c)
    d=int(d)
    min=a
    if b<min:
        min=b
    if c<min:
        min=c
    if d<min:
        min=d
    sum=a+b+c+d-min
    return sum

print(f"{sumofmax4(a,b,c,d)}")