import numpy as np
from PIL import Image

def median_filter_3x3(input_matrix):
    # Get the shape of the input matrix
    rows, cols = input_matrix.shape
    
    # Initialize the output matrix with zeros
    output_matrix = np.zeros((rows, cols), dtype=np.uint8)
    
    # Add zero padding to the input matrix
    padded_matrix = np.pad(input_matrix, pad_width=1, mode='constant', constant_values=0)
    
    # Define a helper function to find the median of a list of values
    def median_of_group(group):
        return np.median(group)

    # Iterate over each element in the matrix (excluding padding)
    for i in range(1, rows+1):
        for j in range(1, cols+1):
            # Extract the 3x3 kernel around the current element
            kernel = padded_matrix[i-1:i+2, j-1:j+2].flatten()

            # Split the kernel into 3 groups, each containing 3 elements
            group1 = kernel[:3]
            group2 = kernel[3:6]
            group3 = kernel[6:]

            # Compute the median for each group
            median1 = median_of_group(group1)
            median2 = median_of_group(group2)
            median3 = median_of_group(group3)

            # Find the overall median from the 3 medians
            output_matrix[i-1, j-1] = np.median([median1, median2, median3])

    return output_matrix

# Define the input matrix
input_matrix = np.array([
    [12, 24, 35, 47, 58],
    [61, 72, 83, 94, 105],
    [106, 117, 128, 139, 150],
    [151, 162, 173, 184, 195],
    [196, 207, 218, 229, 240]
], dtype=np.uint8)

# image_path = 'D:\\Thesis\\Data\\Ex\\sample.bmp'  # Replace with the path to your BMP image
# img = Image.open(image_path)

# # Convert the image to grayscale (if it's a color image)
# img_gray = img.convert('L')

# # Step 2: Convert the image data to a numpy array
# img_array = np.array(img_gray)

# Apply the median filter
output_matrix = median_filter_3x3(input_matrix)

# Convert the output matrix back to an image
# filtered_img = Image.fromarray(output_matrix)

# # Step 5: Save the result as a new BMP file
# filtered_img.save('res1.bmp')

# Save the result to output1.txt
with open('output2.txt', 'w') as f:
    for row in output_matrix:
        f.write(' '.join(map(str, row)) + '\n')

print("Median filtered matrix saved to 'output1.txt'.")
