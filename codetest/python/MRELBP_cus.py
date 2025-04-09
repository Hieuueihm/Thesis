import numpy as np
import math
from itertools import zip_longest
from scipy.ndimage import median_filter
import cv2
from PIL import Image
import time
import math

def write_to_filecheck(file, data):
    with open(file, 'w') as f:
        for i in range(data.shape[0]):
            for j in range(data.shape[1]):
                f.write(str(data[i, j]))
                f.write("\n")
def float_to_fixed_point(value, frac_bits=16):
    # Convert a floating point value to fixed-point with 16 fractional bits
    return int(value * (2 ** frac_bits))

def float_to_hex(value, frac_bits=16):
    # Convert floating point value to fixed-point and then to hexadecimal
    fixed_point_value = float_to_fixed_point(value, frac_bits)
    return hex(fixed_point_value)

class MRELBP():
    def __init__(self, r=[2, 4, 6, 8], p = 8, w_c = 3, w_r = [3, 5, 7, 9]):
        self.r = r
        self.p = p
        self.w_c = w_c
        self.w_r = w_r
        self.count = 0
        # step :
        #   RGB2Gray
        #   Median
        #   CI
        #   Bi-interpolation -> RI & ND
        #   Histogram

    def median_processing(self, image):
        m_3x3 = median_filter(image, size = self.w_r[0], mode='constant', cval=0)
        m_5x5 = median_filter(image, size = self.w_r[1], mode='constant', cval=0)
        m_7x7 = median_filter(image, size = self.w_r[2], mode='constant', cval=0)
        m_9x9 = median_filter(image, size = self.w_r[3], mode='constant', cval=0)
        return m_3x3, m_5x5, m_7x7, m_9x9



    def mrelbp_ci(self, image, in_r):
        # r = 2 -> window_size = 5
        window_size = 2 * in_r + 1

        height, width = image.shape
        # print(height, width)
        out = np.zeros((height - 2 * in_r, width - 2 * in_r), dtype=np.uint8)

        sum_o = np.zeros((height - 2 * in_r, width - 2 * in_r))

        pixel_central =  np.zeros((height - 2 * in_r, width - 2 * in_r))
  


        for i in range(0,height - 2 * in_r ):
            for j in range(0,width - 2 * in_r ):
                area = image[i : i +window_size, j :j +  window_size]
                # print(image[i + x][j + x])
                # print(area)
                # print(i, j)

                sum_o[i, j] = np.sum(area)
                # muy = np.mean(area)
                pixel_central[i, j] = image[i + in_r, j + in_r]
                # pixel_central[i, j] = image[i + 2 * x][j + 2 * x]
                scale_value = pixel_central[i, j] * ((2*in_r + 1)**2)

                # if scale_value == sum_o[i, j]:
                #     print(i, j)

                out[i,j] =  (scale_value >= sum_o[i, j])

        centre_hist = np.array([np.sum(out == 1), np.sum(out == 0)], dtype=np.int32)
        # np.savetxt("sum", sum_o, fmt='%d')
        # np.savetxt("central", pixel_central, fmt='%d')

        return out, centre_hist

   
    def getinterpolation(self, image, x, y, r):
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
        # print(r1)

        interpolated_value = (
            image[x1, y1] * r1 +
            image[x1, y2] * r2 +
            image[x2, y1] * r3 +
            image[x2, y2] * r4
        )
        fraction_bits = 16

        # Chuyển đổi sang fixed-point 24-bit
        fixed_r1 = int(r1 * (1 << fraction_bits))
        fixed_r2 = int(r2 * (1 << fraction_bits))
        fixed_r3 = int(r3 * (1 << fraction_bits))
        fixed_r4 = int(r4 * (1 << fraction_bits))

        # In kết quả dưới dạng hex
        # print(f"r1: {fixed_r1:06x}")
        # print(f"r2: {fixed_r2:06x}")
        # print(f"r3: {fixed_r3:06x}")
        # print(f"r4: {fixed_r4:06x}")


        # print(image[x1, y1], image[x1, y2], image[x2, y1], image[x2, y2])
        # print(interpolated_value)


        return interpolated_value
    def convertToFixedPoint(self, value, frac_bits=16):
        integer_value = int(value)  # Convert hex to integer
        fractional_value = integer_value / (1 << frac_bits)
        return fractional_value
    def getinterpolation_r_phi(self, image, x, y, r, phi):
        lookup_table = {
            (45, 2): (0x0003E1D, 0x00057D8, 0x0002BEC, 0x0003E1D),
            (135, 2): (0x0002BEC, 0x0003E1D, 0x0003E1D, 0x00057D8),
            (225, 2): (0x0003E1D, 0x0002BEC, 0x00057D8, 0x0003E1D),
            (315, 2): (0x00057D8, 0x0003E1D, 0x0003E1D, 0x0002BEC),
            (45, 3): (0x0001B4A, 0x000C5A6, 0x00003C4, 0x0001B4A),
            (135, 3): (0x00003C4, 0x0001B4A, 0x0001B4A, 0x000C5A6),
            (225, 3): (0x0001B4A, 0x00003C4, 0x000C5A6, 0x0001B4A),
            (315, 3): (0x000C5A6, 0x0001B4A, 0x0001B4A, 0x00003C4),
            (45, 4): (0x002463, 0x000789, 0x00AFB0, 0x002463),
            (135, 4): (0x00AFB0, 0x002463, 0x002463, 0x000789),
            (225, 4): (0x002463, 0x00AFB0, 0x000789, 0x002463),
            (315, 4): (0x000789, 0x002463, 0x002463, 0x00AFB0),
            (45, 5): (0x0003FAD, 0x0003739, 0x000496B, 0x0003FAD),
            (135, 5): (0x000496B, 0x0003FAD, 0x0003FAD, 0x0003739),
            (225, 5): (0x0003FAD, 0x000496B, 0x0003739, 0x0003FAD),
            (315, 5): (0x0003739, 0x0003FAD, 0x0003FAD, 0x000496B),
            (45, 6): (0x0002F0B, 0x00092D6, 0x0000F12, 0x0002F0B),
            (135, 6): (0x0000F12, 0x0002F0B, 0x0002F0B, 0x00092D6),
            (225, 6): (0x0002F0B, 0x0000F12, 0x00092D6, 0x0002F0B),
            (315, 6): (0x00092D6, 0x0002F0B, 0x0002F0B, 0x0000F12),
            (45, 7): (0x0000C37, 0x00000A5, 0x000E6EA, 0x0000C37),
            (135, 7): (0x000E6EA, 0x0000C37, 0x0000C37, 0x00000A5),
            (225, 7): (0x0000C37, 0x000E6EA, 0x00000A5, 0x0000C37),
            (315, 7): (0x00000A5, 0x0000C37, 0x0000C37, 0x000E6EA),
            (45, 8): (0x00039B3, 0x0001E24, 0x0006E73, 0x00039B3),
            (135, 8): (0x0006E73, 0x00039B3, 0x00039B3, 0x0001E24),
            (225, 8): (0x00039B3, 0x0006E73, 0x0001E24, 0x00039B3),
            (315, 8): (0x0001E24, 0x00039B3, 0x00039B3, 0x0006E73),
        }
        r1 = lookup_table[(phi, r)][0]
        r2 = lookup_table[(phi, r)][1]
        r3 = lookup_table[(phi, r)][2]
        r4 = lookup_table[(phi, r)][3]
        x1 = int(np.floor(x))
        x2 = int(np.ceil(x))
        y1 = int(np.floor(y))
        y2 = int(np.ceil(y)) 
        r1_ = self.convertToFixedPoint(r1)
        r2_ = self.convertToFixedPoint(r2)
        r3_ = self.convertToFixedPoint(r3)
        r4_ = self.convertToFixedPoint(r4)
        # print(r1_, r2_, r3_, r4_)
        # print(r1)

        interpolated_value = (
            image[x1, y1] * r1_ +
            image[x1, y2] * r2_ +
            image[x2, y1] * r3_ +
            image[x2, y2] * r4_
        )
        

        # print(image[x1, y1], image[x1, y2], image[x2, y1], image[x2, y2])
        # print(r1_, r2_, r3_, r4_)
        return interpolated_value
        
    def jointHistogram(self, ci, ni, rd):
        # with open("joint_code_python.txt", 'w') as f:
        width, height = ci.shape
        out_matrix = np.zeros(200, dtype=np.uint32)
        for i in  range(0, width):
            for j in range(0, height):
                out_matrix[ci[i, j] * 100 + ni[i, j] * 10 + rd[i, j]] += 1
                    # f.write(f'{ci[i, j]} {ni[i, j]} {rd[i, j]}\n')
        return out_matrix


    def getNIDescriptor(self, NI, r, sum):
        ni_des = 0
        self.count = self.count + 1
        # if(self.count <100):
        #     print(sum)

        for index in range(1, 9):
            scale_value = NI[index] * ((2 * r + 1) ** 2)
            # if(self.count < 100):
            #     print(scale_value)
            
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
        # with open("rd_code.txt", 'w') as f:
        #     for i in range(RD.shape[0]):
        #         for j in range(RD.shape[1]):
        #             rd_bin = format(RD[i, j], '08b')  # 8-bit binary for RD
                    # f.write(f'{rd_bin}\n')
        NI_height, NI_width = NI.shape
        for i in range(0, NI_height):
            for j in range(0, NI_width):
                NI_transitions = self.checkU2(np.uint8(NI[i, j]))
                NI_des = 0
                if NI_transitions <= 2:
                    NI_des = self.getSumPixel(np.uint8(NI[i, j]))
                else:
                    NI_des = 9
                NI_out[i, j] = NI_des

                RD_transitions = self.checkU2(np.uint8(RD[i, j]))
                RD_des = 0
                if RD_transitions <= 2:
                    RD_des = self.getSumPixel(np.uint8(RD[i, j]))
                else:
                    RD_des = 9
                RD_out[i, j] = RD_des
   
        NI_histogram = np.histogram(NI_out,  10)[0].astype(dtype=np.int32)
        RD_histogram = np.histogram(RD_out, 10)[0].astype(dtype=np.int32)
        # NI_histogram = np.zeros(10, dtype = np.uint8)
        # RD_histogram = np.zeros(10, dtype = np.uint8)
        # for i in range(0, NI_height):
        #     for j in range(0, NI_width):
        #         NI_histogram[NI_out[i, j]] += 1
        #         RD_histogram[RD_out[i, j]] += 1
        # return NI_out, RD_out, NI_histogram, RD_histogram

        return NI_out, RD_out
    def MRELBP(self, image):
        start_time = time.time()
        m_3x3, m_5x5, m_7x7, m_9x9 = self.median_processing(image)
        with open('median_3x3.txt', 'w') as f:
            for i in range(m_3x3.shape[0]):
                for j in range(m_3x3.shape[1]):
                    f.write(str(m_3x3[i, j]))
                    f.write("\n")

        with open('median_5x5.txt', 'w') as f:
            for i in range(m_5x5.shape[0]):
                for j in range(m_5x5.shape[1]):
                    f.write(str(m_5x5[i, j]))
                    f.write("\n")
        with open('median_7x7.txt', 'w') as f:
            for i in range(m_7x7.shape[0]):
                for j in range(m_7x7.shape[1]):
                    f.write(str(m_7x7[i, j]))
                    f.write("\n")
                    
        # with open('median_3x3_view.txt', 'w') as f:
        #     for row in m_3x3:
        #         f.write(' '.join(map(str, row)) + '\n')

        #     f.write('\n') 

        # with open('output_5x5_test.txt', 'a') as f:
        #     for row in m_3x3:
        #         f.write(' '.join(map(str, row)) + '\n')

        #     f.write('\n')


        # with open('output_5x5_test.txt', 'a') as f:
        #     for row in m_5x5:
        #         f.write(' '.join(map(str, row)) + '\n')
        # r = 2
        ci_r2, ci_r2_count = self.mrelbp_ci(m_3x3, 2)
        print(ci_r2.shape)
        # print(ci_r2)
        ci_r4, ci_r4_count = self.mrelbp_ci(m_3x3, 4)
        print(ci_r4.shape)

        ci_r6, ci_r6_count = self.mrelbp_ci(m_3x3, 6)
        print(ci_r6.shape)

        # ci_r8, ci_r8_count = self.mrelbp_ci(m_3x3, 8)
        # with open('m_3x3_readable.txt', 'a') as f:
        #     for row in m_3x3:
        #         f.write(' '.join(map(str, row)) + '\n')

        write_to_filecheck("ci_r2.txt", ci_r2)
        write_to_filecheck("ci_r4.txt", ci_r4)
        write_to_filecheck("ci_r6.txt", ci_r6)



        NI_r2, RD_r2= self.NI_RD_descriptor(image, m_3x3, 2)
        NI_r4, RD_r4= self.NI_RD_descriptor(m_3x3, m_5x5, 4)
        NI_r6, RD_r6= self.NI_RD_descriptor(m_5x5, m_7x7, 6)
        # # NI_r8, RD_r8= self.NI_RD_descriptor(m_7x7, m_9x9, 8)

        write_to_filecheck("ni_r6.txt", NI_r6)
        write_to_filecheck("rd_r6.txt", RD_r6)

        write_to_filecheck("ni_r4.txt", NI_r4)
        write_to_filecheck("rd_r4.txt", RD_r4)


        write_to_filecheck("ni_r2.txt", NI_r2)
        write_to_filecheck("rd_r2.txt", RD_r2)


                    
        

        hist_r2 = self.jointHistogram(ci_r2, NI_r2, RD_r2)
        hist_r4 = self.jointHistogram(ci_r4, NI_r4, RD_r4)
        hist_r6 = self.jointHistogram(ci_r6, NI_r6, RD_r6)


        # with open("histogram_r2.txt", "w") as file:
        #     for value in hist_r2:
        #         file.write(f"{value}\n")

        # with open("histogram_r4.txt", "w") as file:
        #     for value in hist_r4:
        #         file.write(f"{value}\n")
        # with open("histogram_r6.txt", "w") as file:
        #     for value in hist_r6:
        #         file.write(f"{value}\n")

        with open("histogram_o.txt", "w") as file:
            for value in hist_r2:
                file.write(f"{value}\n")


        with open("histogram_o.txt", "a") as file:
            for value in hist_r4:
                file.write(f"{value}\n")

        with open("histogram_o.txt", "a") as file:
            for value in hist_r6:
                file.write(f"{value}\n")      
        # hist_r8 = self.jointHistogram(ci_r8, NI_r8, RD_r8)
        # with open("file_r2_cinird", 'w') as file:
        #     # Write ci_r2 to file
        #     file.write("ci_r2:\n")
        #     for row in ci_r2:
        #         file.write(' '.join(map(str, row)) + '\n')

        #     # Write ni_r2 to file
        #     file.write("\nni_r2:\n")
        #     for row in NI_r2:
        #         file.write(' '.join(map(str, row)) + '\n')

        #     # Write rd_r2 to file
        #     file.write("\nrd_r2:\n")
        #     for row in RD_r2:
        #         file.write(' '.join(map(str, row)) + '\n')

        # with open("tuple_ricind.txt", 'w') as file:
        #     # Write each index as a tuple (ci, ni, rd) to the file
        #     for i in range(len(ci_r2)):  # Assuming all matrices have the same shape
        #         for j in range(len(ci_r2[i])):
        #             # Create tuple (ci_r2[i][j], NI_r2[i][j], RD_r2[i][j])
        #             tuple_data = (int(ci_r2[i][j]), int(NI_r2[i][j]), int(RD_r2[i][j]))  # Ensure casting to int
        #             file.write(f"{tuple_data}\n")
        # with open("hist_r21.txt", "w") as file:
        #     for i in range(200):
        #             file.write(str(hist_r2[i]))
        #             file.write("\n")

            

      

        # hist_o = np.concatenate((hist_r2, hist_r4, hist_r6, hist_r8))
        # end_time = time.time()

        # # Calculate the total execution time
        # execution_time = end_time - start_time
        # print(f"Execution Time: {execution_time:.4f} seconds")

        # return hist_o


        # print(hist_r2)
        # print(NI_r2)

        # print(RD_r2)




    def getInterNeighbors(self, image, r, i, j):

        if r == 1:
            S =  np.zeros(9, dtype = np.uint8)
            S[1] = image[i, j + r]
            S[2] = image[i -r , j + r]
            S[3] = image[i -r, j]
            S[4] = image[i -r, j - r]
            S[5] = image[i, j -r ]
            S[6] = image[i + r, j - r]
            S[7] = image[i + r , j]
            S[8] = image[i + r, j + r]
            return S
        angles = [45, 135, 225, 315]
        results = {}
        S =  np.zeros(9)
        S[1] = image[i, j + r]
                # S2 -> 45
        S[3] = image[i - r, j]
        S[5] = image[i, j - r]
        S[7] = image[i + r, j]

        # print(S[1], S[3], S[5], S[7])
