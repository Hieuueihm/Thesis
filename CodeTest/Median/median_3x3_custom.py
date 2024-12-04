import numpy as np
from scipy.ndimage import median_filter

def median_filter_verilog_logic(input_matrix):
    """
    Apply the median filter on a 3x3 neighborhood using the Verilog logic described.
    """
    rows, cols = input_matrix.shape
    output_matrix = np.zeros((rows, cols), dtype=np.uint8)
    padded_matrix = np.pad(input_matrix, pad_width=1, mode='constant', constant_values=0)

    def sort3(a, b, c):
        """Sort three numbers and return min, median, and max."""
        nums = sorted([a, b, c])
        return nums[0], nums[1], nums[2]

    for i in range(1, rows + 1):
        for j in range(1, cols + 1):
            # Extract the 3x3 neighborhood
            kernel = padded_matrix[i-1:i+2, j-1:j+2].flatten()

            # Stage 1: Sort rows
            min1, med1, max1 = sort3(kernel[0], kernel[1], kernel[2])
            min2, med2, max2 = sort3(kernel[3], kernel[4], kernel[5])
            min3, med3, max3 = sort3(kernel[6], kernel[7], kernel[8])

            # Stage 2: Find max of mins, median of medians, min of maxes
            _, max4, max5 = sort3(min1, min2, min3)  # Find max of mins
            _, med5, _ = sort3(med1, med2, med3)  # Median of medians
            min5, _, _ = sort3(max1, max2, max3)  # Min of maxes

            # Stage 3: Final sorting of min5, med5, max5
            _, median, _ = sort3(min5, med5, max5)

            # Assign the median to the output
            output_matrix[i-1, j-1] = median

    return output_matrix

# Example usage
input_matrix = np.array([
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15],
    [16, 17, 18, 19, 20],
    [21, 22, 23, 24, 25]
], dtype=np.uint8)

# Apply the Verilog logic-based median filter
output_matrix = median_filter_verilog_logic(input_matrix)
padded_result = median_filter(input_matrix, size=3, mode='constant', cval=0)

# Save the result to output2.txt
with open('output_3x3.txt', 'a') as f:
    for row in output_matrix:
        f.write(' '.join(map(str, row)) + '\n')

print("Median filtered matrix saved to 'output2.txt'.")
