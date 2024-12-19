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
    input [7:0] S82,
    input [7:0] S83,
    input [7:0] S84,
    input [7:0] S85,
    input [7:0] S86,
    input [7:0] S87,
    input [7:0] S88,
    input [7:0] S89,
    input [7:0] S90,
    input [7:0] S91,
    input [7:0] S92,
    input [7:0] S93,
    input [7:0] S94,
    input [7:0] S95,
    input [7:0] S96,
    input [7:0] S97,
    input [7:0] S98,
    input [7:0] S99,
    input [7:0] S100,
    input [7:0] S101,
    input [7:0] S102,
    input [7:0] S103,
    input [7:0] S104,
    input [7:0] S105,
    input [7:0] S106,
    input [7:0] S107,
    input [7:0] S108,
    input [7:0] S109,
    input [7:0] S110,
    input [7:0] S111,
    input [7:0] S112,
    input [7:0] S113,
    input [7:0] S114,
    input [7:0] S115,
    input [7:0] S116,
    input [7:0] S117,
    input [7:0] S118,
    input [7:0] S119,
    input [7:0] S120,
    input [7:0] S121,
    input [7:0] S122,
    input [7:0] S123,
    input [7:0] S124,
    input [7:0] S125,
    input [7:0] S126,
    input [7:0] S127,
    input [7:0] S128,
    input [7:0] S129,
    input [7:0] S130,
    input [7:0] S131,
    input [7:0] S132,
    input [7:0] S133,
    input [7:0] S134,
    input [7:0] S135,
    input [7:0] S136,
    input [7:0] S137,
    input [7:0] S138,
    input [7:0] S139,
    input [7:0] S140,
    input [7:0] S141,
    input [7:0] S142,
    input [7:0] S143,
    input [7:0] S144,
    input [7:0] S145,
    input [7:0] S146,
    input [7:0] S147,
    input [7:0] S148,
    input [7:0] S149,
    input [7:0] S150,
    input [7:0] S151,
    input [7:0] S152,
    input [7:0] S153,
    input [7:0] S154,
    input [7:0] S155,
    input [7:0] S156,
    input [7:0] S157,
    input [7:0] S158,
    input [7:0] S159,
    input [7:0] S160,
    input [7:0] S161,
    input [7:0] S162,
    input [7:0] S163,
    input [7:0] S164,
    input [7:0] S165,
    input [7:0] S166,
    input [7:0] S167,
    input [7:0] S168,
    input [7:0] S169,
    output reg ci_o,  // 0 or 1
    output reg done_o
);

  reg [17:0] sum;
  reg [ 7:0] muy;
  reg [ 7:0] r;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      sum <= 0;
      muy <= 0;
      ci_o <= 0;
      done_o <= 0;
    end else if (done_i) begin
      // Tính tổng tất cả các đầu vào
      sum = S1 + S2 + S3 + S4 + S5 + S6 + S7 + S8 + S9 + S10 +
             S11 + S12 + S13 + S14 + S15 + S16 + S17 + S18 + S19 + S20 +
             S21 + S22 + S23 + S24 + S25 + S26 + S27 + S28 + S29 + S30 +
             S31 + S32 + S33 + S34 + S35 + S36 + S37 + S38 + S39 + S40 +
             S41 + S42 + S43 + S44 + S45 + S46 + S47 + S48 + S49 + S50 +
             S51 + S52 + S53 + S54 + S55 + S56 + S57 + S58 + S59 + S60 +
             S61 + S62 + S63 + S64 + S65 + S66 + S67 + S68 + S69 + S70 +
             S71 + S72 + S73 + S74 + S75 + S76 + S77 + S78 + S79 + S80 +
             S81 + S82 + S83 + S84 + S85 + S86 + S87 + S88 + S89 + S90 +
             S91 + S92 + S93 + S94 + S95 + S96 + S97 + S98 + S99 + S100 +
             S101 + S102 + S103 + S104 + S105 + S106 + S107 + S108 + S109 + S110 +
             S111 + S112 + S113 + S114 + S115 + S116 + S117 + S118 + S119 + S120 +
             S121 + S122 + S123 + S124 + S125 + S126 + S127 + S128 + S129 + S130 +
             S131 + S132 + S133 + S134 + S135 + S136 + S137 + S138 + S139 + S140 +
             S141 + S142 + S143 + S144 + S145 + S146 + S147 + S148 + S149 + S150 +
             S151 + S152 + S153 + S154 + S155 + S156 + S157 + S158 + S159 + S160 +
             S161 + S162 + S163 + S164 + S165 + S166 + S167 + S168 + S169;

      muy = sum / 169;
      r = sum % 169;

      if ((S85 > muy) || (S85 == muy && r == 0)) ci_o = 1;
      else ci_o = 0;

      done_o = 1;
    end else begin
      done_o = 0;
    end
  end

endmodule
