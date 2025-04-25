import subprocess



def run_vivado_script():
    vivado_path = r'D:\\Xilinx2023\\Vivado\\2023.2\bin\\vivado.bat'
    tcl_script_path = r'D:\\Thesis\\auto_scripts\\fc\\vi.tcl'
    # Lệnh gọi Vivado để chạy TCL script
    command = [vivado_path, '-mode', 'batch', '-source', tcl_script_path]

    result  = subprocess.run(command,  shell=True, capture_output=True, text=True) 


    return result.returncode


run_vivado_script()

