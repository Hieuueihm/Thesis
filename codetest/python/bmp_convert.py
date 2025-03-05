def read_hex_file(filename):
    with open(filename, "r") as file:
        hex_values = file.read().splitlines()  # Đọc từng dòng và lưu vào danh sách
    return [int(x, 16) for x in hex_values]  # Chuyển đổi từ hex sang số nguyên


def convert_to_c_array(data):
    c_array = "unsigned char imageData[] = {\n    "
    c_array += ", ".join(map(str, data))  # Chuyển danh sách thành chuỗi số nguyên
    c_array += "\n};"
    return c_array


# Đọc file hex và chuyển thành mảng C
hex_file = "inputbmp.txt"  # Thay bằng tên file chứa dữ liệu hex
image_data = read_hex_file(hex_file)
c_array_string = convert_to_c_array(image_data)

# Ghi kết quả vào file output
with open("outputbmp.c", "w") as output_file:
    output_file.write(c_array_string)

print("Conversion complete! Check 'output.c' for the result.")
