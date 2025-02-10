import cv2
import numpy as np

def read_bmp(image_file):
    img = cv2.imread(image_file.rstrip(), cv2.IMREAD_GRAYSCALE)
    
    if img is None:
        print("Không thể đọc ảnh.")
        return None, None, None, None, None
    
    height, width = img.shape
    
    with open(image_file, "rb") as f:
        bmp_data = bytearray(f.read())
    
    bmp_size = len(bmp_data)
    bmp_start_pos = int.from_bytes(bmp_data[10:14], "little")
    biBitCount = int.from_bytes(bmp_data[28:30], "little")
    
    print(f"BMP size: {bmp_size}")
    print(f"BMP Width: {width}, Height: {height}")
    print(f"biBitCount: {biBitCount}")
    print("Read BMP done!")
    
    return img, bmp_size, bmp_start_pos, width, height

def resize_bmp(input_file, output_file, size=(128, 128)):
    # Mở ảnh BMP ở chế độ grayscale
    img = cv2.imread(input_file.rstrip(), cv2.IMREAD_GRAYSCALE)
    
    # Thay đổi kích thước ảnh về 128x128
    img_resized = cv2.resize(img, size, interpolation=cv2.INTER_LANCZOS4)
    # Ghi ảnh đã thay đổi kích thước ra file BMP khác
    cv2.imwrite(output_file, img_resized)
    print(f"Ảnh đã được lưu tại {output_file}")

def process_bmp_data(image_file):
    img, bmp_size, bmp_start_pos, width, height = read_bmp(image_file)
    if img is None:
        return []
    
    grayscale_values = img.flatten().tolist()
    return grayscale_values

# Thay thế 'input.bmp' và 'output.bmp' bằng đường dẫn thực tế của bạn
resize_bmp('D:\\Thesis\\CodeTest\\python\\Train\\Dataset\\Outex-TC-00010\\images\\000000.bmp', 'D:\\Thesis\\Data\\Ex\\test_input.bmp')
grayscale_values = process_bmp_data('D:\\Thesis\\Data\\Ex\\test_input.bmp')
print(grayscale_values)
print(len(grayscale_values))
