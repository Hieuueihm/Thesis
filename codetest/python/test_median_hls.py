import numpy as np
from scipy.ndimage import median_filter
def write_to_filecheck(file, data):
    with open(file, 'w') as f:
        for i in range(data.shape[0]):
            for j in range(data.shape[1]):
                f.write(str(data[i, j]))
                f.write("\n")
# Tạo ma trận 10x10 với giá trị từ 0 đến 100
idx = 0
size = 10
matrix = np.zeros((size, size), dtype = np.uint8)
for i in range(size):
    for j in range(size):
        matrix[i][j] = idx % 256
        idx +=1
# In ma trận
# print(matrix)

m_3x3 = median_filter(matrix, size = 3, mode='constant', cval=0)
m_5x5 = median_filter(matrix, size = 5, mode='constant', cval=0)
m_7x7 = median_filter(matrix, size = 7, mode='constant', cval=0)

write_to_filecheck("m_3x3_py_testhls", m_3x3)
write_to_filecheck("m_5x5_py_testhls", m_5x5)
write_to_filecheck("m_7x7_py_testhls", m_7x7)

# print(m_3x3)

def compare_files(file1, file2):
    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        line_number = 1
        mismatch_found = False
        # Read each line from both files
        while True:
            line1 = f1.readline().strip()
            line2 = f2.readline().strip()


        

            # If both lines are empty, the files are identical up to this point
            if not line1 and not line2:
                break
            # sum_1 += int(line1)
            # sum_2 += int(line2)
            # If one of the files ends and the other doesn't, it's a mismatch
            if not line1 or not line2:
                print(f"Mismatch found at line {line_number}:")
                print(f"File 1: {line1}")
                print(f"File 2: {line2}")
                mismatch_found = True
                break

            # Convert the lines to integers and compare
            try:
                int_line1 = int(line1)
                int_line2 = int(line2)
            except ValueError:
                print(f"Invalid integer at line {line_number}:")
                print(f"File 1: {line1}")
                print(f"File 2: {line2}")
                mismatch_found = True
                break

            # If the integer values are different, report the mismatch
            if int_line1 != int_line2:
                print(f"Mismatch found at line {line_number}:")
                print(f"File 1: {int_line1}")
                print(f"File 2: {int_line2}")
                mismatch_found = True
                # diff += abs(int(line1) - int(line2))


            line_number += 1

        if not mismatch_found:
            print("The files are identical.")

compare_files("m_3x3_py_testhls", "m_3x3_hls.txt")
# compare_files("m_5x5_py_testhls", "m_5x5_hls.txt")
# compare_files("m_7x7_py_testhls", "m_7x7_hls.txt")