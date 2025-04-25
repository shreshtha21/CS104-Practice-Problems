import numpy as np

n, m = [int(x) for x in input().split()]
arr = np.zeros((n, m), dtype=int)

for i in range(n):
    row = [int(x) for x in input().split()]
    arr[i] = row

print(np.transpose(arr))
print(arr.flatten())
