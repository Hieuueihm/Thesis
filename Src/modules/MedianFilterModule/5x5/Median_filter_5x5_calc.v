module Median_filter_5x5_calc (
    input clk,
    input rst,
    input done_i,
    input [7:0] S1,
    S2,
    S3,
    S4,
    S5,
    input [7:0] S6,
    S7,
    S8,
    S9,
    S10,
    input [7:0] S11,
    S12,
    S13,
    S14,
    S15,
    input [7:0] S16,
    S17,
    S18,
    S19,
    S20,
    input [7:0] S21,
    S22,
    S23,
    S24,
    S25,
    output [7:0] median_o,
    output reg done_o
);

  reg [7:0]
      p1_S1,
      p1_S2,
      p1_S3,
      p1_S4,
      p1_S5,
      p1_S6,
      p1_S7,
      p1_S8,
      p1_S9,
      p1_S10,
      p1_S11,
      p1_S12,
      p1_S13,
      p1_S14,
      p1_S15,
      p1_S16,
      p1_S17,
      p1_S18,
      p1_S19,
      p1_S20,
      p1_S21,
      p1_S22,
      p1_S23,
      p1_S24,
      p1_S25;
  reg p1_done_i;

  always @(posedge clk) begin
    if (rst) begin
      p1_S1 <= 0;
      p1_S2 <= 0;
      p1_S3 <= 0;
      p1_S4 <= 0;
      p1_S5 <= 0;
      p1_S6 <= 0;
      p1_S7 <= 0;
      p1_S8 <= 0;
      p1_S9 <= 0;
      p1_S10 <= 0;
      p1_S11 <= 0;
      p1_S12 <= 0;
      p1_S13 <= 0;
      p1_S14 <= 0;
      p1_S15 <= 0;
      p1_S16 <= 0;
      p1_S17 <= 0;
      p1_S18 <= 0;
      p1_S19 <= 0;
      p1_S20 <= 0;
      p1_S21 <= 0;
      p1_S22 <= 0;
      p1_S23 <= 0;
      p1_S24 <= 0;
      p1_S25 <= 0;
      p1_done_i <= 0;
    end else begin
      p1_S1 <= S1;
      p1_S2 <= S2;
      p1_S3 <= S3;
      p1_S4 <= S4;
      p1_S5 <= S5;
      p1_S6 <= S6;
      p1_S7 <= S7;
      p1_S8 <= S8;
      p1_S9 <= S9;
      p1_S10 <= S10;
      p1_S11 <= S11;
      p1_S12 <= S12;
      p1_S13 <= S13;
      p1_S14 <= S14;
      p1_S15 <= S15;
      p1_S16 <= S16;
      p1_S17 <= S17;
      p1_S18 <= S18;
      p1_S19 <= S19;
      p1_S20 <= S20;
      p1_S21 <= S21;
      p1_S22 <= S22;
      p1_S23 <= S23;
      p1_S24 <= S24;
      p1_S25 <= S25;
      p1_done_i <= done_i;
    end
  end
  wire p1_done_o;
  wire [7:0] sa1_max, sa1_out4, sa1_mid, sa1_out2, sa1_min;
  wire [7:0] sa2_max, sa2_out4, sa2_mid, sa2_out2, sa2_min;
  wire [7:0] sa3_max, sa3_out4, sa3_mid, sa3_out2, sa3_min;
  wire [7:0] sa4_max, sa4_out4, sa4_mid, sa4_out2, sa4_min;
  wire [7:0] sa5_max, sa5_out4, sa5_mid, sa5_out2, sa5_min;



  SortAscending5 SA1 (
      .clk(clk),
      .rst(rst),
      .done_i(p1_done_i),
      .done_o(p1_done_o),
      .S1(p1_S1),
      .S2(p1_S2),
      .S3(p1_S3),
      .S4(p1_S4),
      .S5(p1_S5),
      .min(sa1_min),
      .out2(sa1_out2),
      .mid(sa1_mid),
      .out4(sa1_out4),
      .max(sa1_max)
  );
  SortAscending5 SA2 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(p1_S6),
      .S2(p1_S7),
      .S3(p1_S8),
      .S4(p1_S9),
      .S5(p1_S10),
      .min(sa2_min),
      .out2(sa2_out2),
      .mid(sa2_mid),
      .out4(sa2_out4),
      .max(sa2_max)
  );
  SortAscending5 SA3 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(p1_S11),
      .S2(p1_S12),
      .S3(p1_S13),
      .S4(p1_S14),
      .S5(p1_S15),
      .min(sa3_min),
      .out2(sa3_out2),
      .mid(sa3_mid),
      .out4(sa3_out4),
      .max(sa3_max)
  );
  SortAscending5 SA4 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(p1_S16),
      .S2(p1_S17),
      .S3(p1_S18),
      .S4(p1_S19),
      .S5(p1_S20),
      .min(sa4_min),
      .out2(sa4_out2),
      .mid(sa4_mid),
      .out4(sa4_out4),
      .max(sa4_max)
  );
  SortAscending5 SA5 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(p1_S21),
      .S2(p1_S22),
      .S3(p1_S23),
      .S4(p1_S24),
      .S5(p1_S25),
      .min(sa5_min),
      .out2(sa5_out2),
      .mid(sa5_mid),
      .out4(sa5_out4),
      .max(sa5_max)
  );



  //  sort cols
  wire [7:0] sa6_max, sa6_out4, sa6_mid, sa6_out2, sa6_min;
  wire [7:0] sa7_max, sa7_out4, sa7_mid, sa7_out2, sa7_min;
  wire [7:0] sa8_max, sa8_out4, sa8_mid, sa8_out2, sa8_min;
  wire [7:0] sa9_max, sa9_out4, sa9_mid, sa9_out2, sa9_min;
  wire [7:0] sa10_max, sa10_out4, sa10_mid, sa10_out2, sa10_min;



  wire p2_done_o;

  SortAscending5 SA6 (
      .clk(clk),
      .rst(rst),
      .done_i(p1_done_o),
      .done_o(p2_done_o),
      .S1(sa1_min),
      .S2(sa2_min),
      .S3(sa3_min),
      .S4(sa4_min),
      .S5(sa5_min),
      .min(sa6_min),
      .out2(sa6_out2),
      .mid(sa6_mid),
      .out4(sa6_out4),
      .max(sa6_max)
  );
  SortAscending5 SA7 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(sa1_out2),
      .S2(sa2_out2),
      .S3(sa3_out2),
      .S4(sa4_out2),
      .S5(sa5_out2),
      .min(sa7_min),
      .out2(sa7_out2),
      .mid(sa7_mid),
      .out4(sa7_out4),
      .max(sa7_max)
  );
  SortAscending5 SA8 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(sa1_mid),
      .S2(sa2_mid),
      .S3(sa3_mid),
      .S4(sa4_mid),
      .S5(sa5_mid),
      .out2(sa8_out2),
      .mid(sa8_mid),
      .out4(sa8_out4),
      .max(sa8_max),
      .min(sa8_min)
  );
  SortAscending5 SA9 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(sa1_out4),
      .S2(sa2_out4),
      .S3(sa3_out4),
      .S4(sa4_out4),
      .S5(sa5_out4),
      .min(sa9_min),
      .out2(sa9_out2),
      .mid(sa9_mid),
      .out4(sa9_out4),
      .max(sa9_max)
  );
  SortAscending5 SA10 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(sa1_max),
      .S2(sa2_max),
      .S3(sa3_max),
      .S4(sa4_max),
      .S5(sa5_max),
      .min(sa10_min),
      .out2(sa10_out2),
      .mid(sa10_mid),
      .out4(sa10_out4),
      .max(sa10_max)
  );










  wire [7:0] sn1_max, sn1_med;
  // sorting of 3 first values
  // sorting of 3 last values

  Sorting_network SN1 (
      .S1 (sa9_min),
      .S2 (sa8_out2),
      .S3 (sa7_mid),
      .max(sn1_max),
      .med(sn1_med),
      .min()
  );
  reg [7:0] p1_sn1_max, p1_sn1_med;
  reg [7:0] p1_sa6_out4;
  always @(posedge clk) begin
    if (rst) begin
      p1_sn1_max  <= 0;
      p1_sn1_med  <= 0;
      p1_sa6_out4 <= 0;
    end else begin
      p1_sa6_out4 <= sa6_out4;
      p1_sn1_max  <= sn1_max;
      p1_sn1_med  <= sn1_med;
    end
  end
  wire [7:0] sn2_max;
  Sorting_network SN2 (
      .S1 (p1_sn1_max),
      .S2 (p1_sn1_med),
      .S3 (p1_sa6_out4),
      .max(sn2_max),
      .med(),
      .min()
  );
  reg [7:0] st1_max, st2_max, st3_max;
  always @(posedge clk) begin
    if (rst) begin
      st1_max <= 0;
    end else begin
      st1_max <= sn2_max;
    end
  end
  always @(posedge clk) begin
    if (rst) begin
      st2_max <= 0;
    end else begin
      st2_max <= st1_max;
    end
  end
  wire p3_done_o;
  // // diag 1
  // p3_S6 <= sa10_min;
  // p3_S7 <= sa9_out2;
  // p3_S8 <= sa8_mid;
  // p3_S9 <= sa7_out4;
  // p3_S10 <= sa6_max;
  wire [7:0] mid;
  SortAscending5 SA11 (
      .clk(clk),
      .rst(rst),
      .done_i(p2_done_o),
      .done_o(p3_done_o),
      .S1(sa10_min),
      .S2(sa9_out2),
      .S3(sa8_mid),
      .S4(sa7_out4),
      .S5(sa6_max),
      .min(),
      .out2(),
      .mid(mid),
      .out4(),
      .max()
  );

  // sorting of 3 first values
  // sorting of 3 last values
  //sorting of 3 first value
  reg [7:0] p1_sn3_max, p1_sn3_med, p1_sn3_min;

  wire [7:0] sn3_max, sn3_med, sn3_min;
  reg [7:0] p1_sa7_max;
  // // diag 2
  // p3_S11 <= sa10_out2;
  // p3_S12 <= sa9_mid;
  // p3_S13 <= sa8_out4;
  // p3_S14 <= sa7_max;
  Sorting_network SN3 (
      .S1 (sa10_out2),
      .S2 (sa9_mid),
      .S3 (sa8_out4),
      .max(sn3_max),
      .med(sn3_med),
      .min(sn3_min)
  );
  always @(posedge clk) begin
    if (rst) begin
      p1_sn3_max <= 0;
      p1_sn3_med <= 0;
      p1_sn3_min <= 0;
      p1_sa7_max <= 0;
    end else begin
      p1_sa7_max <= sa7_max;
      p1_sn3_max <= sn3_max;
      p1_sn3_med <= sn3_med;
      p1_sn3_min <= sn3_min;

    end
  end
  wire [7:0] sn4_max, sn4_med, sn4_min;

  Sorting_network SN4 (
      .S1 (p1_sa7_max),
      .S2 (p1_sn3_med),
      .S3 (p1_sn3_max),
      .max(sn4_max),
      .med(sn4_med),
      .min(sn4_min)
  );

  reg [7:0] p1_sn4_max, p1_sn4_med, p1_sn4_min;
  reg [7:0] p2_sn3_min;
  always @(posedge clk) begin
    if (rst) begin
      p1_sn4_max <= 0;
      p1_sn4_med <= 0;
      p1_sn4_min <= 0;
      p2_sn3_min <= 0;
    end else begin
      p2_sn3_min <= p1_sn3_min;
      p1_sn4_max <= sn4_max;
      p1_sn4_med <= sn4_med;
      p1_sn4_min <= sn4_min;

    end
  end
  reg  [7:0] st1_min;
  wire [7:0] sn5_min;
  Sorting_network SN5 (
      .S1 (p2_sn3_min),
      .S2 (p1_sn4_min),
      .S3 (p1_sn4_med),
      .max(),
      .med(),
      .min(sn5_min)
  );
  always @(posedge clk) begin
    if (rst) begin
      st1_min <= 0;
    end else begin
      st1_min <= sn5_min;
    end
  end



  wire [7:0] sn6_med;
  reg p4_done_o;
  reg [7:0] med;
  Sorting_network SN6 (
      .S1 (st1_min),
      .S2 (mid),
      .S3 (st2_max),
      .max(),
      .med(sn6_med),
      .min()
  );
  always @(posedge clk) begin
    if (rst) begin
      p4_done_o <= 0;
      med <= 0;
    end else begin
      p4_done_o <= p3_done_o;
      med <= sn6_med;
    end
  end



  assign done_o   = p4_done_o;
  assign median_o = med;

endmodule
