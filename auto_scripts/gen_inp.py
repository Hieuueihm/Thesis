import random
import numpy as np
from MRELBP import MRELBP
lbp = MRELBP()

def generate_input( size = 128, num = 1):
    np.random.seed(num)
    random_matrix = np.random.randint(0, 256, size=(size, size), dtype=np.uint8)
    return random_matrix


for i in range(1, 50):
    random_matrix = generate_input(128, i)
    res = lbp.MRELBP(random_matrix)

    # print(random_matrix)
    np.savetxt(f"D:\\Thesis\\auto_scripts\\inputs_coverage_test\\random_matrix_{i}.txt", random_matrix, fmt='%d')
    with open(f"D:\\Thesis\\auto_scripts\\inputs_coverage_test\\histogram_{i}.txt", "w") as f:
        for j in range(0, 600):
            f.write(str(res[j]) + "\n")
    