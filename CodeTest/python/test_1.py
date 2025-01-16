# Function to extract the values from a line and convert them to a tuple of integers
def extract_values(line):
    # Remove parentheses and split by commas, then convert to integers
    return tuple(map(int, line.strip('()').split(',')))
count199 = 0
# Open the two files for reading
with open("ci_ni_rd_data.txt", "r") as file1, open("tuple_ricind.txt", "r") as file2:
    line_number = 1
    while True:
        # Read and process each line from both files
        line1 = file1.readline().strip()
        line2 = file2.readline().strip()

        # If we reach the end of both files, break out of the loop
        if not line1 and not line2:
            print("Both files are identical.")
            break
        
        # Extract the numerical values as tuples
        tuple1 = extract_values(line1)
        tuple2 = extract_values(line2)
        value1 = tuple1[0] * 100 + tuple1[1] * 10 + tuple1[2]
        value2 = tuple2[0] * 100 + tuple2[1] * 10 + tuple2[2]
        # Compare the tuples
        if tuple1 != tuple2:
            print(f"Files differ at line {line_number}:")
            print(f"File 1: {tuple1}")
            print(f"File 2: {tuple2}")

        if value2 == 193:
            count199 += 1

        line_number += 1

print(count199)
