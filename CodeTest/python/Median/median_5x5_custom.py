import numpy as np
from scipy.ndimage import median_filter

# Ma trận đầu vào (7x7)
input_matrix = np.array([
    [12, 24, 35, 47, 58, 61, 72],
    [83, 94, 105, 106, 117, 128, 139],
    [150, 151, 162, 173, 184, 195, 196],
    [207, 218, 229, 240, 10, 20, 30],
    [40, 50, 60, 70, 80, 90, 100],
    [110, 120, 130, 140, 150, 160, 170],
    [180, 190, 200, 210, 220, 230, 240]
])
# Save the result to output2.txt
with open('output_5x5.txt', 'a') as f:
    for row in input_matrix:
        f.write(' '.join(map(str, row)) + '\n')
    f.write('\n')

print("Median filtered matrix saved to 'output5x5.txt'.")
# Áp dụng median filter với cửa sổ 3x3
padded_result = median_filter(input_matrix, size=5, mode='constant', cval=0)

# Save the result to output2.txt
with open('output_5x5.txt', 'a') as f:
    for row in padded_result:
        f.write(' '.join(map(str, row)) + '\n')

print("Median filtered matrix saved to 'output5x5.txt'.")

