def generate_template_logic(input_size, window_size, var_prefix="vif.d", suffix="_o"):
    pad = window_size // 2
    output_size = input_size  # giữ nguyên size sau padding
    template_id = 0
    template_list = []
    unique_templates = {}
    
    for i in range(output_size):
        for j in range(output_size):
            logic_lines = []
            pattern_signature = []  # lưu thông tin kiểu padding/valid tại mỗi pixel

            for di in range(-pad, pad + 1):
                for dj in range(-pad, pad + 1):
                    ni = i + di
                    nj = j + dj
                    index = (di + pad) * window_size + (dj + pad)
                    var_name = f"{var_prefix}{index}{suffix}"
                    if ni < 0 or ni >= input_size or nj < 0 or nj >= input_size:
                        logic_lines.append(f"{var_name} == 0")
                        pattern_signature.append('0')  # zero padding
                    else:
                        logic_lines.append(f"{var_name} inside {{[0:255]}}")
                        pattern_signature.append('x')  # valid pixel

            # Convert pattern_signature to string for uniqueness
            pattern_str = ''.join(pattern_signature)

            if pattern_str not in unique_templates:
                # First time this pattern appears
                unique_templates[pattern_str] = template_id

                template_code = f"// Template {template_id} - Center ({i},{j})\n"
                template_code += "if (\n    " + " &&\n    ".join(logic_lines) + f"\n) return {template_id};\n"
                template_list.append(template_code)

                template_id += 1

    # Print out the final function
    with open("template_logic.sv", "w") as f:
        f.write("function int get_template_id();\n")
        for template in template_list:
            f.write(template)
        f.write("else return -1;\nendfunction")
    # print("function int get_template_id();")
    # for template in template_list:
    #     print(template)
    # print("else return -1;\nendfunction")

generate_template_logic(input_size=7, window_size=5)



# # sort from 0 zero count max -> zero count min
# def generate_template_logic(input_size, window_size, var_prefix="vif.d", suffix="_o"):
#     pad = window_size // 2
#     output_size = input_size
#     template_id = 0
#     templates = []
#     unique_patterns = {}

#     for i in range(output_size):
#         for j in range(output_size):
#             logic_lines = []
#             pattern_signature = []
#             zero_count = 0

#             for di in range(-pad, pad + 1):
#                 for dj in range(-pad, pad + 1):
#                     ni = i + di
#                     nj = j + dj
#                     index = (di + pad) * window_size + (dj + pad)
#                     var_name = f"{var_prefix}{index}{suffix}"
#                     if ni < 0 or ni >= input_size or nj < 0 or nj >= input_size:
#                         logic_lines.append(f"{var_name} == 0")
#                         pattern_signature.append('0')
#                         zero_count += 1
#                     else:
#                         logic_lines.append(f"{var_name} inside {{[0:255]}}")
#                         pattern_signature.append('x')

#             pattern_str = ''.join(pattern_signature)

#             if pattern_str not in unique_patterns:
#                 unique_patterns[pattern_str] = template_id
#                 templates.append({
#                     "id": template_id,
#                     "i": i,
#                     "j": j,
#                     "zero_count": zero_count,
#                     "logic": logic_lines
#                 })
#                 template_id += 1

#     # Sort templates by number of '== 0' descending (for readability), keep ID fixed
#     templates.sort(key=lambda x: -x["zero_count"])

#     # Print function
#     # print("function int get_template_id();")
#     # for tmpl in templates:
#     #     print(f"  // Template {tmpl['id']} - Center ({tmpl['i']},{tmpl['j']})")
#     #     print("  if (")
#     #     print("      " + " &&\n      ".join(tmpl["logic"]))
#     #     print(f"  ) return {tmpl['id']};\n")
#     # print("  else return -1;\nendfunction")
#     with open("template_logic.sv", "w") as f:
#         f.write("function int get_template_id();\n")
#         for tmpl in templates:
#             f.write(f"  // Template {tmpl['id']} - Center ({tmpl['i']},{tmpl['j']})\n")
#             f.write("  if (\n")
#             f.write("      " + " &&\n      ".join(tmpl["logic"]))
#             f.write(f"\n  ) return {tmpl['id']};\n\n")
#         f.write("  else return -1;\nendfunction")

# # Example usage:
# generate_template_logic(input_size=7, window_size=5)

