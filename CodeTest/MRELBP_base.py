import numpy as np
import math

class MRELBP:
    """
    Multi-Radius Extended Local Binary Patterns (MRELBP)
    Parameters:
        r1 : list of int
            Radius for RELBP_NI and RELBP_RD descriptor.
        p : int
            Number of neighbors. Default is 8.
        w_c : int
            Patch size for median filter and RELBP_CI calculation (must be odd).
        w_r : list of int
            Patch size for each radius (must be odd).
    """
    def __init__(self, r1=[2, 4, 6, 8], p=8, w_c=3, w_r=[3, 5, 7, 9]):
        self.r1 = r1
        self.p = p
        self.w_c = w_c
        self.w_r = w_r
        self.radial_angles = (np.arange(0, self.p) * -(2 * math.pi) / self.p).astype(np.float32)
        print(self.radial_angles)
        self.padding = max(r) + int((max(w_r) - 1) / 2)

    def relbp_ci(self, image):
        """
        Calculates the Centre Histogram (RELBP_CI).
        Parameters:
            image : ndarray
                Input image as a 2D numpy array.
        Returns:
            centre_hist : ndarray
                Histogram array with two bins [count ==1, count == 0].
        """
        w_c = self.w_c
        height, width = image.shape  # Corrected image shape
        image = np.pad(image, pad_width=1, mode='constant', constant_values=0)
        # print(image)
        lbp_ci = np.zeros((height, width))
        
        print(height)
        for i in range(1, height + 1):
            for j in range(1, width + 1):
                patch = image[i - 1:  i + w_c - 1, j - 1: j + w_c - 1]
                # print(centre)
                lbp_ci[i - 1, j - 1] = (image[i, j] - np.mean(patch)) >= 0

        # print(new_img)
        centre_hist = np.array([np.sum(lbp_ci == 1), np.sum(lbp_ci == 0)], dtype=np.int32)
        print(centre_hist)
      

        return centre_hist

    def relbp_ni(self, image):
        height, width = image.shape
        lbp_ni = np.zeros((width, height))


# Example Usage
image = np.array([
    [1, 2, 3, 2, 1],
    [4, 5, 6, 5, 4],
    [7, 8, 9, 8, 7],
    [4, 5, 6, 5, 4],
    [1, 2, 3, 2, 1]
], dtype=np.float32)



lbp = MRELBP()
lbp.relbp_ci(image)
# print("Centre Histogram:", centre_hist)
