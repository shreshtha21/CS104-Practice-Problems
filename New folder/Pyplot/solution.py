import matplotlib.pyplot as plt
pip=list()
hops=list()
flush=list()
psfq=list()
fetch=list()
i=1
with open("pip-latency-comparison.txt", "r") as file:
    for line in file:
        if i==1:
            i+=1
            continue
        parts=list(line.strip().split(","))
        hops.append(float(parts[0]) if parts[0] else None)
        pip.append(float(parts[1]) if parts[1] else None)
        flush.append(float(parts[2]) if parts[2] else None)
        psfq.append(float(parts[3]) if parts[3] else None)
        fetch.append(float(parts[4]) if len(parts)>4 and parts[4] else None)
def filter_valid(x, y):
    return zip(*[(xi, yi) for xi, yi in zip(x, y) if xi is not None and yi is not None])
#zip pairs the elements from lists x any together
#then take those pairs in which no element is None
#and then unzip them using * and return the two lists
# Filter data for each plot
h_pip, v_pip = filter_valid(hops, pip)
h_flush, v_flush = filter_valid(hops, flush)
h_psfq, v_psfq = filter_valid(hops, psfq)
h_fetch, v_fetch = filter_valid(hops, fetch)

# Plotting
plt.plot(h_pip, v_pip, color='red', ms=9, mew=2, lw=2, label="PIP")
plt.plot(h_flush, v_flush, color='blue', label="Flush", ms=9, mew=2, lw=2)
plt.plot(h_psfq, v_psfq, color='black', marker='o', ls='-.', label="PSFQ", ms=9, mew=2, lw=2)
plt.plot(h_fetch, v_fetch, color='green', marker='^', ls=':', label="Fetch", ms=9, mew=2, lw=2)
plt.xlabel("Number of Hops")
plt.ylabel("Latency(ms)")
plt.grid()
plt.legend(loc='best')
plt.show()