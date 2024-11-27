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

  // stage 1 - sort row
  wire [7:0] sa1_max, sa1_min, sa1_out4, sa1_out2, sa1_mid;
  wire [7:0] sa2_max, sa2_min, sa2_out4, sa2_out2, sa2_mid;
  wire [7:0] sa3_max, sa3_min, sa3_out4, sa3_out2, sa3_mid;
  wire [7:0] sa4_max, sa4_min, sa4_out4, sa4_out2, sa4_mid;
  wire [7:0] sa5_max, sa5_min, sa5_out4, sa5_out2, sa5_mid;

  reg [7:0]
      p2_S1,
      p2_S2,
      p2_S3,
      p2_S4,
      p2_S5,
      p2_S6,
      p2_S7,
      p2_S8,
      p2_S9,
      p2_S10,
      p2_S11,
      p2_S12,
      p2_S13,
      p2_S14,
      p2_S15,
      p2_S16,
      p2_S17,
      p2_S18,
      p2_S19,
      p2_S20,
      p2_S21,
      p2_S22,
      p2_S23,
      p2_S24,
      p2_S25;
  reg p2_done_i;

  SortAscending5 SA1 (
      .S1  (p1_S1),
      .S2  (p1_S2),
      .S3  (p1_S3),
      .S4  (p1_S4),
      .S5  (p1_S5),
      .min (sa1_min),
      .out2(sa1_out2),
      .mid (sa1_mid),
      .out4(sa1_out4),
      .max (sa1_max)
  );
  SortAscending5 SA2 (
      .S1  (p1_S6),
      .S2  (p1_S7),
      .S3  (p1_S8),
      .S4  (p1_S9),
      .S5  (p1_S10),
      .min (sa2_min),
      .out2(sa2_out2),
      .mid (sa2_mid),
      .out4(sa2_out4),
      .max (sa2_max)
  );
  SortAscending5 SA3 (
      .S1  (p1_S11),
      .S2  (p1_S12),
      .S3  (p1_S13),
      .S4  (p1_S14),
      .S5  (p1_S15),
      .min (sa3_min),
      .out2(sa3_out2),
      .mid (sa3_mid),
      .out4(sa3_out4),
      .max (sa3_max)
  );
  SortAscending5 SA4 (
      .S1  (p1_S16),
      .S2  (p1_S17),
      .S3  (p1_S18),
      .S4  (p1_S19),
      .S5  (p1_S20),
      .min (sa4_min),
      .out2(sa4_out2),
      .mid (sa4_mid),
      .out4(sa4_out4),
      .max (sa4_max)
  );
  SortAscending5 SA5 (
      .S1  (p1_S21),
      .S2  (p1_S22),
      .S3  (p1_S23),
      .S4  (p1_S24),
      .S5  (p1_S25),
      .min (sa5_min),
      .out2(sa5_out2),
      .mid (sa5_mid),
      .out4(sa5_out4),
      .max (sa5_max)
  );


  always @(posedge clk) begin
    if (rst) begin
      p2_S1 <= 0;
      p2_S2 <= 0;
      p2_S3 <= 0;
      p2_S4 <= 0;
      p2_S5 <= 0;
      p2_S6 <= 0;
      p2_S7 <= 0;
      p2_S8 <= 0;
      p2_S9 <= 0;
      p2_S10 <= 0;
      p2_S11 <= 0;
      p2_S12 <= 0;
      p2_S13 <= 0;
      p2_S14 <= 0;
      p2_S15 <= 0;
      p2_S16 <= 0;
      p2_S17 <= 0;
      p2_S18 <= 0;
      p2_S19 <= 0;
      p2_S20 <= 0;
      p2_S21 <= 0;
      p2_S22 <= 0;
      p2_S23 <= 0;
      p2_S24 <= 0;
      p2_S25 <= 0;
      p2_done_i <= 0;
    end else begin
      // col 1
      p2_S1 <= sa1_max;
      p2_S2 <= sa2_max;
      p2_S3 <= sa3_max;
      p2_S4 <= sa4_max;
      p2_S5 <= sa5_max;
      // col 2
      p2_S6 <= sa1_out2;
      p2_S7 <= sa2_out2;
      p2_S8 <= sa3_out2;
      p2_S9 <= sa4_out2;
      p2_S10 <= sa5_out2;
      // col3
      p2_S11 <= sa1_mid;
      p2_S12 <= sa2_mid;
      p2_S13 <= sa3_mid;
      p2_S14 <= sa4_mid;
      p2_S15 <= sa5_mid;
      // col4
      p2_S16 <= sa1_out4;
      p2_S17 <= sa2_out4;
      p2_S18 <= sa3_out4;
      p2_S19 <= sa4_out4;
      p2_S20 <= sa5_out4;
      // col4
      p2_S21 <= sa1_min;
      p2_S22 <= sa2_min;
      p2_S23 <= sa3_min;
      p2_S24 <= sa4_min;
      p2_S25 <= sa5_min;
      p2_done_i <= p1_done_i;
    end
  end
  // stage 2 - sort cols
  wire [7:0] sa6_max, sa6_min, sa6_out4, sa6_out2, sa6_mid;
  wire [7:0] sa7_max, sa7_min, sa7_out4, sa7_out2, sa7_mid;
  wire [7:0] sa8_max, sa8_min, sa8_out4, sa8_out2, sa8_mid;
  wire [7:0] sa9_max, sa9_min, sa9_out4, sa9_out2, sa9_mid;
  wire [7:0] sa10_max, sa10_min, sa10_out4, sa10_out2, sa10_mid;

  reg [7:0]
      p3_S1,
      p3_S2,
      p3_S3,
      p3_S4,

      p3_S6,
      p3_S7,
      p3_S8,
      p3_S9,
      p3_S10,

      p3_S11,
      p3_S12,
      p3_S13,
      p3_S14;

  reg p3_done_i;

  SortAscending5 SA6 (
      .S1  (p2_S1),
      .S2  (p2_S2),
      .S3  (p2_S3),
      .S4  (p2_S4),
      .S5  (p2_S5),
      .min (sa6_min),
      .out2(sa6_out2),
      .mid (sa6_mid),
      .out4(sa6_out4),
      .max (sa6_max)
  );
  SortAscending5 SA7 (
      .S1  (p2_S6),
      .S2  (p2_S7),
      .S3  (p2_S8),
      .S4  (p2_S9),
      .S5  (p2_S10),
      .min (sa7_min),
      .out2(sa7_out2),
      .mid (sa7_mid),
      .out4(sa7_out4),
      .max (sa7_max)
  );
  SortAscending5 SA8 (
      .S1  (p2_S11),
      .S2  (p2_S12),
      .S3  (p2_S13),
      .S4  (p2_S14),
      .S5  (p2_S15),
      .out2(sa8_out2),
      .mid (sa8_mid),
      .out4(sa8_out4),
      .max (sa8_max),
      .min (sa8_min)
  );
  SortAscending5 SA9 (
      .S1  (p2_S16),
      .S2  (p2_S17),
      .S3  (p2_S18),
      .S4  (p2_S19),
      .S5  (p2_S20),
      .min (sa9_min),
      .out2(sa9_out2),
      .mid (sa9_mid),
      .out4(sa9_out4),
      .max (sa9_max)
  );
  SortAscending5 SA10 (
      .S1  (p2_S21),
      .S2  (p2_S22),
      .S3  (p2_S23),
      .S4  (p2_S24),
      .S5  (p2_S25),
      .min (sa10_min),
      .out2(sa10_out2),
      .mid (sa10_mid),
      .out4(sa10_out4),
      .max (sa10_max)
  );

  always @(posedge clk) begin
    if (rst) begin
      p3_S1 <= 0;
      p3_S2 <= 0;
      p3_S3 <= 0;
      p3_S4 <= 0;

      p3_S6 <= 0;
      p3_S7 <= 0;
      p3_S8 <= 0;
      p3_S9 <= 0;
      p3_S10 <= 0;

      p3_S11 <= 0;
      p3_S12 <= 0;
      p3_S13 <= 0;
      p3_S14 <= 0;

      p3_done_i <= 0;
    end else begin
      // diag 0
      p3_S1 <= sa9_max;
      p3_S2 <= sa8_out2;
      p3_S3 <= sa7_mid;
      p3_S4 <= sa6_out4;
      // diag 1
      p3_S6 <= sa10_max;
      p3_S7 <= sa9_out2;
      p3_S8 <= sa8_mid;
      p3_S9 <= sa7_out4;
      p3_S10 <= sa6_min;
      // diag 2
      p3_S11 <= sa10_out2;
      p3_S12 <= sa9_mid;
      p3_S13 <= sa8_out4;
      p3_S14 <= sa7_min;

      p3_done_i <= p2_done_i;
    end
  end


  // stage 3 
  wire [7:0] max, min, mid;

  wire [7:0] sn1_max, sn1_med;
  // sorting of 3 first values
  // sorting of 3 last values

  Sorting_network SN1 (
      .S1 (p3_S1),
      .S2 (p3_S2),
      .S3 (p3_S3),
      .max(sn1_max),
      .med(sn1_med),
      .min()
  );
  Sorting_network SN2 (
      .S1 (sn1_max),
      .S2 (sn1_med),
      .S3 (p3_S4),
      .max(max),
      .med(),
      .min()
  );

  SortAscending5 SA11 (
      .S1  (p3_S6),
      .S2  (p3_S7),
      .S3  (p3_S8),
      .S4  (p3_S9),
      .S5  (p3_S10),
      .min (),
      .out2(),
      .mid (mid),
      .out4(),
      .max ()
  );

  // sorting of 3 first values
  // sorting of 3 last values
  //sorting of 3 first value

  wire [7:0] sn3_max, sn3_med, sn3_min;
  wire [7:0] sn4_max, sn4_med, sn4_min;

  Sorting_network SN3 (
      .S1 (p3_S11),
      .S2 (p3_S12),
      .S3 (p3_S13),
      .max(sn3_max),
      .med(sn3_med),
      .min(sn3_min)
  );
  Sorting_network SN4 (
      .S1 (p3_S14),
      .S2 (sn3_med),
      .S3 (sn3_max),
      .max(sn4_max),
      .med(sn4_med),
      .min(sn4_min)
  );
  Sorting_network SN5 (
      .S1 (sn3_min),
      .S2 (sn4_min),
      .S3 (sn4_med),
      .max(),
      .med(),
      .min(min)
  );

  reg [7:0] p4_max, p4_min, p4_mid;
  reg [7:0] p4_done_i;
  always @(posedge clk) begin
    if (rst) begin
      p4_max <= 0;
      p4_mid <= 0;
      p4_min <= 0;

      p4_done_i <= 0;
    end else begin
      // diag 0
      p4_max <= max;
      p4_mid <= mid;
      p4_min <= min;

      p4_done_i <= p3_done_i;
    end
  end

  Sorting_network SN6 (
      .S1 (p4_min),
      .S2 (p4_mid),
      .S3 (p4_max),
      .max(),
      .med(median_o),
      .min()
  );



  assign done_o = p4_done_i;

endmodule
