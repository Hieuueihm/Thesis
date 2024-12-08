import numpy as np
import math
from itertools import zip_longest
from scipy.ndimage import median_filter
import cv2


class MRELBP():
    def __init__(self, r=[2, 4, 6, 8], p = 8, w_c = 3, w_r = [3, 5, 7, 9]):
        self.r = r
        self.p = p
        self.w_c = w_c 
        self.w_r = w_r
        self.padding = max(r) + int((max(w_r) - 1) / 2) # 8 + 4 = 12
        self.radial_angles = (np.arange(0, self.p) * -(2 * math.pi) / self.p).astype(np.float32) # 2*pi*n / p -> 
        # print(self.radial_angles)

    def RGB2Gray(self, image):
        gray_image = cv2.cvtColor(image, cv2.COLOR_RGB2GRAY)
        return gray_image
    def median_processing(self, image):
        m_3x3 = median_filter(image, size = w_r[0], mode='constant', cval=0)
        m_5x5 = median_filter(image, size = w_r[1], mode='constant', cval=0)
        m_7x7 = median_filter(image, size = w_r[2], mode='constant', cval=0)
        m_9x9 = median_filter(image, size = w_r[3], mode='constant', cval=0)

        return m_3x3, m_5x5, m_7x7, m_9x9

    def mrelbp_ci(self, image, in_r):
        out = np.zeros(image.shape)
        pad_image = np.pad(image, pad_width=in_r, mode='constant', constant_values=0)
        width, height = pad_image.shape

        for i in range(in_r,height - in_r):
            for j in range(in_r,width - in_r):
                # print(pad_image[i - in_r: i + in_r +1, j - in_r:j + in_r+1])
                # return 
                area = pad_image[i - in_r: i + in_r +1, j - in_r:j + in_r+1]
                muy = np.mean(area)
                out[i - in_r, j - in_r] = (image[i - in_r, j - in_r] - muy) >= 0
        centre_hist = np.array([np.sum(out > 0), np.sum(out <= 0)], dtype=np.int32)
        print(centre_hist)
        print(out)


# Example Usage
image = np.array([
    [1, 2, 3, 2, 1],
    [4, 5, 6, 5, 4],
    [7, 8, 9, 8, 7],
    [4, 5, 6, 5, 4],
    [1, 2, 3, 2, 1]
], dtype=np.float32)

lbp = MRELBP()
lbp.mrelbp_ci(image, 2)