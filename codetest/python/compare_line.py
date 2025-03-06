def compare_file_lines(filename, start1, start2, num_lines):
    with open(filename, 'r', encoding='utf-8') as file:
        lines = file.readlines()

    # Lấy số dòng thực tế trong file
    max_lines = len(lines)

    # So sánh từng dòng, dừng khi hết dòng ở ít nhất một trong hai đoạn
    for i in range(num_lines):
        index1 = start1 - 1 + i
        index2 = start2 - 1 + i

        # Lấy nội dung của dòng hoặc đặt giá trị rỗng nếu vượt quá giới hạn file
        line1 = lines[index1].strip() if index1 < max_lines else ""
        line2 = lines[index2].strip() if index2 < max_lines else ""

        # Nếu hai dòng khác nhau, in vị trí
        if line1 != line2:
            print(f"Khác nhau tại dòng {index1 + 1} và {index2 + 1}")

# Ví dụ sử dụng
filename = "histogram_verilog.txt"
compare_file_lines(filename, 1, 601, 600)
