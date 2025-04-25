import numpy as np
import matplotlib.pyplot as plt
import time

from exampyadvop import vectorized,nonvectorized
"""
Import vectorized() and nonvectorized() from operation.py
Use the testcases given in the folder testcases to test your code here. You can print the result to check if it is correct.
"""

"""
Read the values from data/nonvectorized.txt and data/vectorized.txt into separate lists
Read values as float values.
"""

nonvec=[]
vec=[]

with open("non-vectorized.txt", "r") as file:
    for line in file:
        nonvec.append(float(line))

with open("vectorized.txt", "r") as file:
    for line in file:
        vec.append(float(line))

plt.figure(figsize=(10,6)) # Don't change this line

"""
Draw a plot as specified in the problem statment using above values
"""
xaxis=np.arange(1,101)
plt.plot(xaxis,nonvec)
plt.plot(xaxis,vec)
Nv=(xaxis)/(10**6)
N2v=(xaxis*2)/(10*6)
N3v=(xaxis*3)/(10*6)
plt.plot(xaxis,Nv,linestyle='--')
plt.plot(xaxis,N2v,linestyle='--')
plt.plot(xaxis,N3v,linestyle='--')
# save your plot in the end
plt.savefig('plot.png')