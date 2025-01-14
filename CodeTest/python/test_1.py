import numpy as np
import matplotlib.pyplot as plt

# Generate random data for illustration
x = np.random.randint(0, 1000, 2)  # 2 random values between 0 and 1000 for x-axis
y = np.random.randint(0, 1000, 10)  # 10 random values between 0 and 1000 for y-axis

# Repeat values in x to match the length of y
x_repeated = np.tile(x, len(y)//len(x))  # Repeat x values to match length of y

# Create the 2D histogram
hist, xedges, yedges = np.histogram2d(x_repeated, y, bins=30, range=[[0, 1000], [0, 1000]])
print(hist)
# Plot the 2D histogram
plt.figure(figsize=(8, 6))
plt.imshow(hist.T, origin='lower', cmap='Blues', aspect='auto', interpolation='nearest')
plt.colorbar(label='Frequency')
plt.xlabel('X values')
plt.ylabel('Y values')
plt.title('2D Histogram')
plt.show()
