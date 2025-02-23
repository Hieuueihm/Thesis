import numpy as np
from scipy import ndimage
from PIL import Image

# Step 1: Read the BMP image
image_path = 'D:\\Thesis\\data\\Ex\\sample.bmp'  # Replace with the path to your BMP image
img = Image.open(image_path)

# Convert the image to grayscale (if it's a color image)
img_gray = img.convert('L')

# Step 2: Convert the image data to a numpy array
img_array = np.array(img_gray)

# Step 3: Apply the median filter using scipy's median_filter function
# You can adjust the size of the filter. Here, it's set to a 3x3 filter.
filtered_img_array = ndimage.median_filter(img_array, size=3)

# Step 4: Convert the filtered array back to an image
filtered_img = Image.fromarray(filtered_img_array)

# Step 5: Save the result as a new BMP file
filtered_img.save('image_scipy.bmp')

# Step 6: Write raw pixel values to a text file (output.txt)
with open('output.txt', 'w') as f:
    for row in filtered_img_array:
        f.write(' '.join(map(str, row)) + '\n')  # Write each row as space-separated pixel values

print("Median filter applied and saved as 'res.bmp'. Pixel values written to 'output.txt'.")
