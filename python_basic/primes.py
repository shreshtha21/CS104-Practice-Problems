import numpy as np
import sys
def isPrime(n):
    if n<=1:
        return False
    for i in range(2,int(np.sqrt(n))+1):
        if n%i==0:
            return False
    return True
listt=[]

num=int(sys.argv[1])
for i in range(2,num+1):
    if isPrime(i):
        listt.append(i)
print(listt)
