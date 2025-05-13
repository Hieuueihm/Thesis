import numpy as np
import sys
import os
import cv2
sys.path.append(os.path.abspath("../"))

from MRELBP import MRELBP

lbp = MRELBP()
# with open("D:\\Thesis\\auto_scripts\\fc\\generated_inps.txt", "r") as f:
#     lines = f.readlines()
# random_matrix = np.array([
#     list(map(int, line.strip().split()))
#     for line in lines
# ])
# print(random_matrix)
# print(random_matrix.shape)
# print("run run\n")
image_file = "D://Thesis//data//inputs//000000.bmp"

img = cv2.imread(image_file.rstrip(), cv2.IMREAD_GRAYSCALE)

res = lbp.MRELBP(img)
    
with open("histogram_py.txt", "w") as f:
        for i in range(0, 600):
            f.write(str(res[i]) + "\n")