# 
        for angle in angles:
            theta = np.radians(angle)
            target_x = i - r * np.sin(theta)
            target_y = j + r * np.cos(theta)
            
            # print(target_x, target_y)
            results[f"{angle}"] = self.getinterpolation_r_phi(image, target_x, target_y, r, angle )
        # return
            # results[f"{angle}"] = self.getinterpolation(image, target_x, target_y, r )


        S[2] = results["45"]
        S[4] = results["135"]
        S[6] = results["225"]
        S[8] = results["315"]

        return S

    def getNI_RD(self, image_r1, image_r2, r2):
        height, width = image_r2.shape
        NI = np.zeros((height - 2 * r2, width - 2 * r2), dtype = np.uint8)
        RD = np.zeros((height - 2 * r2, width - 2 * r2), dtype = np.uint8)
        r1 = r2 - 1
        # print(r1, r2)

        # k = 0
        for i in range(r2,height - r2):
            for j in range(r2,width -r2):
                area = image_r2[i - r2  : i  + r2 + 1 , j  - r2 :j + r2 + 1]
                sum_r2_patch = np.sum(area)
                # print(area)
                # k += 1
                r1_descriptor = self.getInterNeighbors(image_r1, r1, i, j)
                r2_descriptor = self.getInterNeighbors(image_r2, r2, i, j)
                # # return
                # r1_descriptor_str = str(r1_descriptor)
                # with open("r1_inter", "a") as file:
                #     file.write(r1_descriptor_str + "\n")
                # r2_descriptor_str = str(r2_descriptor)
                # with open("r2_inter", "a") as file:
                #     file.write(r2_descriptor_str + "\n")
                #     file.write("\n")


                # with open("r1_inter", "a") as file:
                #     file.write(" ".join(f"0x{int(val):08X}" for val in r1_descriptor) + "\n")

                # with open("r2_inter", "a") as file:
                #     file.write(" ".join(f"0x{int(val):08X}" for val in r2_descriptor) + "\n\n")
               
                # for i in range(0, 9):
                #     print(r2_descriptor)
                # with open("sum_o.txt", "a") as file:
                #     file.write(str(sum_r2_patch))
                #     file.write('\n')
                NI[i - r2, j - r2] = self.getNIDescriptor(r2_descriptor, r2, sum_r2_patch)
                RD[i - r2, j - r2] = self.getRDDescriptor(r2_descriptor, r1_descriptor)

                # write_to_filecheck("ni_r2_val.txt", NI)
        return NI, RD



