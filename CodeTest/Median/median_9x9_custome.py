import numpy as np
from scipy.ndimage import median_filter

# Tạo ma trận đầu vào 11x11
input_matrix = np.random.randint(0, 256, (11, 11))  # Ma trận ngẫu nhiên với giá trị từ 0 đến 255

# Áp dụng bộ lọc trung vị với kích thước 9x9 và zero padding
output_matrix = median_filter(input_matrix, size=9, mode='constant', cval=0)

print("Ma trận đầu vào (11x11):")
print(input_matrix)

with open('output_9x9.txt', 'a')  as f:
    for row in input_matrix:
        f.write(' '.join(map(str, row)) + '\n')
    f.write('\n')

print("Median filtered matrix saved to 'output2.txt'.")

print("\nMa trận sau khi áp dụng median filter (kích thước 9x9, zero padding):")
print(output_matrix)


with open('output_9x9.txt', 'a')  as f:
    for row in output_matrix:
        f.write(' '.join(map(str, row)) + '\n')
    f.write('\n')
