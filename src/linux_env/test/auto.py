import numpy as np
import sys
import os
#sys.path.append(os.path.abspath("../"))

from MRELBP import MRELBP

lbp = MRELBP()
with open("generated_inps.txt", "r") as f:
    lines = f.readlines()
random_matrix = np.array([
    list(map(int, line.strip().split()))
    for line in lines
])
# print(random_matrix)
# print(random_matrix.shape)
# print("run run\n")

res = lbp.MRELBP(random_matrix)
    
with open("generated_oups_1.txt", "w") as f:
        for i in range(0, 600):
            f.write(str(res[i]) + "\n")

