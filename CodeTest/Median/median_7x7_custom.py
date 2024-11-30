import numpy as np
from scipy.ndimage import median_filter

# Input matrix

# 0   0   0   0   0   0   0
# 0   0   0   0   0   0   0
# 0   0   0   0   0   0   0
# 12  24  35  47  58  61  72
# 105 106 117 128 139 150 151
# 184 195 196 207 218 229 240
# 30  40  50  60  70  80  90







input_matrix = np.array([
    [12, 24, 35, 47, 58, 61, 72, 83, 94],
    [105, 106, 117, 128, 139, 150, 151, 162, 173],
    [184, 195, 196, 207, 218, 229, 240, 10, 20],
    [30, 40, 50, 60, 70, 80, 90, 100, 110],
    [120, 130, 140, 150, 160, 170, 180, 190, 200],
    [210, 220, 230, 240, 250, 5, 15, 25, 35],
    [45, 55, 65, 75, 85, 95, 105, 115, 125],
    [135, 145, 155, 165, 175, 185, 195, 205, 215],
    [225, 235, 245, 255, 4, 14, 24, 34, 44]
])

with open('output_7x7.txt', 'a')  as f:
    for row in input_matrix:
        f.write(' '.join(map(str, row)) + '\n')
    f.write('\n')

print("Median filtered matrix saved to 'output2.txt'.")


# Apply median filter with zero padding
padded_result = median_filter(input_matrix, size=7, mode='constant', cval=0)

# Print the result
print("Filtered Matrix with Median:")
print(padded_result)
with open('output_7x7.txt', 'a')  as f:
    for row in padded_result:
        f.write(' '.join(map(str, row)) + '\n')

print("Median filtered matrix saved to 'output2.txt'.")

