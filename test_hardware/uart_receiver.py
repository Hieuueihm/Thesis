import serial
import struct
import keyboard 
# Configure the serial port
SERIAL_PORT = "COM10"  # Change this to match your system (e.g., "COM3" for Windows)
BAUD_RATE = 115200  # Match this with your Zynq UART configuration
NUM_VALUES = 600  # Number of 32-bit integers expected in histogram
OUTPUT_FILE = "histogram_data.txt"  # Output file to store the received data

# Open the serial port
ser = serial.Serial(SERIAL_PORT, BAUD_RATE, timeout=100)

def receive_histogram():
    histogram = []

    with open(OUTPUT_FILE, "w") as f:  # Open file in write mode
        for _ in range(NUM_VALUES):
            # Read 4 bytes (since each histogram value is 32-bit = 4 bytes)
            data = ser.read(4)
            if keyboard.is_pressed('q'):
                print("Quitting early...")
                break
            print(data)
            if len(data) == 4:  # Ensure we received all 4 bytes
                print(data)
                value = struct.unpack('<I', data)[0]  # '<I' for little-endian 32-bit unsigned int
                histogram.append(value)
                f.write(f"{value}\n")  # Write each value to the file with a newline
            else:
                print("Error: Incomplete data received!")
                break

    return histogram

if __name__ == "__main__":
    print("Waiting for data...")
    histogram = receive_histogram()

    print("Received Histogram Data:")
    print(histogram)

    # Close the serial port
    ser.close()

    print(f"Data saved to {OUTPUT_FILE}")



