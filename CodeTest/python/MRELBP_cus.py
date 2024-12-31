import numpy as np
import math
from itertools import zip_longest
from scipy.ndimage import median_filter
import cv2
from PIL import Image



class MRELBP():
    def __init__(self, r=[2, 4, 6, 8], p = 8, w_c = 3, w_r = [3, 5, 7, 9]):
        self.r = r
        self.p = p
        self.w_c = w_c 
        self.w_r = w_r
        # step : 
        #   RGB2Gray
        #   Median
        #   CI 
        #   Bi-interpolation -> RI & ND 
        #   Histogram

    def RGB2Gray(self, image):
        # convert RGB to gray image 
        img_array = np.array(image)
        R, G, B = img_array[:, :, 0], img_array[:, :, 1], img_array[:, :, 2]
        Y = (R >> 2) + (R >> 5) + (G >> 1) + (G >> 4) + (B >> 4) + (B >> 5)
        return Y
    def median_processing(self, image):
        m_3x3 = median_filter(image, size = self.w_r[0], mode='constant', cval=0)
        m_5x5 = median_filter(image, size = self.w_r[1], mode='constant', cval=0)
        m_7x7 = median_filter(image, size = self.w_r[2], mode='constant', cval=0)
        m_9x9 = median_filter(image, size = self.w_r[3], mode='constant', cval=0)
        return m_3x3, m_5x5, m_7x7, m_9x9

    

    def mrelbp_ci(self, image, in_r):
        # r = 2 -> window_size = 5
        window_size = 2 * in_r + 1

        width, height = image.shape
        out = np.zeros((width - in_r, height - in_r))

        x = int(in_r /  2)


        for i in range(0,height - in_r):
            for j in range(0,width - in_r):
                area = image[i : i + in_r +1, j :j + in_r+1]
                print(image[i + x][j + x])
                print(area)
                muy = np.mean(area)
                print(muy)
                out[i,j] = (image[i + x, j + x] - muy) >= 0
        print(out)
        centre_hist = np.array([np.sum(out > 0), np.sum(out <= 0)], dtype=np.int32)
        print(centre_hist)
        return centre_hist


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