# Example Usage
np.random.seed(10)

size = 128

def resize_bmp(input_file, output_file, size=(128, 128)):
    # Mở ảnh BMP ở chế độ grayscale
    img = cv2.imread(input_file.rstrip(), cv2.IMREAD_GRAYSCALE)
    
    # Thay đổi kích thước ảnh về 128x128
    img_resized = cv2.resize(img, size, interpolation=cv2.INTER_LANCZOS4)
    # Ghi ảnh đã thay đổi kích thước ra file BMP khác
    cv2.imwrite(output_file, img_resized)
    print(f"Ảnh đã được lưu tại {output_file}")
resize_bmp('D:\\Thesis\\codetest\\python\\Train\\Dataset\\Outex-TC-00010\\images\\000005.bmp', 'D:\\Thesis\\data\\inputs\\test_input.bmp')
random_matrix = np.random.randint(0, 256, size=(size, size), dtype=np.uint8)
np.savetxt("D:\\Thesis\src\\test_benches\\test\\random_matrix.txt", random_matrix, fmt='%d')
c_array = ", ".join(map(str, random_matrix.flatten()))
c_code = f"unsigned char arr[] = {{ {c_array} }};"
with open("random_matrix.h", "w") as f:
    f.write("#ifndef RANDOM_MATRIX_H\n#define RANDOM_MATRIX_H\n\n")
    f.write(c_code + "\n\n")
    f.write("#endif // RANDOM_MATRIX_H\n")

