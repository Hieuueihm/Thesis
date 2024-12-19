module bilinear_interpolation (
    input clk,
    input rst,
    input [1:0] r,
    input [7:0] A,
    B,
    C,
    D,
    output [7:0] I,
    output z
);
  reg [31:0] lut[0:3];  // Each LUT entry contains dx (16 bits) and dy (16 bits)

  wire [15:0] dx = lut[r][31:16];
  wire [15:0] dy = lut[r][15:0];

  reg [31:0] mult_result1, mult_result2;  // Temporary registers for intermediate results
  reg [15:0] one_minus_dx, one_minus_dy;  // (1 - dx) and (1 - dy) in fixed-point
  reg [15:0] product;  // Product of (1 - dx)(1 - dy)
  reg [15:0] final_result;  // Final multiplication result

  initial begin
    lut[0] = 32'h0096006A;  // dx = 0.5858, dy = 0.4142
    lut[1] = 32'h41420000;  // Example: dx = 0.2588, dy = 0.7584
    lut[2] = 32'h52550000;  // Additional values for different r values
    lut[3] = 32'h30330000;  // Placeholder for customization
  end

  // Main interpolation logic
  always @(posedge clk) begin
    if (rst) begin
      one_minus_dx <= 16'h0;
      one_minus_dy <= 16'h0;
      mult_result1 <= 32'h0;
      mult_result2 <= 32'h0;
      final_result <= 32'h0;
    end else begin
      // Calculate (1 - dx) and (1 - dy)
      one_minus_dx <= 16'h0100 - dx;  // 1.0 - dx
      one_minus_dy <= 16'h0100 - dy;  // 1.0 - dy

      // Multiply (1 - dx) * (1 - dy)
      mult_result1 <= one_minus_dx * one_minus_dy;  // 32-bit result
      product <= mult_result1[23:8];  // Scale down to 8.8 fixed-point

      // Multiply the result with A
      mult_result2 <= product * {A, 8'b0};  // Scale A to 8.8 fixed-point
      final_result <= mult_result2[23:8];  // Scale down to 8.8 fixed-point

      // Assign final output
    end
  end
  assign I = final_result;
endmodule
