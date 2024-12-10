module Median_filter_7x7_calc (
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
    S26,
    input [7:0] S27,
    S28,
    S29,
    S30,
    S31,
    input [7:0] S32,
    S33,
    S34,
    S35,
    S36,
    input [7:0] S37,
    S38,
    S39,
    S40,
    S41,
    input [7:0] S42,
    S43,
    S44,
    S45,
    S46,
    input [7:0] S47,
    S48,
    S49,

    output [7:0] median_o,
    output done_o
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
      p1_S25,
      p1_S26,
      p1_S27,
      p1_S28,
      p1_S29,
      p1_S30,
      p1_S31,
      p1_S32,
      p1_S33,
      p1_S34,
      p1_S35,
      p1_S36,
      p1_S37,
      p1_S38,
      p1_S39,
      p1_S40,
      p1_S41,
      p1_S42,
      p1_S43,
      p1_S44,
      p1_S45,
      p1_S46,
      p1_S47,
      p1_S48,
      p1_S49;
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
      p1_S26 <= 0;
      p1_S27 <= 0;
      p1_S28 <= 0;
      p1_S29 <= 0;
      p1_S30 <= 0;
      p1_S31 <= 0;
      p1_S32 <= 0;
      p1_S33 <= 0;
      p1_S34 <= 0;
      p1_S35 <= 0;
      p1_S36 <= 0;
      p1_S37 <= 0;
      p1_S38 <= 0;
      p1_S39 <= 0;
      p1_S40 <= 0;
      p1_S41 <= 0;
      p1_S42 <= 0;
      p1_S43 <= 0;
      p1_S44 <= 0;
      p1_S45 <= 0;
      p1_S46 <= 0;
      p1_S47 <= 0;
      p1_S48 <= 0;
      p1_S49 <= 0;
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
      p1_S26 <= S26;
      p1_S27 <= S27;
      p1_S28 <= S28;
      p1_S29 <= S29;
      p1_S30 <= S30;
      p1_S31 <= S31;
      p1_S32 <= S32;
      p1_S33 <= S33;
      p1_S34 <= S34;
      p1_S35 <= S35;
      p1_S36 <= S36;
      p1_S37 <= S37;
      p1_S38 <= S38;
      p1_S39 <= S39;
      p1_S40 <= S40;
      p1_S41 <= S41;
      p1_S42 <= S42;
      p1_S43 <= S43;
      p1_S44 <= S44;
      p1_S45 <= S45;
      p1_S46 <= S46;
      p1_S47 <= S47;
      p1_S48 <= S48;
      p1_S49 <= S49;
      p1_done_i <= done_i;
    end
  end

  // stage 1 - sort row
  wire [7:0] sa1_max, sa1_out6, sa1_out5, sa1_mid, sa1_out3, sa1_out2, sa1_min;
  wire [7:0] sa2_max, sa2_out6, sa2_out5, sa2_mid, sa2_out3, sa2_out2, sa2_min;
  wire [7:0] sa3_max, sa3_out6, sa3_out5, sa3_mid, sa3_out3, sa3_out2, sa3_min;
  wire [7:0] sa4_max, sa4_out6, sa4_out5, sa4_mid, sa4_out3, sa4_out2, sa4_min;
  wire [7:0] sa5_max, sa5_out6, sa5_out5, sa5_mid, sa5_out3, sa5_out2, sa5_min;
  wire [7:0] sa6_max, sa6_out6, sa6_out5, sa6_mid, sa6_out3, sa6_out2, sa6_min;
  wire [7:0] sa7_max, sa7_out6, sa7_out5, sa7_mid, sa7_out3, sa7_out2, sa7_min;

  wire p2_done_i;

  SortAscending7 SA1 (
      .clk(clk),
      .rst(rst),
      .done_i(p1_done_i),
      .done_o(p2_done_i),
      .S1(p1_S1),
      .S2(p1_S2),
      .S3(p1_S3),
      .S4(p1_S4),
      .S5(p1_S5),
      .S6(p1_S6),
      .S7(p1_S7),
      .min(sa1_min),
      .out2(sa1_out2),
      .out3(sa1_out3),
      .mid(sa1_mid),
      .out5(sa1_out5),
      .out6(sa1_out6),
      .max(sa1_max)
  );
  SortAscending7 SA2 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(p1_S8),
      .S2(p1_S9),
      .S3(p1_S10),
      .S4(p1_S11),
      .S5(p1_S12),
      .S6(p1_S13),
      .S7(p1_S14),
      .min(sa2_min),
      .out2(sa2_out2),
      .out3(sa2_out3),
      .mid(sa2_mid),
      .out5(sa2_out5),
      .out6(sa2_out6),
      .max(sa2_max)
  );
  SortAscending7 SA3 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(p1_S15),
      .S2(p1_S16),
      .S3(p1_S17),
      .S4(p1_S18),
      .S5(p1_S19),
      .S6(p1_S20),
      .S7(p1_S21),
      .min(sa3_min),
      .out2(sa3_out2),
      .out3(sa3_out3),
      .mid(sa3_mid),
      .out5(sa3_out5),
      .out6(sa3_out6),
      .max(sa3_max)
  );
  SortAscending7 SA4 (
      .clk(clk),
      .rst(rst),
      .done_i(p1_done_i),
      .done_o(),
      .S1(p1_S22),
      .S2(p1_S23),
      .S3(p1_S24),
      .S4(p1_S25),
      .S5(p1_S26),
      .S6(p1_S27),
      .S7(p1_S28),
      .out2(sa4_out2),
      .out3(sa4_out3),
      .mid(sa4_mid),
      .out5(sa4_out5),
      .out6(sa4_out6),
      .min(sa4_min),
      .max(sa4_max)
  );
  SortAscending7 SA5 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(p1_S29),
      .S2(p1_S30),
      .S3(p1_S31),
      .S4(p1_S32),
      .S5(p1_S33),
      .S6(p1_S34),
      .S7(p1_S35),
      .min(sa5_min),
      .out2(sa5_out2),
      .out3(sa5_out3),
      .mid(sa5_mid),
      .out5(sa5_out5),
      .out6(sa5_out6),
      .max(sa5_max)
  );
  SortAscending7 SA6 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(p1_S36),
      .S2(p1_S37),
      .S3(p1_S38),
      .S4(p1_S39),
      .S5(p1_S40),
      .S6(p1_S41),
      .S7(p1_S42),
      .out2(sa6_out2),
      .out3(sa6_out3),
      .mid(sa6_mid),
      .out5(sa6_out5),
      .min(sa6_min),
      .out6(sa6_out6),
      .max(sa6_max)
  );
  SortAscending7 SA7 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(p1_S43),
      .S2(p1_S44),
      .S3(p1_S45),
      .S4(p1_S46),
      .S5(p1_S47),
      .S6(p1_S48),
      .S7(p1_S49),
      .min(sa7_min),
      .out2(sa7_out2),
      .out3(sa7_out3),
      .mid(sa7_mid),
      .out5(sa7_out5),
      .out6(sa7_out6),
      .max(sa7_max)
  );



  // stage 2 - sort cols
  wire [7:0] sa8_max, sa8_out6, sa8_out5, sa8_mid, sa8_out3, sa8_out2, sa8_min;
  wire [7:0] sa9_max, sa9_out6, sa9_out5, sa9_mid, sa9_out3, sa9_out2, sa9_min;
  wire [7:0] sa10_max, sa10_out6, sa10_out5, sa10_mid, sa10_out3, sa10_out2, sa10_min;
  wire [7:0] sa11_max, sa11_out6, sa11_out5, sa11_mid, sa11_out3, sa11_out2, sa11_min;
  wire [7:0] sa12_max, sa12_out6, sa12_out5, sa12_mid, sa12_out3, sa12_out2, sa12_min;
  wire [7:0] sa13_max, sa13_out6, sa13_out5, sa13_mid, sa13_out3, sa13_out2, sa13_min;
  wire [7:0] sa14_max, sa14_out6, sa14_out5, sa14_mid, sa14_out3, sa14_out2, sa14_min;



  wire p3_done_i;
  SortAscending7 SA8 (
      .clk(clk),
      .rst(rst),
      .done_i(p2_done_i),
      .done_o(p3_done_i),
      .S1(sa1_min),
      .S2(sa2_min),
      .S3(sa3_min),
      .S4(sa4_min),
      .S5(sa5_min),
      .S6(sa6_min),
      .S7(sa7_min),
      .min(sa8_min),
      .out2(sa8_out2),
      .out3(sa8_out3),
      .mid(sa8_mid),
      .out5(sa8_out5),
      .out6(sa8_out6),
      .max(sa8_max)
  );
  SortAscending7 SA9 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(sa1_out2),
      .S2(sa2_out2),
      .S3(sa3_out2),
      .S4(sa4_out2),
      .S5(sa5_out2),
      .S6(sa6_out2),
      .S7(sa7_out2),
      .min(sa9_min),
      .out2(sa9_out2),
      .out3(sa9_out3),
      .mid(sa9_mid),
      .out5(sa9_out5),
      .out6(sa9_out6),
      .max(sa9_max)
  );
  SortAscending7 SA10 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(sa1_out3),
      .S2(sa2_out3),
      .S3(sa3_out3),
      .S4(sa4_out3),
      .S5(sa5_out3),
      .S6(sa6_out3),
      .S7(sa7_out3),
      .min(sa10_min),
      .out2(sa10_out2),
      .out3(sa10_out3),
      .mid(sa10_mid),
      .out5(sa10_out5),
      .out6(sa10_out6),
      .max(sa10_max)
  );
  SortAscending7 SA11 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(sa1_mid),
      .S2(sa2_mid),
      .S3(sa3_mid),
      .S4(sa4_mid),
      .S5(sa5_mid),
      .S6(sa6_mid),
      .S7(sa7_mid),
      .out2(sa11_out2),
      .out3(sa11_out3),
      .mid(sa11_mid),
      .out5(sa11_out5),
      .out6(sa11_out6),
      .min(sa11_min),
      .max(sa11_max)
  );
  SortAscending7 SA12 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(sa1_out5),
      .S2(sa2_out5),
      .S3(sa3_out5),
      .S4(sa4_out5),
      .S5(sa5_out5),
      .S6(sa6_out5),
      .S7(sa7_out5),
      .min(sa12_min),
      .out2(sa12_out2),
      .out3(sa12_out3),
      .mid(sa12_mid),
      .out5(sa12_out5),
      .out6(sa12_out6),
      .max(sa12_max)
  );
  SortAscending7 SA13 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(sa1_out6),
      .S2(sa2_out6),
      .S3(sa3_out6),
      .S4(sa4_out6),
      .S5(sa5_out6),
      .S6(sa6_out6),
      .S7(sa7_out6),
      .out2(sa13_out2),
      .out3(sa13_out3),
      .mid(sa13_mid),
      .out5(sa13_out5),
      .min(sa13_min),
      .out6(sa13_out6),
      .max(sa13_max)
  );
  SortAscending7 SA14 (
      .clk(clk),
      .rst(rst),
      .done_i(),
      .done_o(),
      .S1(sa1_max),
      .S2(sa2_max),
      .S3(sa3_max),
      .S4(sa4_max),
      .S5(sa5_max),
      .S6(sa6_max),
      .S7(sa7_max),
      .min(sa14_min),
      .out2(sa14_out2),
      .out3(sa14_out3),
      .mid(sa14_mid),
      .out5(sa14_out5),
      .out6(sa14_out6),
      .max(sa14_max)
  );

  // sort 3 upper left corner element and lower right corner element
  wire [7:0] upper_left_max, lower_right_min;
  Sorting_network SN1 (
      .S1 (sa10_out3),
      .S2 (sa11_out2),
      .S3 (sa12_min),
      .max(upper_left_max),
      .med(),
      .min()
  );

  Sorting_network SN2 (
      .S1 (sa10_max),
      .S2 (sa11_out6),
      .S3 (sa12_out5),
      .max(),
      .med(),
      .min(lower_right_min)
  );
  reg [7:0]
      p3_S1,
      p3_S2,
      p3_S3,
      p3_S4,
      p3_S5,
      p3_S6,
      p3_S7,
      p3_S8,
      p3_S9,
      p3_S10,
      p3_S11,
      p3_S12,
      p3_S13,
      p3_S14,
      p3_S15,
      p3_S16,
      p3_S17,
      p3_S18,
      p3_S19,
      p3_S20,
      p3_S21,
      p3_S22,
      p3_S23,
      p3_S24,
      p3_S25;

  reg p4_done_o;
  always @(posedge clk) begin
    if (rst) begin
      p3_S1 <= 0;
      p3_S2 <= 0;
      p3_S3 <= 0;
      p3_S4 <= 0;
      p3_S5 <= 0;
      p3_S6 <= 0;
      p3_S7 <= 0;
      p3_S8 <= 0;
      p3_S9 <= 0;
      p3_S10 <= 0;
      p3_S11 <= 0;
      p3_S12 <= 0;
      p3_S13 <= 0;
      p3_S14 <= 0;
      p3_S15 <= 0;
      p3_S16 <= 0;
      p3_S17 <= 0;
      p3_S18 <= 0;
      p3_S19 <= 0;
      p3_S20 <= 0;
      p3_S21 <= 0;
      p3_S22 <= 0;
      p3_S23 <= 0;
      p3_S24 <= 0;
      p3_S25 <= 0;

      p4_done_o <= 0;
    end else begin

      p3_S1 <= sa13_min;
      p3_S2 <= sa14_min;
      p3_S3 <= sa12_out2;
      p3_S4 <= sa13_out2;
      p3_S5 <= sa14_out2;

      p3_S6 <= upper_left_max;
      p3_S7 <= sa11_out3;
      p3_S8 <= sa12_out3;
      p3_S9 <= sa13_out3;
      p3_S10 <= sa14_out3;

      p3_S11 <= sa9_mid;
      p3_S12 <= sa10_mid;
      p3_S13 <= sa11_mid;
      p3_S14 <= sa12_mid;
      p3_S15 <= sa13_mid;


      p3_S16 <= sa8_out5;
      p3_S17 <= sa9_out5;
      p3_S18 <= sa10_out5;
      p3_S19 <= sa11_out5;
      p3_S20 <= lower_right_min;

      p3_S21 <= sa8_out6;
      p3_S22 <= sa9_out6;
      p3_S23 <= sa10_out6;
      p3_S24 <= sa8_max;
      p3_S25 <= sa9_max;


      p4_done_o <= p3_done_i;
    end
  end
  wire [7:0] med_o;
  wire p5_done_o;
  Median_filter_5x5_calc CALC75 (
      .clk(clk),
      .rst(rst),
      .done_i(p4_done_o),
      .S1(p3_S1),
      .S2(p3_S2),
      .S3(p3_S3),
      .S4(p3_S4),
      .S5(p3_S5),
      .S6(p3_S6),
      .S7(p3_S7),
      .S8(p3_S8),
      .S9(p3_S9),
      .S10(p3_S10),
      .S11(p3_S11),
      .S12(p3_S12),
      .S13(p3_S13),
      .S14(p3_S14),
      .S15(p3_S15),
      .S16(p3_S16),
      .S17(p3_S17),
      .S18(p3_S18),
      .S19(p3_S19),
      .S20(p3_S20),
      .S21(p3_S21),
      .S22(p3_S22),
      .S23(p3_S23),
      .S24(p3_S24),
      .S25(p3_S25),
      .median_o(median_o),
      .done_o(done_o)
  );

  reg [7:0] p5_med_o;
  reg p_done_o;
  always @(posedge clk) begin
    if (rst) begin
      p5_med_o <= 0;
      p_done_o <= 0;
    end else begin
      p5_med_o <= med_o;
      p_done_o <= p5_done_o;
    end
  end

  assign median_o = p5_med_o;
  assign done_o   = p_done_o;



endmodule