print("File 'random_matrix.h' đã được tạo.")
image_file = "D://Thesis//data//inputs//test_input.bmp"
img = cv2.imread(image_file.rstrip(), cv2.IMREAD_GRAYSCALE)
file_path = "random_matrix.txt"
write_to_filecheck("D:\\Thesis\codetest\\python\\img.txt", img)

img_data = img.flatten()
# Chuyển thành định dạng mảng unsigned char trong C
output_path = "img_ddr.txt"
with open(output_path, "w") as f:
    f.write("unsigned char imageData[] = {\n    ")
    
    # Xuất từng giá trị, cách nhau bởi dấu phẩy
    for i, value in enumerate(img_data):
        f.write(f"{value}, ")
        if (i + 1) % 16 == 0:  # Xuống dòng sau mỗi 16 phần tử
            f.write("\n    ")

    f.write("\n};\n")
# print(len(img_data))
lbp = MRELBP()
# lbp.MRELBP(random_matrix)
np.savetxt(file_path, random_matrix, fmt='%d')





# test(random_matrix)
# # lbp.getNI_RD(random_matrix, median_matrix, 2)
# # lbp.NI_RD_descriptor(random_matrix, median_matrix, 2)

def compare_files(file1, file2):
    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        line_number = 1
        mismatch_found = False
        # Read each line from both files
        while True:
            line1 = f1.readline().strip()
            line2 = f2.readline().strip()


        

            # If both lines are empty, the files are identical up to this point
            if not line1 and not line2:
                break
            # sum_1 += int(line1)
            # sum_2 += int(line2)
            # If one of the files ends and the other doesn't, it's a mismatch
            if not line1 or not line2:
                print(f"Mismatch found at line {line_number}:")
                print(f"File 1: {line1}")
                print(f"File 2: {line2}")
                mismatch_found = True
                break

            # Convert the lines to integers and compare
            try:
                int_line1 = int(line1)
                int_line2 = int(line2)
            except ValueError:
                print(f"Invalid integer at line {line_number}:")
                print(f"File 1: {line1}")
                print(f"File 2: {line2}")
                mismatch_found = True
                break

            # If the integer values are different, report the mismatch
            if int_line1 != int_line2:
                print(f"Mismatch found at line {line_number}:")
                print(f"File 1: {int_line1}")
                print(f"File 2: {int_line2}")
                mismatch_found = True
                # diff += abs(int(line1) - int(line2))


            line_number += 1

        if not mismatch_found:
            print("The files are identical.")


