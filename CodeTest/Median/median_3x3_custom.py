import numpy as np
from scipy.ndimage import median_filter

# Ma trận đầu vào (7x7)
input_matrix = np.array([
   [12, 24, 35, 47, 58],
   [61, 72, 83, 94, 105],
   [106, 117, 128, 139, 150],
   [151, 162, 173, 184, 195],
   [196, 207, 218, 229, 240]
])
# Save the result to output2.txt
with open('output_3x3.txt', 'a') as f:
    for row in input_matrix:
        f.write(' '.join(map(str, row)) + '\n')
    f.write('\n')

print("Median filtered matrix saved to 'output5x5.txt'.")
# Áp dụng median filter với cửa sổ 3x3
padded_result = median_filter(input_matrix, size=3, mode='constant', cval=0)

# Save the result to output2.txt
with open('output_3x3.txt', 'a') as f:
    for row in padded_result:
        f.write(' '.join(map(str, row)) + '\n')

print("Median filtered matrix saved to 'output5x5.txt'.")

