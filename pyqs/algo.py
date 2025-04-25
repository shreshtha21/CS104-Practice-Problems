import numpy as np
import matplotlib.pyplot as plt
for j in range(0, 27, 3) :
    file1 = f"files/data{j}.txt"
    file2 = f"files/data{j+1}.txt"
    file3 = f"files/data{j+2}.txt"
    i=1
    xl=list()
    yl=list()
    with open(file1,"r") as file:
        for line in file:
            line=int(line.strip())
            if i%2==0:
                xl.append(line)
            else:
                yl.append(line)
            i+=1
    plt.plot(yl,xl,label="QSP1",color='b')
    i=1
    xl1=list()
    yl1=list()
    with open(file2,"r") as file:

            line=int(line.strip())
            if i%2==0:
                xl1.append(line)
            else:
                yl1.append(line)
            i+=1
    plt.plot(yl1,xl1,label="QSRP",color='y')
    i=1
    xl2=list()
    yl2=list()
    with open(file3,"r") as file:
        for line in file:
            line=int(line.strip())
            if i%2==0:
                xl2.append(line)
            else:
                yl2.append(line)
            i+=1
    plt.plot(yl2,xl2,label="BuSo",color='g')
    plt.xlabel("Random Array Size")
    plt.ylabel("Runtime")
    plt.legend()
    plt.show()
    plt.clf()