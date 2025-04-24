import mrelbp
import numpy as np
import cv2
np.random.seed(10)
import time

# Tạo ma trận ngẫu nhiên 128x128 kiểu uint8
random_matrix = np.random.randint(0, 256, (128, 128), dtype=np.uint8)
start = time.time()

res = mrelbp.run(random_matrix)
end = time.time()
print(f"Time taken: {end - start:.6f} seconds")
with open("../histogram_cpp_py.txt", "w") as f:
    for i in range(0, 600):
        f.write(str(res[i]) + "\n")
