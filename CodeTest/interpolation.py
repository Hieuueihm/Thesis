import numpy as np

def bilinear_interpolate(image, x, y):
    """
    Perform bilinear interpolation for a given point (x, y) on a 2D grid.
    :param image: 2D numpy array representing the grid
    :param x: x-coordinate of the interpolation point
    :param y: y-coordinate of the interpolation point
    :return: Interpolated value at (x, y)
    """
    x1 = int(np.floor(x))
    x2 = int(np.ceil(x))
    y1 = int(np.floor(y))
    y2 = int(np.ceil(y))
    print(x)
    print(x1, x2, y1, y2)
    print(x1, y1)
    print(x1, y2)
    print(x2, y1)
    print(x2, y2)
    # print(x2 - x)
    # print(x - x1)
    # print(y2 - y)
    # print(y - y1)


    a = x - x1
    b = y - y1

    print(a, b)
    print(1 - a, 1 - b)
    print(( 1- a ) *(1 - b) * image[x1, y1])
    print(image[x1, y2] * a * (1 - b))
    print(image[x2, y1] * (1 - a) * b )
    print( image[x2, y2] * a * b)

    # # Interpolation
    interpolated_value = (
        image[x1, y1] * (1 - a) * (1 - b) +
        image[x1, y2] * a * (1 - b) +
        image[x2, y1] * (1 - a) * b +
        image[x2, y2] * a * b
    )
    print(image[x1, y1], image[x1, y2], image[x2, y1], image[x2, y2])
    return interpolated_value


def interpolate_45_135_225_315(image, center_x, center_y, radius):
    """
    Interpolates values at 45°, 135°, 225°, and 315° around the given center.
    :param image: 2D numpy array representing the grid
    :param center_x: x-coordinate of the center
    :param center_y: y-coordinate of the center
    :param radius: Distance from the center to the points
    :return: Dictionary with interpolated values at 45°, 135°, 225°, and 315°
    """
    angles = [45, 135, 225, 315]
    results = {}
    print(image[center_x][center_y])

    for angle in angles:
        # Convert angle to radians
        theta = np.radians(angle)
        # Calculate target coordinates
        target_x = center_x - radius * np.sin(theta)
        target_y = center_y + radius * np.cos(theta)
        print(target_x, target_y)
        # Perform bilinear interpolation
        results[f"{angle}°"] = bilinear_interpolate(image, target_x, target_y)


    return results


# Example usage
# image = np.array(
# [[  1 ,  2 ,  3 ,  4 ,  5 ,  6 ,  7,   8 ,  9,  10,  11,  12,  13],
#  [ 14 , 15 , 16 , 17 , 18 , 19 , 20,  21 , 22,  23,  24,  25,  26],
#  [ 27 , 28 , 29 , 30 , 31 , 32 , 33,  34 , 35,  36,  37,  38,  39],
#  [ 40 , 41 , 42 , 43 , 44 , 45 , 46,  47 , 48,  49,  50,  51,  52],
#  [ 53 , 54 , 55 , 56 , 57 , 58 , 59,  60 , 61,  62,  63,  64,  65],
#  [ 66 , 67 , 68 , 69 , 70 , 71 , 72,  73 , 74,  75,  76,  77,  78],
#  [ 79 , 80 , 81 , 82 , 83 , 84 , 85,  86 , 87,  88,  89,  90,  91],
#  [ 92 , 93 , 94 , 95 , 96 , 97 , 98,  99 ,100, 101, 102, 103, 104],
#  [105 ,106 ,107 ,108 ,109 ,110 ,111, 112 ,113, 114, 115, 116, 117],
#  [118 ,119 ,120 ,121 ,122 ,123 ,124, 125 ,126, 127, 128, 129, 130],
#  [131 ,132 ,133 ,134 ,135 ,136 ,137, 138 ,139, 140, 141, 142, 143],
#  [144 ,145 ,146 ,147 ,148 ,149 ,150, 151 ,152, 153, 154, 155, 156],
#  [157 ,158 ,159 ,160 ,161 ,162 ,163, 164 ,165, 166, 167, 168, 169]]
# , dtype=float)

image = np.random.randint(0, 101, (19, 19))

radius = 7  # Distance from center to the interpolated points

interpolated_values = interpolate_45_135_225_315(image, 7, 7, radius)
print("Interpolated Values:")
for angle, value in interpolated_values.items():
    print(f"{angle}: {value:.2f}")
