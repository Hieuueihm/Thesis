def sort3(a, b, c):
    if a > b: a, b = b, a
    if b > c: b, c = c, b
    if a > b: a, b = b, a
    return a, b, c

def sort4(a, b, c, d):
    a, b, c = sort3(a, b, c)
    a, b, d = sort3(a, b, d)
    b, c, d = sort3(b, c, d)
    return a, b, c, d

def sort5(a, b, c, d, e):
    a, b, c = sort3(a, b, c)
    a, b, d = sort3(a, b, d)
    a, b, e = sort3(a, b, e)
    b, c, e = sort3(b, c, e)
    b, d, e = sort3(b, d, e)
    return a, b, c, d, e

def sort7(a, b, c, d, e, f, g):
    a, b, c, d, e = sort5(a, b, c, d, e)
    print("step 1:", a, b, c, d, e, f, g)

    c, d, e, f, g = sort5(c, d, e, f, g)
    print("step 2:", a, b, c, d, e, f, g)

    a, b, c, d = sort4(a, b, c, d)
    print("step 3:", a, b, c, d, e, f, g)

    # a, b, c, d, e, f, g = sort5(a, b, c, d, e)
    # print("step 4:", a, b, c, d, e, f, g)


# Example usage
sorted_values = sort7(7, 2, 3, 4, 5, 5, 1)

sorted_values = sort7(4, 1, 2, 2, 6, 5, 1)
# print(sorted_values)  

sorted_values = sort7(1, 9, 2, 3, 7, 10, 8)
# print(sorted_values)  

# a b c d e f g
# sort a b c d e
# sort c d e f g
# sort 4 a b c d 

# 7 2 5 3 6 4 1 
# # sort 5 first
# 2 3 5 6 7 4 1
# # sort 5 last
# 2 3 1 4 5 6 7
# # sort 4 first
# 1 2 3 4 5 6 7