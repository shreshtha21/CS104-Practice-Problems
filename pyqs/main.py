import numpy as np
import matplotlib.pyplot as plt
import time
"""
Import vectorized() and nonvectorized() from operation.py
Use the testcases given in the folder testcases to test your code here. You can print the result to check if it is correct.
"""
from operation import vectorized
from operation import nonvectorized
import t
# read the testcases from the testcases/in folder




"""
Read the values from data/nonvectorized.txt and data/vectorized.txt into separate lists
Read values as float values.
"""


plt.figure(figsize=(10,6)) # Don't change this line

"""
Draw a plot as specified in the problem statment using above values
"""
# Plot the execution times against N


# Plot the reference lines


# Add labels and legend
plt.xlabel('Input Size N')
plt.ylabel('Execution time (s)')
plt.legend()

# save your plot in the end
plt.savefig('plot.png')
