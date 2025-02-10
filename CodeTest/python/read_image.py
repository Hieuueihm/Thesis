import cv2

# Đọc ảnh bằng OpenCV
image_file = "D://Thesis//Data//Ex//test_input.bmp"
img = cv2.imread(image_file.rstrip(), cv2.IMREAD_GRAYSCALE)

# Ghi ảnh ra file input_image_read_cv2.txt (mỗi pixel 1 dòng)
cv2_output_file = "D://Thesis//CodeTest//python//input_image_read_cv2.txt"
with open(cv2_output_file, "w") as f:
    for row in img:
        for pixel in row:
            f.write(f"{pixel}\n")

# So sánh với input_image_read.txt
verilog_output_file = "D://Thesis//CodeTest//python//input_image_read.txt"

with open(cv2_output_file, "r") as f1, open(verilog_output_file, "r") as f2:
    cv2_lines = f1.readlines()
    verilog_lines = f2.readlines()

# Kiểm tra số dòng có khớp không
if len(cv2_lines) != len(verilog_lines):
    print("Số dòng của hai tệp không khớp!")
    print(f"Số dòng OpenCV: {len(cv2_lines)}, Số dòng Verilog: {len(verilog_lines)}")
else:
    print("Số dòng khớp, tiến hành so sánh nội dung...")

# So sánh từng dòng
mismatch_count = 0
for i, (cv2_pixel, verilog_pixel) in enumerate(zip(cv2_lines, verilog_lines)):
    if cv2_pixel.strip() != verilog_pixel.strip():
        print(f"Lỗi tại dòng {i + 1}: OpenCV={cv2_pixel.strip()} Verilog={verilog_pixel.strip()}")
        mismatch_count += 1

if mismatch_count == 0:
    print("Hai file giống nhau hoàn toàn!")
else:
    print(f"Tổng số lỗi: {mismatch_count}")
