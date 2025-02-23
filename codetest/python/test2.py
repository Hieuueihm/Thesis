def compare_files(file1, file2):
    # Open both files for reading
    with open(file1, 'r') as f1, open(file2, 'r') as f2:
        # Read lines from both files
        lines1 = f1.readlines()
        lines2 = f2.readlines()
        
        # Check if the files have the same number of lines
        if len(lines1) != len(lines2):
            print("The files have different number of lines.")
            return
        
        # Compare line by line
        for i in range(len(lines1)):
            if lines1[i].strip() != lines2[i].strip():  # Compare after stripping extra spaces or newline characters
                print(f"Difference found on line {i+1}:")
                print(f"File 1: {lines1[i].strip()}")
                print(f"File 2: {lines2[i].strip()}")
                print("---")

# Specify the file paths
file1 = 'rd_data.txt'
file2 = 'rd_code.txt'

# Call the compare function
compare_files(file1, file2)