# Example usage
# file1 = 'histogram_o.txt'
# file2 = 'histogram_verilog.txt'
# compare_files(file1, file2)
# file1 = 'histogram_o.txt'
# file2 = 'histogram_data.txt'
# compare_files(file1, file2)

# file1 = 'histogram_r6.txt'
# file2 = 'cinird_r6_verilog.txt'
# compare_files(file1, file2)






# file1 = 'histogram_layered_test.txt'
# file2 = 'histogram_o.txt'
# compare_files(file1, file2)

file1 = 'histogram_verilog.txt'
file2 = 'histogram_data.txt'
compare_files(file1, file2)

# file1 = 'rd_r4_hls.txt'
# file2 = 'rd_r4.txt'
# compare_files(file1, file2)

# file1 = 'm_3x3_hls.txt'
# file2 = 'median_3x3.txt'
# compare_files(file1, file2)

# file1 = 'm_5x5_hls.txt'
# file2 = 'median_5x5.txt'
# compare_files(file1, file2)

# file1 = 'm_7x7_hls.txt'
# file2 = 'median_7x7.txt'
# compare_files(file1, file2)

# file1 = 'ci_r2_hls.txt'
# file2 = 'ci_r2.txt'
# compare_files(file1, file2)


# file1 = 'ci_r4_hls.txt'
# file2 = 'ci_r4.txt'
# compare_files(file1, file2)


