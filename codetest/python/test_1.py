# import cv2

# # Đọc ảnh BMP gốc
# image = cv2.imread("lena_gray.bmp", cv2.IMREAD_UNCHANGED)

# # Resize ảnh xuống 128x128
# resized_image = cv2.resize(image, (128, 128), interpolation=cv2.INTER_AREA)

# # Lưu ảnh sau khi resize
# cv2.imwrite("output.bmp", resized_image)
# #
# print("Resize hoàn tất, ảnh đã được lưu dưới tên 'output.bmp'")

# with open("lena_gray.bmp", "rb") as f:
#     f.seek(10)  # Offset 10 chứa thông tin về vị trí dữ liệu pixel
#     data_offset = int.from_bytes(f.read(4), byteorder="little")

# print(f"Độ dài header của lena_gray.bmp là {data_offset} bytes")

with open("output.bmp", "rb") as f:
    data = f.read()

# Tạo file C với dữ liệu dạng decimal
c_output = "unsigned char imageData[] = {\n"
c_output += ", ".join(str(byte) for byte in data)  # Xuất số ở dạng thập phân
c_output += "\n};"

with open("image_data.c", "w") as f:
    f.write(c_output)

# Tạo file HEX
hex_output = "\n".join(f"{byte:02X}" for byte in data)  # Dạng HEX, mỗi byte một dòng

with open("image_data.hex", "w") as f:
    f.write(hex_output)

print("Tệp image_data.c và image_data.hex đã được tạo thành công!")
