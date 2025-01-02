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
        out = np.zeros((width - 2 * in_r, height - 2 * in_r))

        x = int(in_r /  2)
        sum_o = np.zeros((width - 2 * in_r, height - 2 * in_r))

        pixel_central =  np.zeros((width - 2 * in_r, height - 2 * in_r))
        muy_arr_central = np.zeros((width - 2 * in_r, height - 2 * in_r))


        for i in range(0,height - 2 * in_r):
            for j in range(0,width - 2 * in_r):
                area = image[i : i + 2 * in_r +1, j :j +  2 * in_r+1]
                # print(image[i + x][j + x])
                # print(area)
                sum_o[i, j] = np.sum(area)
                muy = np.mean(area)
                pixel_central[i, j] = image[i + 2 * x][j + 2 * x]
                muy_arr_central[i, j] = muy
                out[i,j] = (image[i + 2 * x, j +  2 * x] ) >= muy
        # print(out)

        np.savetxt("out.txt", out, fmt='%d')
        np.savetxt("pixel_central.txt", pixel_central, fmt='%d')
        np.savetxt("muy_arr_central.txt", muy_arr_central, fmt='%d')

        centre_hist = np.array([np.sum(out > 0), np.sum(out <= 0)], dtype=np.int32)
        return centre_hist, sum_o

    def CI_test(self, image):
        m_3x3, m_5x5, m_7x7, m_9x9 = self.median_processing(image)

        np.savetxt("matrix_3x3_o", m_3x3, fmt='%d')


        hist_r2, sum_r2 = self.mrelbp_ci(m_3x3, 2)
        # hist_r4, sum_r4 = self.mrelbp_ci(m_3x3, 4)
        # hist_r6, sum_6 = self.mrelbp_ci(m_3x3, 6)
        # hist_r8, sum_r8 = self.mrelbp_ci(m_3x3, 8)

        print(hist_r2)

        # print(hist_r2, hist_r4, hist_r6, hist_r8)
        np.savetxt("sum_3.txt", sum_r2, fmt='%d')



        # print(m_3x3)



# Example Usage
np.random.seed(42)


random_matrix = np.random.randint(0, 256, size=(30, 30), dtype=np.uint8)
# print(random_matrix)
file_path = "random_matrix.txt"

np.savetxt(file_path, random_matrix, fmt='%d')
flattened_matrix = random_matrix.flatten()

np.savetxt("random_matrix_hex.txt", flattened_matrix, fmt='%02X', delimiter=" ")



lbp = MRELBP()
lbp.CI_test(random_matrix)
