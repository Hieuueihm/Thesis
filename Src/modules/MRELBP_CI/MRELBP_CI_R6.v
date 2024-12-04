module MRELBP_CI_R6 (
    input clk,
    input rst,
    input done_i,
    input [7:0] S1,
    input [7:0] S2,
    input [7:0] S3,
    input [7:0] S4,
    input [7:0] S5,
    input [7:0] S6,
    input [7:0] S7,
    input [7:0] S8,
    input [7:0] S9,
    input [7:0] S10,
    input [7:0] S11,
    input [7:0] S12,
    input [7:0] S13,
    input [7:0] S14,
    input [7:0] S15,
    input [7:0] S16,
    input [7:0] S17,
    input [7:0] S18,
    input [7:0] S19,
    input [7:0] S20,
    input [7:0] S21,
    input [7:0] S22,
    input [7:0] S23,
    input [7:0] S24,
    input [7:0] S25,
    input [7:0] S26,
    input [7:0] S27,
    input [7:0] S28,
    input [7:0] S29,
    input [7:0] S30,
    input [7:0] S31,
    input [7:0] S32,
    input [7:0] S33,
    input [7:0] S34,
    input [7:0] S35,
    input [7:0] S36,
    input [7:0] S37,
    input [7:0] S38,
    input [7:0] S39,
    input [7:0] S40,
    input [7:0] S41,
    input [7:0] S42,
    input [7:0] S43,
    input [7:0] S44,
    input [7:0] S45,
    input [7:0] S46,
    input [7:0] S47,
    input [7:0] S48,
    input [7:0] S49,
    output [7:0] ci_o,
    output reg done_o
);

  function [0:0] sign_function(input signed [8:0] input_value);
    begin
      if (input_value >= 0) begin
        sign_function = 1'b1;
      end else begin
        sign_function = 1'b0;
      end
    end
  endfunction

  reg [13:0] sum;  // 49 * 255 = 12495, so 14 bits are required
  reg [ 8:0] muy;  // Intermediate average value

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      ci_o   <= 8'b0;
      done_o <= 0;
    end else if (done_i) begin
      // Calculate the sum of all 49 inputs
      sum = S1 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9 +
            S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 +
            S20 + S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 +
            S30 + S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 +
            S40 + S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49;

      // Compute muy as the average (sum / 49)
      muy = sum / 49;

      // Calculate ci_o using the sign function
      ci_o = sign_function(S25 - muy);  // Assuming S25 is the central pixel

      // Set done_o
      done_o = 1;
    end else begin
      done_o <= 0;
    end
  end

endmodule
