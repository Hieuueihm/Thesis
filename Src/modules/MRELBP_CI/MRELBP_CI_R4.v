module MRELBP_CI_R4 (
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
    output reg ci_o,
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

  reg [12:0] sum;
  reg [ 8:0] muy;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      ci_o   <= 8'b0;
      done_o <= 0;
    end else if (done_i) begin
      sum = S1 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9 +
            S10 + S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 +
            S20 + S21 + S22 + S23 + S24 + S25;

      muy = sum / 25;

      ci_o = sign_function(S13 - muy);

      // Set done_o
      done_o = 1;
    end else begin
      done_o <= 0;
    end
  end

endmodule
