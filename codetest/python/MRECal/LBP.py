import numpy as np

def calculate_lbp(matrix, radius=1):
    height, width = matrix.shape
    lbp = np.zeros((height, width), dtype=np.uint8)
    
    for i in range(radius, height - radius):
        for j in range(radius, width - radius):
            center_value = matrix[i, j]
            binary_string = ''
            
            for dy in range(-radius, radius + 1):
                for dx in range(-radius, radius + 1):
                    if dx == 0 and dy == 0:
                        continue  
                    
                    neighbor_value = matrix[i + dy, j + dx]
                    binary_string += '1' if neighbor_value >= center_value else '0'
            
            lbp[i, j] = int(binary_string, 2)
    
    return lbp