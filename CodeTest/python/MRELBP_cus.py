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

        coup = np.zeros((width - 2 * in_r, height - 2 * in_r), dtype=object)


        for i in range(0,height - 2 * in_r):
            for j in range(0,width - 2 * in_r):
                area = image[i : i + 2 * in_r +1, j :j +  2 * in_r+1]
                # print(image[i + x][j + x])
                # print(area)
                sum_o[i, j] = np.sum(area)
                # muy = np.mean(area)
                pixel_central[i, j] = image[i + 2 * x][j + 2 * x]
                scale_value = pixel_central[i, j] * ((2*in_r + 1)**2)
    
                # if scale_value == sum_o[i, j]:
                #     print(i, j)

                out[i,j] =  (scale_value >= sum_o[i, j])
                coup[i, j] =  (sum_o[i, j], scale_value, out[i, j], pixel_central[i, j])
        # print(out)
        coup_array = np.array([[f"({np.uint16(t[0])}, {np.uint16(t[1])}, {np.uint8(t[2])}, {np.uint8(t[3])}) " for t in row] for row in coup])

        # np.savetxt("out.txt", out, fmt='%d')
        # np.savetxt("pixel_central.txt", pixel_central, fmt='%d')
        # np.savetxt("muy_arr_central.txt", muy_arr_central, fmt='%d')
        # np.savetxt("diff.txt", pixel_central - muy_arr_central, fmt='%d')
        # np.savetxt("coup.txt", coup_array, fmt='%s')
        centre_hist = np.array([np.sum(out == 1), np.sum(out == 0)], dtype=np.int32)
        return centre_hist, sum_o

    def CI_test(self, image):
        m_3x3, m_5x5, m_7x7, m_9x9 = self.median_processing(image)

        # np.savetxt("matrix_3x3_o", m_3x3, fmt='%d')


        hist_r2, sum_r2 = self.mrelbp_ci(m_3x3, 2)
        hist_r4, sum_r4 = self.mrelbp_ci(m_3x3, 4)
        hist_r6, sum_r6 = self.mrelbp_ci(m_3x3, 6)
        hist_r8, sum_r8 = self.mrelbp_ci(m_3x3, 8)

        # print(hist_r8)


        print(hist_r2, hist_r4, hist_r6, hist_r8)
        # np.savetxt("sum_8.txt", sum_r8, fmt='%d')

    def to_fixed_point(self, value, frac_bits=16):
        return int(value * (2 ** frac_bits))


    def getInterpolation(self, image, x, y, r):
        x1 = int(np.floor(x))
        x2 = int(np.ceil(x))
        y1 = int(np.floor(y))
        y2 = int(np.ceil(y))

        a = x - x1
        b = y - y1


        # print(a, b)
        r1 = (1 - a) * (1-b)
        r2 =  a * (1 - b)
        r3 = (1 - a) * b
        r4 = a * b

        r1_fixed = self.to_fixed_point(r1)
        r2_fixed = self.to_fixed_point(r2)
        r3_fixed = self.to_fixed_point(r3)
        r4_fixed = self.to_fixed_point(r4)

        interpolated_value = (
            image[x1, y1] * r1 +
            image[x1, y2] * r2 +
            image[x2, y1] * r3 +
            image[x2, y2] * r4
        )

        # print(image[x1, y1], image[x1, y2], image[x2, y1], image[x2, y2])
        # print(interpolated_value)


        return interpolated_value
    

    def getNIDescriptor(self, NI, r, sum):
        ni_des = 0
        for index in range(1, 9):
            scale_value = NI[index] * ((2 * r + 1) ** 2)
            # print(scale_value)
            if scale_value >= sum:
                ni_des  = ni_des + 2**(index - 1)

        return ni_des

    def getRDDescriptor(self, r2, r1):
        sum = 0
        for i in range(1, 9):
            if r2[i] >= r1[i]:
                sum = sum + 2**(i - 1)

        return sum
    def ror(self, pixel):
        min_value = 255  
        binary_pixel = bin(pixel)[2:].zfill(8)
        binary_pixel_int = int(binary_pixel, 2)

        for i in range(8):
            # Perform circular right shift
            result = ((binary_pixel_int >> i) | ((binary_pixel_int << (8 - i))) & 0xFF)
            if min_value > result:
                min_value = result
        return  min_value
    
    def checkU2(self, pixel):

        binary_pixel = bin(pixel)[2:].zfill(8)
        # print(binary_pixel)
    
        transitions = 0

        for i in range(8):
            current_bit = binary_pixel[i]
            next_bit = binary_pixel[(i + 1) % 8]  #

            # Check transitions
            if current_bit == '1' and next_bit == '0':
                transitions += 1
            elif current_bit == '0' and next_bit == '1':
                transitions += 1

        # Print the results
        return transitions
    def getSumPixel(self, pixel):
        sum = 0
        binary_pixel = bin(pixel)[2:].zfill(8)
        for i in range(0, 8):
            sum += int(binary_pixel[i]) 
        return sum
            

    def NI_RD_descriptor(self, image_r1, image_r2, r2):
        NI, RD = self.getNI_RD(image_r1, image_r2, r2)
        # print(NI)
        # print(RD)
        NI_out  = np.zeros(NI.shape, dtype= np.uint8)
        RD_out  = np.zeros(NI.shape, dtype= np.uint8)
        NI_width, NI_height = NI.shape
        for i in range(0, NI_height):
            for j in range(0, NI_width):
                NI_min = self.ror(np.uint8(NI[i, j]))
                NI_transitions = self.checkU2(NI_min)
                NI_des = 0
                if NI_transitions <= 2:
                    NI_des = self.getSumPixel(NI_min)
                else:
                    NI_des = 9
                NI_out[i, j] = NI_des

                RD_min  = self.ror(np.uint8(RD[i, j]))
                RD_transitions = self.checkU2(RD_min)
                RD_des = 0
                if RD_transitions <= 2:
                    RD_des = self.getSumPixel(RD_min)
                else:
                    RD_des = 9
                RD_out[i, j] = RD_des
        
        NI_histogram = np.zeros(10, dtype = np.uint8)
        RD_histogram = np.zeros(10, dtype = np.uint8)
        for i in range(0, NI_height):
            for j in range(0, NI_width):
                NI_histogram[NI_out[i, j]] += 1
                RD_histogram[RD_out[i, j]] += 1
        return NI_histogram, RD_histogram
    def MRELBP(self, image):
        m_3x3, m_5x5, m_7x7, m_9x9 = self.median_processing(image)
        # r = 2
        hist_r2, sum_r2 = self.mrelbp_ci(m_3x3, 2)
        NI_r2, RD_r2 = self.NI_RD_descriptor(image, m_3x3, 2)

        print(hist_r2)
        print(NI_r2)

        print(RD_r2)




    def getInterNeighbors(self, image, r, i, j):
        angles = [45, 135, 225, 315]
        results = {}
        S =  np.zeros(9)
        S[1] = image[i, j + r]
                # S2 -> 45
        S[3] = image[i - r, j]
        S[5] = image[i, j - r]
        S[7] = image[i + r, j]
        # print(S[1], S[3], S[5], S[7])

        for angle in angles:
            theta = np.radians(angle)
            target_x = i - r * np.sin(theta)
            target_y = j + r * np.cos(theta)
                    # print(target_x, target_y)
            results[f"{angle}"] = self.getInterpolation(image, target_x, target_y, r)
                
        S[2] = results["45"]
        S[4] = results["135"]
        S[6] = results["225"]
        S[8] = results["315"]

        return S

    def getNI_RD(self, image_r1, image_r2, r2):
        width, height = image_r2.shape
        NI = np.zeros((width - 2 * r2, height - 2 * r2))
        RD = np.zeros((width - 2 * r2, height - 2 * r2))
        r1 = r2 - 1
    

        for i in range(r2,height - r2):
            for j in range(r2,width -r2):
                area = image_r2[i - r2  : i  + r2 + 1 , j  - r2 :j + r2 + 1]
                sum_r2_patch = np.sum(area)
                r1_descriptor = self.getInterNeighbors(image_r1, r1, i, j)
                r2_descriptor = self.getInterNeighbors(image_r2, r2, i, j)               
                NI[i - r2, j - r2] = self.getNIDescriptor(r2_descriptor, r2, sum_r2_patch)
                RD[i - r2, j - r2] = self.getRDDescriptor(r2_descriptor, r1_descriptor)
       
        return NI, RD



