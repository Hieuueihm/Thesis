module window_buffer_9x9_datapath #(
    parameter COLS = 9,
    parameter ROWS = 9
) (
    input clk,
    input rst_n,
    input count_en,
    input [7:0] S1_i,
    S2_i,
    S3_i,
    S4_i,
    S5_i,
    S6_i,
    S7_i,
    S8_i,
    S9_i,
    output i_row_eq_max,
    output [7:0] S1_o,
    S2_o,
    S3_o,
    S4_o,
    S5_o,
    S6_o,
    S7_o,
    S8_o,
    S9_o,
    S10_o,
    S11_o,
    S12_o,
    S13_o,
    S14_o,
    S15_o,
    S16_o,
    S17_o,
    S18_o,
    S19_o,
    S20_o,
    S21_o,
    S22_o,
    S23_o,
    S24_o,
    S25_o,
    S26_o,
    S27_o,
    S28_o,
    S29_o,
    S30_o,
    S31_o,
    S32_o,
    S33_o,
    S34_o,
    S35_o,
    S36_o,
    S37_o,
    S38_o,
    S39_o,
    S40_o,
    S41_o,
    S42_o,
    S43_o,
    S44_o,
    S45_o,
    S46_o,
    S47_o,
    S48_o,
    S49_o,
    S50_o,
    S51_o,
    S52_o,
    S53_o,
    S54_o,
    S55_o,
    S56_o,
    S57_o,
    S58_o,
    S59_o,
    S60_o,
    S61_o,
    S62_o,
    S63_o,
    S64_o,
    S65_o,
    S66_o,
    S67_o,
    S68_o,
    S69_o,
    S70_o,
    S71_o,
    S72_o,
    S73_o,
    S74_o,
    S75_o,
    S76_o,
    S77_o,
    S78_o,
    S79_o,
    S80_o,
    S81_o,
    output i_col_eq_max,
    output i_col_ge_threshold,
    input reset_en
);

  reg [9:0] i_counter;
  reg [9:0] i_row;

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      i_counter <= 0;
    end else if (reset_en) begin
      i_counter <= 0;
    end else if (count_en) begin
      i_counter <= i_counter + 1;
    end
    if (i_col_eq_max) begin
      i_counter <= 0;
    end
  end
  assign i_col_eq_max = (i_counter == COLS - 2);
  assign i_col_ge_threshold = (i_counter > 6);


  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      i_row <= 0;
    end else if (reset_en) begin
      i_row <= 0;
    end else if (i_col_eq_max) begin
      i_row <= i_row + 1;
    end
  end
  assign i_row_eq_max = (i_row == ROWS - 8);

  reg [7:0] S1_delay;
  reg [7:0] S2_delay;
  reg [7:0] S3_delay;
  reg [7:0] S4_delay;
  reg [7:0] S5_delay;
  reg [7:0] S6_delay;
  reg [7:0] S7_delay;
  reg [7:0] S8_delay;
  reg [7:0] S9_delay;

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      S1_delay <= 0;
      S2_delay <= 0;
      S3_delay <= 0;
      S4_delay <= 0;
      S5_delay <= 0;
      S6_delay <= 0;
      S7_delay <= 0;
      S8_delay <= 0;
      S9_delay <= 0;
    end else begin
      S1_delay <= S1_i;
      S2_delay <= S2_i;
      S3_delay <= S3_i;
      S4_delay <= S4_i;
      S5_delay <= S5_i;
      S6_delay <= S6_i;
      S7_delay <= S7_i;
      S8_delay <= S8_i;
      S9_delay <= S9_i;
    end
  end

  reg [7:0] S1_window[8:0];
  reg [7:0] S2_window[8:0];
  reg [7:0] S3_window[8:0];
  reg [7:0] S4_window[8:0];
  reg [7:0] S5_window[8:0];
  reg [7:0] S6_window[8:0];
  reg [7:0] S7_window[8:0];
  reg [7:0] S8_window[8:0];
  reg [7:0] S9_window[8:0];
  integer i;
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      for (i = 0; i < 9; i = i + 1) begin
        S1_window[i] <= 0;
        S2_window[i] <= 0;
        S3_window[i] <= 0;
        S4_window[i] <= 0;
        S5_window[i] <= 0;
        S6_window[i] <= 0;
        S7_window[i] <= 0;
        S8_window[i] <= 0;
        S9_window[i] <= 0;
      end
    end else begin
      S1_window[0] <= S1_delay;
      S2_window[0] <= S2_delay;
      S3_window[0] <= S3_delay;
      S4_window[0] <= S4_delay;
      S5_window[0] <= S5_delay;
      S6_window[0] <= S6_delay;
      S7_window[0] <= S7_delay;
      S8_window[0] <= S8_delay;
      S9_window[0] <= S9_delay;

      for (i = 1; i < 9; i = i + 1) begin
        S1_window[i] <= S1_window[i-1];
        S2_window[i] <= S2_window[i-1];
        S3_window[i] <= S3_window[i-1];
        S4_window[i] <= S4_window[i-1];
        S5_window[i] <= S5_window[i-1];
        S6_window[i] <= S6_window[i-1];
        S7_window[i] <= S7_window[i-1];
        S8_window[i] <= S8_window[i-1];
        S9_window[i] <= S9_window[i-1];

      end
    end
  end

  assign S1_o  = S1_window[8];
  assign S2_o  = S1_window[7];
  assign S3_o  = S1_window[6];
  assign S4_o  = S1_window[5];
  assign S5_o  = S1_window[4];
  assign S6_o  = S1_window[3];
  assign S7_o  = S1_window[2];
  assign S8_o  = S1_window[1];
  assign S9_o  = S1_window[0];

  assign S10_o = S2_window[8];
  assign S11_o = S2_window[7];
  assign S12_o = S2_window[6];
  assign S13_o = S2_window[5];
  assign S14_o = S2_window[4];
  assign S15_o = S2_window[3];
  assign S16_o = S2_window[2];
  assign S17_o = S2_window[1];
  assign S18_o = S2_window[0];

  assign S19_o = S3_window[8];
  assign S20_o = S3_window[7];
  assign S21_o = S3_window[6];
  assign S22_o = S3_window[5];
  assign S23_o = S3_window[4];
  assign S24_o = S3_window[3];
  assign S25_o = S3_window[2];
  assign S26_o = S3_window[1];
  assign S27_o = S3_window[0];

  assign S28_o = S4_window[8];
  assign S29_o = S4_window[7];
  assign S30_o = S4_window[6];
  assign S31_o = S4_window[5];
  assign S32_o = S4_window[4];
  assign S33_o = S4_window[3];
  assign S34_o = S4_window[2];
  assign S35_o = S4_window[1];
  assign S36_o = S4_window[0];


  assign S37_o = S5_window[8];
  assign S38_o = S5_window[7];
  assign S39_o = S5_window[6];
  assign S40_o = S5_window[5];
  assign S41_o = S5_window[4];
  assign S42_o = S5_window[3];
  assign S43_o = S5_window[2];
  assign S44_o = S5_window[1];
  assign S45_o = S5_window[0];


  assign S46_o = S6_window[8];
  assign S47_o = S6_window[7];
  assign S48_o = S6_window[6];
  assign S49_o = S6_window[5];
  assign S50_o = S6_window[4];
  assign S51_o = S6_window[3];
  assign S52_o = S6_window[2];
  assign S53_o = S6_window[1];
  assign S54_o = S6_window[0];


  assign S55_o = S7_window[8];
  assign S56_o = S7_window[7];
  assign S57_o = S7_window[6];
  assign S58_o = S7_window[5];
  assign S59_o = S7_window[4];
  assign S60_o = S7_window[3];
  assign S61_o = S7_window[2];
  assign S62_o = S7_window[1];
  assign S63_o = S7_window[0];

  assign S64_o = S8_window[8];
  assign S65_o = S8_window[7];
  assign S66_o = S8_window[6];
  assign S67_o = S8_window[5];
  assign S68_o = S8_window[4];
  assign S69_o = S8_window[3];
  assign S70_o = S8_window[2];
  assign S71_o = S8_window[1];
  assign S72_o = S8_window[0];

  assign S73_o = S9_window[8];
  assign S74_o = S9_window[7];
  assign S75_o = S9_window[6];
  assign S76_o = S9_window[5];
  assign S77_o = S9_window[4];
  assign S78_o = S9_window[3];
  assign S79_o = S9_window[2];
  assign S80_o = S9_window[1];
  assign S81_o = S9_window[0];


endmodule
