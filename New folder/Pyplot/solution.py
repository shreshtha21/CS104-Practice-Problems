import matplotlib.pyplot as plt

# Read the data from the text file
file_name = "pip-latency-comparison.txt"
x = []
pip = []
flush = []
psfq = []
fetch = []

# Open the file and read line by line
with open(file_name, 'r') as file:
    header_skipped = False
    for line in file:
        # Skip the header row
        if not header_skipped:
            header_skipped = True
            continue
        
        # Split each line into columns (assuming tab-separated values)
        columns = line.split(",")
        
        # Ensure there are enough columns (at least 5)
        if len(columns) < 5:
            continue
        
        # Extract values and append to respective lists
        try:
            x.append(int(columns[0]))  # Number of Hops
            pip.append(float(columns[1]))  # PIP latency
            flush.append(float(columns[2]))  # Flush latency
            psfq.append(float(columns[3]))  # PSFQ latency
            fetch.append(float(columns[4]))  # Fetch latency
        except ValueError:
            # Skip rows with invalid data
            continue

# Plot the line graphs for the specified columns
plt.figure(figsize=(10, 6))

# PIP plot
plt.plot(x, pip, label='PIP', color='red', marker='x', linestyle='solid', markersize=9, markeredgewidth=2, linewidth=2)

# Flush plot
plt.plot(x, flush, label='Flush', color='blue', marker='+', linestyle='dashed', markersize=9, markeredgewidth=2, linewidth=2)

# PSFQ plot
plt.plot(x, psfq, label='PSFQ', color='black', marker='o', linestyle='dashdot', markersize=9, markeredgewidth=2, linewidth=2)

# Fetch plot
plt.plot(x, fetch, label='Fetch', color='green', marker='^', linestyle='dotted', markersize=9, markeredgewidth=2, linewidth=2)

# Set the labels and title
plt.xlabel('Number of Hops')
plt.ylabel('Latency (ms)')

# Display the grid
plt.grid(True)

# Display the legend at the best location
plt.legend(loc='best')

# Show the plot
plt.show()