# file1 = 'ci_r6_hls.txt'
# file2 = 'ci_r6.txt'
# compare_files(file1, file2)


# file1 = 'rd_r2_hls.txt'
# file2 = 'rd_r2.txt'
# compare_files(file1, file2)


# file3 = 'ni_r2.txt'
# file4   = 'ni_r2_hls.txt'
# compare_files(file3, file4)
# file3 = 'ni_r4.txt'
# file4   = 'ni_r4_hls.txt'
# compare_files(file3, file4)
# file3 = 'rd_r4.txt'
# file4   = 'rd_r4_hls.txt'
# compare_files(file3, file4)


# file3 = 'ni_r6.txt'
# file4   = 'ni_r6_hls.txt'
# compare_files(file3, file4)
# file3 = 'rd_r6.txt'
# file4   = 'rd_r6_hls.txt'
# compare_files(file3, file4)
# file3 = 'ni_r6.txt'
# file4   = 'ni_r6_hls.txt'
# compare_files(file3, file4)

# file3 = 'rd_r6.txt'
# file4   = 'rd_r6_hls.txt'
# compare_files(file3, file4)
# file3 = 'ci_r8.txt'
# file4   = 'ni_r8.txt'
# compare_files(file3, file4)


# file3 = 'rd_r6.txt'
# file4   = 'rd_r6_verilog.txt'
# compare_files(file3, file4)


# file3 = 'median_3x3_verilog.txt'
# file4   = 'median_3x3.txt'
# compare_files(file3, file4)

# file3 = 'median_5x5_verilog.txt'
# file4   = 'median_5x5.txt'
# compare_files(file3, file4)

# file3 = 'median_7x7_verilog.txt'
# file4   = 'median_7x7.txt'
# compare_files(file3, file4)