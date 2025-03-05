import cv2
import numpy as np
def compare_bmp_bytes(file1, file2):
    with open(file1, 'rb') as f1, open(file2, 'rb') as f2:
        data1 = f1.read()
        data2 = f2.read()
    
    if len(data1) != len(data2):
        print("Files have different sizes and cannot be compared.")
        return
    
    # Compare byte by byte
    differing_positions = [(i, b1, b2) for i, (b1, b2) in enumerate(zip(data1, data2)) if b1 != b2]
    differences = len(differing_positions)
    similarity = (1 - differences / len(data1)) * 100
    
    print(f"Total differing bytes: {differences}")
    print(f"Byte Similarity: {similarity:.2f}%")
    
    if differences > 0:
        print("Differing byte positions (index, file1 byte, file2 byte):")
        for pos, b1, b2 in differing_positions[:10]:  # Show only first 10 differences
            print(f"Position {pos}: {b1} -> {b2}")

# Example usage
# Example usage
compare_bmp_bytes("D://XilinxSDKP//image_test//teraterm.bmp", "D://XilinxSDKP//image_test//teraterm7.bmp")
