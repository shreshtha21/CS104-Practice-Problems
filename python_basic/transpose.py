import numpy as np
size=list(map(int,input().split()))
n=size[0]
m=size[1]
arr=np.zeros((n,m), dtype=int)
for i in range(n):
    row=list(map(int,input().split()))
    arr[i]=row
print(np.transpose(arr))
print(arr.flatten())