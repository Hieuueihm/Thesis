import numpy as np
import random
from MRELBP import MRELBP
import subprocess

lbp = MRELBP()
def compare_files(file1, file2):
    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        line_number = 1
        mismatch_found = False
        while True:
            line1 = f1.readline().strip()
            line2 = f2.readline().strip()

            if not line1 and not line2:
                break
            if not line1 or not line2:
                return False

            try:
                int_line1 = int(line1)
                int_line2 = int(line2)
            except ValueError:
                return False
            

            if int_line1 != int_line2:
                mismatch_found = True
                return False
    return True

def generate_input(file_name, size = 128, num = 1):
    np.random.seed(num)
    random_matrix = np.random.randint(0, 256, size=(size, size), dtype=np.uint8)
    return random_matrix


def run_vivado_script():
    vivado_path = r'C:\\Xilinx\\Vivado\\2018.2\bin\\vivado.bat'
    tcl_script_path = r'D:\\Thesis\\auto_scripts\\vi.tcl'
    # Lệnh gọi Vivado để chạy TCL script
    command = [vivado_path, '-mode', 'batch', '-source', tcl_script_path]

    result  = subprocess.run(command,  shell=True, capture_output=True, text=True) 


    return result.returncode


diff = 0
for i in range(1, 10):
    random_matrix = generate_input("random_matrix.txt", 128, i)
    # print(random_matrix)
    np.savetxt("D:\\Thesis\\auto_scripts\\random_matrix.txt", random_matrix, fmt='%d')

    res = lbp.MRELBP(random_matrix)
    print("handle mrelbp success")
    
    with open("D:\\Thesis\\auto_scripts\\histogram_o.txt", "w") as f:
        for i in range(0, 600):
            f.write(str(res[i]) + "\n")

    if(run_vivado_script()):
        if(compare_files("histogram_o.txt", "histogram_layered_test.txt") == False):
            diff += 1
            print("Difference found in test case", i)


print(diff)


