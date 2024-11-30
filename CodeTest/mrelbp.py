import cv2
import numpy as np

def compute_lbp(image, radius, points):
    """
    Compute Local Binary Pattern (LBP) for an image.
    :param image: Grayscale input image
    :param radius: Radius of the LBP
    :param points: Number of circularly symmetric neighbor points
    :return: LBP image
    """
    lbp = np.zeros_like(image, dtype=np.uint8)
    for y in range(radius, image.shape[0] - radius):
        for x in range(radius, image.shape[1] - radius):
            center = image[y, x]
            binary_string = ""
            for p in range(points):
                theta = 2.0 * np.pi * p / points
                y_offset = int(round(y + radius * np.sin(theta)))
                x_offset = int(round(x + radius * np.cos(theta)))
                neighbor_value = image[y_offset, x_offset]
                binary_string += '1' if neighbor_value >= center else '0'
            lbp[y, x] = int(binary_string, 2)
    return lbp

def compute_mrelbp(image, radius=1, points=8):
    """
    Compute Median Robust Extended LBP (MRELBP) for a given image.
    :param image: Grayscale input image
    :param radius: Radius for the LBP
    :param points: Number of points for the LBP
    :return: MRELBP histogram
    """
    # Compute the median
    median_img = cv2.medianBlur(image, ksize=3)
    
    # Compute LBP for median image
    lbp_median = compute_lbp(median_img, radius, points)
    
    # Compute LBP for the original image
    lbp_original = compute_lbp(image, radius, points)
    
    # Extended: Combine the LBP histograms
    hist_median, _ = np.histogram(lbp_median.ravel(), bins=256, range=(0, 256))
    hist_original, _ = np.histogram(lbp_original.ravel(), bins=256, range=(0, 256))
    
    # Concatenate histograms to form MRELBP
    mrelbp_histogram = np.concatenate((hist_median, hist_original))
    
    return mrelbp_histogram

# Example usage:
if __name__ == "__main__":
    # Load an example image (convert to grayscale)
    image = cv2.imread("Data\Ex\download.jpg.jpg", cv2.IMREAD_GRAYSCALE)
    # print(image)
    # if image is None:
    #     raise ValueError("Image not found. Please ensure 'example.jpg' exists.")
    
    # Compute MRELBP
    mrelbp_histogram = compute_mrelbp(image)
    
    print("MRELBP Histogram:")
    print(mrelbp_histogram)
