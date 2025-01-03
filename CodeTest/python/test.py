lut = [
    [(0x006A, 0x0096, 0x0096, 0x006A), (0x006A, 0x006A, 0x0096, 0x0096), (0x0096, 0x006A, 0x006A, 0x0096), (0x0096, 0x0096, 0x006A, 0x006A)],
    [(0x001F, 0x00E1, 0x00E1, 0x001F), (0x001F, 0x001F, 0x00E1, 0x00E1), (0x00E1, 0x001F, 0x001F, 0x00E1), (0x00E1, 0x00E1, 0x001F, 0x001F)],
    [(0x00D4, 0x002C, 0x002C, 0x00D4), (0x00D4, 0x00D4, 0x002C, 0x002C), (0x002C, 0x00D4, 0x00D4, 0x002C), (0x002C, 0x002C, 0x00D4, 0x00D4)],
    [(0x0089, 0x0077, 0x0077, 0x0089), (0x0089, 0x0089, 0x0077, 0x0077), (0x0077, 0x0089, 0x0089, 0x0077), (0x0077, 0x0077, 0x0089, 0x0089)],
    [(0x003E, 0x00C2, 0x00C2, 0x003E), (0x003E, 0x003E, 0x00C2, 0x00C2), (0x00C2, 0x003E, 0x003E, 0x00C2), (0x00C2, 0x00C2, 0x003E, 0x003E)],
    [(0x00F4, 0x000C, 0x000C, 0x00F4), (0x00F4, 0x00F4, 0x000C, 0x000C), (0x000C, 0x00F4, 0x00F4, 0x000C), (0x000C, 0x000C, 0x00F4, 0x00F4)],
    [(0x00A8, 0x0058, 0x0058, 0x00A8), (0x00A8, 0x00A8, 0x0058, 0x0058), (0x0058, 0x00A8, 0x00A8, 0x0058), (0x0058, 0x0058, 0x00A8, 0x00A8)]
]

# Hàm tính các sản phẩm (A * B), (A * C), (A * D), (C * D) cho mỗi cặp trong lut[x][y]
def calculate_products(lut):
    results = []
    
    for x in range(len(lut)):
        for y in range(len(lut[x])):
            A, B, C, D = lut[x][y]
            
            product_ab = A * B
            product_bc = B * C
            product_ad = A * D
            product_cd = C * D
            
            results.append({
                'lut_index': (x, y),
                '1-dx': A,
                '1-dy': B,
                'dx': C,
                'dy': D,
                '1-dx*1-dy': product_ab,
                '1-dy*x': product_bc,
                '1-dx*y': product_ad,
                'x*y': product_cd
            })
    
    return results

# Tính toán các sản phẩm
products = calculate_products(lut)
def to_32bit_hex(value):
    return f"0x{value & 0xFFFFFFFF:08X}"

# In kết quả dưới dạng 32-bit
for product in products:
    print(f"lut[{product['lut_index'][0]}][{product['lut_index'][1]}]:")
    print(f"1-dx = {to_32bit_hex(product['1-dx'])}, 1-dy = {to_32bit_hex(product['1-dy'])}, dx = {to_32bit_hex(product['dx'])}, dy = {to_32bit_hex(product['dy'])}")
    print(f"1-dx*1-dy = {to_32bit_hex(product['1-dx*1-dy'])}, 1-dy*x= {to_32bit_hex(product['1-dy*x'])}, 1-dx*y = {to_32bit_hex(product['1-dx*y'])}, x*y = {to_32bit_hex(product['x*y'])}")
    print()

