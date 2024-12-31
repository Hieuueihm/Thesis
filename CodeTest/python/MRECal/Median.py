import numpy as np
def calculate_median(matrix, radius=1):
    """
    Calculate the median-filtered matrix.
    
    Args:
        matrix (ndarray): Input 2D array (grayscale image).
        radius (int): Radius of the median filter.
    
    Returns:
        median_matrix (ndarray): Median-filtered matrix.
    """
    height, width = matrix.shape
    median_matrix = np.zeros_like(matrix)
    
    for i in range(height):
        for j in range(width):
            patch = median_matrix[i:i + 2 * radius + 1, j:j + 2 * radius + 1]
            median_matrix[i, j] = np.median(patch)
    
    return median_matrix