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
    input [7:0] S50,
    input [7:0] S51,
    input [7:0] S52,
    input [7:0] S53,
    input [7:0] S54,
    input [7:0] S55,
    input [7:0] S56,
    input [7:0] S57,
    input [7:0] S58,
    input [7:0] S59,
    input [7:0] S60,
    input [7:0] S61,
    input [7:0] S62,
    input [7:0] S63,
    input [7:0] S64,
    input [7:0] S65,
    input [7:0] S66,
    input [7:0] S67,
    input [7:0] S68,
    input [7:0] S69,
    input [7:0] S70,
    input [7:0] S71,
    input [7:0] S72,
    input [7:0] S73,
    input [7:0] S74,
    input [7:0] S75,
    input [7:0] S76,
    input [7:0] S77,
    input [7:0] S78,
    input [7:0] S79,
    input [7:0] S80,
    input [7:0] S81,
    output reg ci_o,  // 0 or 1
    output reg done_o
);

  reg [16:0] sum;
  reg [ 7:0] muy;
  reg [ 7:0] r;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      sum <= 0;
      muy <= 0;
      ci_o <= 0;
      done_o <= 0;
    end else if (done_i) begin
      // Tính tổng của tất cả các đầu vào
      sum = S1 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9 + S10 +
             S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 +
             S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 +
             S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 +
             S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S50 +
             S51 + S52 + S53 + S54 + S55 + S56 + S57 + S58 + S59 + S60 +
             S61 + S62 + S63 + S64 + S65 + S66 + S67 + S68 + S69 + S70 +
             S71 + S72 + S73 + S74 + S75 + S76 + S77 + S78 + S79 + S80 + S81;

      // Tính muy = sum / 81 (fixed-point Q8.8)
      muy = sum / 81;
      r = sum % 81;

      // So sánh giá trị trung tâm (giả sử là S41) với muy
      if ((S41 > muy) || (S41 == muy && r == 0)) ci_o = 1;
      else ci_o = 0;

      done_o = 1;
    end else begin
      done_o = 0;
    end
  end

endmodule
