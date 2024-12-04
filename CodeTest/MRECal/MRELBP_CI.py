import numpy as np
from LBP import calculate_lbp
from scipy.ndimage import median_filter

def sign_function(input):
    if input > 0:
        return 1
    return 0
def calculate_mrelbp(matrix, radius=1):
    """
        Step 1: calculate mu_w -> mean of the result after applying filter to the local patch
    """
    height, width = matrix.shape
    padded_matrix = np.pad(matrix, pad_width=radius, mode='constant', constant_values=0)
    mu_3 = 0
    index = 0
    print(padded_matrix)
    for i in range(0, height):
        for j in range(0, width):
            Xc3 = padded_matrix[i: i + 3, j : j + 3]
            print(Xc3)
            median_res = np.median(Xc3)
            print(median_res)
            mu_3 = mu_3 + median_res
            index = index + 1
    mu_3 = mu_3 / index
    output = np.zeros((5, 5))
    
    for i in range(0, height):
        for j in range(0, width):
            Xc3 = padded_matrix[i: i + 3, j : j + 3]
            median_res = np.median(Xc3)
            output[i, j] = sign_function(median_res - mu_3)
    print(output)
if __name__ == "__main__":
    # Example 5x5 matrix
    example_matrix = np.array([
        [10, 20, 30, 40, 50],
        [15, 25, 35, 45, 55],
        [20, 30, 40, 50, 60],
        [25, 35, 45, 55, 65],
        [30, 40, 50, 60, 70]
    ], dtype=np.float32)
    
    calculate_mrelbp(example_matrix, radius=1)
    