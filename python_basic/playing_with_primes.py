import numpy as np
primes=[2,3,5,5,7,7]
def isPrime(n):
    if n<=1:
        return False
    for i in range(2,int(np.sqrt(n))+1):
        if n%i==0:
            return False
    return True

with open("q1-test_input.txt","r") as file:
    lines = []
    for line in file:
        lines.append(int(line))
    notc = lines[0]
    for n in lines[1:notc+1]:
        if len(primes)>=n:
            print(primes[n-1])
        else:
            max = int(primes[-1])
            max+=1
            i=len(primes)+1
            while i<=n:
                if isPrime(max):
                    if max-primes[-1]==2:
                        primes.append(max)
                        i+=1
                        if i==n:
                            break
                    primes.append(max)
                    i+=1
                    max+=1
                else:
                    max+=1
            print(primes[-1])
