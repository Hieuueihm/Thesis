module MRELBP_CI_R2 (
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
    output reg ci_o,  // 0 or 1
    output reg done_o
);

  reg [12:0] sum;
  reg [ 7:0] muy;
  reg [ 7:0] r;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      sum <= 0;
      muy <= 0;
      ci_o <= 0;
      done_o <= 0;
    end else if (done_i) begin
      sum = S1 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9 + S10 +
                   S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 +
                   S20 + S21 + S22 + S23 + S24 + S25;

      muy = sum / 25;

      r = sum % 25;

      // a >= b -> ci_o = 1
      if ((S13 > muy) || (S13 == muy && r == 0)) ci_o = 1;
      else ci_o = 0;
      done_o = 1;
    end else begin
      done_o = 0;
    end
  end

endmodule
