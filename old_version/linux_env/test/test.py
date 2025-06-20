import mrelbp
import numpy as np
import cv2
np.random.seed(10)
import time

with open("generated_inps.txt", "r") as f:
    lines = f.readlines()

random_matrix = np.array([
    list(map(int, line.strip().split()))
    for line in lines
])
res = mrelbp.run(random_matrix)
#print(res)
#print("calc done\n");
with open("generated_oups.txt", "w") as f:
        for i in range(0, 600):
            f.write(str(res[i]) + "\n")

#print("write done\n");
