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

# Áp dụng median filter với cửa sổ 3x3
median_matrix = median_filter(input_matrix, size=5)

print("Median Matrix (using scipy):\n", median_matrix)

