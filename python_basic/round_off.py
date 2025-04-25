import math

def truncate(number, decimals):
    factor = 10 ** decimals
    return math.trunc(number * factor) / factor

# Example usage:
result = truncate(3.14159, 2)
print(result)  # Output will be 3.14