# Example Usage
np.random.seed(1)


random_matrix = np.random.randint(0, 256, size=(100, 100), dtype=np.uint8)
median_matrix = median_filter(random_matrix, size=3, mode='constant', cval=0)

print(random_matrix)
print(median_matrix)
# file_path = "random_matrix.txt"

# with open('output_3x3.txt', 'a') as f:
#     for row in random_matrix:
#         f.write(' '.join(map(str, row)) + '\n')
#     f.write('\n')
# np.savetxt("D:\\Thesis\Src\\test_benches\\test\\random_matrix.txt", random_matrix, fmt='%d')

# padded_result = median_filter(random_matrix, size=3, mode='constant', cval=0)

# with open('output_3x3.txt', 'a') as f:
#     for row in padded_result:
#         f.write(' '.join(map(str, row)) + '\n')
# np.savetxt(file_path, random_matrix, fmt='%d')

# cpp_array = 'uint8_t array[30]307] = {\n'
# for row in random_matrix:
#     cpp_array += '{' + ', '.join(map(str, row)) + '},\n'
# cpp_array += '};'

# print("\nC++ Code for 30x30 Array:")
# print(cpp_array)

# with open("matrix_cpp.txt", "w") as f:
#     f.write(cpp_array)

lbp = MRELBP()
lbp.MRELBP(random_matrix)

# lbp.CI_test(random_matrix)