import numpy as np
import matplotlib.pyplot as plt

def read_data(filepath):
    x, y = [], []
    with open(filepath, "r") as file:
        for i, line in enumerate(file, 1):
            value = int(line.strip())
            if i % 2 == 0:
                x.append(value)
            else:
                y.append(value)
    return x, y

for j in range(0, 27, 3):
    file1 = f"files/data{j}.txt"
    file2 = f"files/data{j+1}.txt"
    file3 = f"files/data{j+2}.txt"

    x1, y1 = read_data(file1)
    x2, y2 = read_data(file2)
    x3, y3 = read_data(file3)

    plt.plot(y1, x1, label="QSP1", color='b')
    plt.plot(y2, x2, label="QSRP", color='y')
    plt.plot(y3, x3, label="BuSo", color='g')

    plt.xlabel("Random Array Size")
    plt.ylabel("Runtime")
    plt.legend()
    plt.title(f"Plot for files data{j}.txt, data{j+1}.txt, data{j+2}.txt")
    plt.show()
    plt.clf()
