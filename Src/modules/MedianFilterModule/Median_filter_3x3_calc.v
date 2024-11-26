module Median_filter_3x3_calc (
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
    output reg [7:0] median_o,
    output reg done_o
);


  // Stage 1 outputs
  wire [7:0] max1, med1, min1;
  wire [7:0] max2, med2, min2;
  wire [7:0] max3, med3, min3;



  // Pipeline registers for stage 2
  reg [7:0] p2_max1, p2_med1, p2_min1;
  reg [7:0] p2_max2, p2_med2, p2_min2;
  reg [7:0] p2_max3, p2_med3, p2_min3;
  reg p2_done_i;

  // Stage 2 outputs
  wire [7:0] med4, med5, med6;
  // Pipeline registers for stage 3

  reg [7:0] p3_med4, p3_med5, p3_med6;

  wire [7:0] p3_median;
  reg        p3_done_i;


  // Stage 1: 
  Sorting_network SN1 (
      .S1 (S1),
      .S2 (S2),
      .S3 (S3),
      .max(max1),
      .med(med1),
      .min(min1)
  );

  Sorting_network SN2 (
      .S1 (S4),
      .S2 (S5),
      .S3 (S6),
      .max(max2),
      .med(med2),
      .min(min2)
  );

  Sorting_network SN3 (
      .S1 (S7),
      .S2 (S8),
      .S3 (S9),
      .max(max3),
      .med(med3),
      .min(min3)
  );

  always @(posedge clk) begin
    if (rst) begin
      p2_max1   <= 0;
      p2_med1   <= 0;
      p2_min1   <= 0;
      p2_max2   <= 0;
      p2_med2   <= 0;
      p2_min2   <= 0;
      p2_max3   <= 0;
      p2_med3   <= 0;
      p2_min3   <= 0;
      p2_done_i <= 0;
    end else begin
      p2_max1   <= max1;
      p2_med1   <= med1;
      p2_min1   <= min1;
      p2_max2   <= max2;
      p2_med2   <= med2;
      p2_min2   <= min2;
      p2_max3   <= max3;
      p2_med3   <= med3;
      p2_min3   <= min3;
      p2_done_i <= done_i;
    end
  end

  // Stage 2
  Sorting_network SN4 (
      .S1 (p2_max1),
      .S2 (p2_max2),
      .S3 (p2_max3),
      .max(),
      .med(med4),
      .min()
  );
  Sorting_network SN5 (
      .S1 (p2_med1),
      .S2 (p2_med2),
      .S3 (p2_med3),
      .max(),
      .med(med5),
      .min()
  );
  Sorting_network SN6 (
      .S1 (p2_min1),
      .S2 (p2_min2),
      .S3 (p2_min3),
      .max(),
      .med(med6),
      .min()
  );


  // Stage 3 pipeline
  always @(posedge clk) begin
    if (rst) begin
      p3_med4   <= 0;
      p3_med5   <= 0;
      p3_med6   <= 0;
      p3_done_i <= 0;
    end else begin
      p3_med4   <= med4;
      p3_med5   <= med5;
      p3_med6   <= med6;
      p3_done_i <= p2_done_i;
    end
  end


  Sorting_network SN7 (
      .S1 (p3_med4),
      .S2 (p3_med5),
      .S3 (p3_med6),
      .max(),
      .med(p3_median),
      .min()
  );
  assign done_o   = p3_done_i;
  assign median_o = p3_median;




endmodule
