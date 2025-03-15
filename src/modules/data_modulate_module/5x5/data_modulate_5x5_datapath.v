module data_modulate_5x5_datapath #(
    parameter ROWS = 7,
    parameter COLS = 7
) (
    input            clk,
    input            rst_n,
    input      [7:0] d0_i,
    input      [7:0] d1_i,
    input      [7:0] d2_i,
    input      [7:0] d3_i,
    input      [7:0] d4_i,
    input            o_en,
    output reg [7:0] d0_o,
    output reg [7:0] d1_o,
    output reg [7:0] d2_o,
    output reg [7:0] d3_o,
    output reg [7:0] d4_o,
    output reg [7:0] d5_o,
    output reg [7:0] d6_o,
    output reg [7:0] d7_o,
    output reg [7:0] d8_o,
    output reg [7:0] d9_o,
    output reg [7:0] d10_o,
    output reg [7:0] d11_o,
    output reg [7:0] d12_o,
    output reg [7:0] d13_o,
    output reg [7:0] d14_o,
    output reg [7:0] d15_o,
    output reg [7:0] d16_o,
    output reg [7:0] d17_o,
    output reg [7:0] d18_o,
    output reg [7:0] d19_o,
    output reg [7:0] d20_o,
    output reg [7:0] d21_o,
    output reg [7:0] d22_o,
    output reg [7:0] d23_o,
    output reg [7:0] d24_o,
    output           finish_en,
    output           padding_fi,
    input            count_en,
    input            reset_en
);
  reg [9:0] i_row, i_col;

  wire i_col_eq_max = (i_col == COLS - 1) ? 1 : 0;
  wire i_row_eq_max = (i_row == ROWS - 1) ? 1 : 0;


  always @(posedge clk) begin
    if (~rst_n) begin
      i_col <= 0;
    end else if (reset_en) begin
      i_col <= 0;
    end else if (i_col_eq_max) begin
      i_col <= 0;
    end else if (o_en) begin
      i_col <= i_col + 1;
    end

  end

  always @(posedge clk) begin
    if (~rst_n) begin
      i_row <= 0;
    end else if (reset_en) begin
      i_row <= 0;
    end else if (i_row == ROWS) begin
      i_row <= 0;
    end else if (o_en & i_col_eq_max) begin
      i_row <= i_row + 1;
    end

  end
  reg [2:0] i_counter;
  always @(posedge clk) begin
    if (~rst_n) begin
      i_counter <= 0;
    end else if (count_en) begin
      i_counter <= i_counter + 1;
    end else begin
      i_counter <= 0;
    end
  end
  assign padding_fi = (i_counter == 1) ? 1 : 0;
  assign finish_en  = (i_col_eq_max & i_row_eq_max) ? 1'b1 : 1'b0;


  reg [7:0]
      data0,
      data1,
      data2,
      data3,
      data4,
      data5,
      data6,
      data7,
      data8,
      data9,
      data10,
      data11,
      data12,
      data13,
      data14,
      data15,
      data16,
      data17,
      data18,
      data19,
      data20,
      data21,
      data22,
      data23,
      data24;

  wire i_row_lt_2 = (i_row < 2) ? 1 : 0;
  wire i_row_lt_1 = (i_row < 1) ? 1 : 0;

  wire i_col_lt_2 = (i_col < 2) ? 1 : 0;
  wire i_col_lt_1 = (i_col < 1) ? 1 : 0;

  wire i_col_gt_col_2 = (i_col > COLS - 2) ? 1 : 0;
  wire i_col_gt_col_3 = (i_col > COLS - 3) ? 1 : 0;

  wire i_row_gt_row_2 = (i_row > ROWS - 2) ? 1 : 0;
  wire i_row_gt_row_3 = (i_row > ROWS - 3) ? 1 : 0;

  always @(posedge clk) begin
    if (~rst_n) begin
      d0_o  <= 0;
      d1_o  <= 0;
      d2_o  <= 0;
      d3_o  <= 0;
      d4_o  <= 0;
      d5_o  <= 0;
      d6_o  <= 0;
      d7_o  <= 0;
      d8_o  <= 0;
      d9_o  <= 0;
      d10_o <= 0;
      d11_o <= 0;
      d12_o <= 0;
      d13_o <= 0;
      d14_o <= 0;
      d15_o <= 0;
      d16_o <= 0;
      d17_o <= 0;
      d18_o <= 0;
      d19_o <= 0;
      d20_o <= 0;
      d21_o <= 0;
      d22_o <= 0;
      d23_o <= 0;
      d24_o <= 0;
    end else begin
      // zero padding
      if (o_en) begin

        d0_o  <= (i_row_lt_2 | i_col_lt_2) ? 0 : data0;
        d1_o  <= (i_row_lt_2 | i_col_lt_1) ? 0 : data1;
        d2_o  <= (i_row_lt_2) ? 0 : data2;
        d3_o  <= (i_row_lt_2 | i_col_gt_col_2) ? 0 : data3;
        d4_o  <= (i_row_lt_2 | i_col_gt_col_3) ? 0 : data4;

        d5_o  <= (i_row_lt_1 | i_col_lt_2) ? 0 : data5;
        d6_o  <= (i_row_lt_1 | i_col_lt_1) ? 0 : data6;
        d7_o  <= (i_row_lt_1) ? 0 : data7;
        d8_o  <= (i_row_lt_1 | i_col_gt_col_2) ? 0 : data8;
        d9_o  <= (i_row_lt_1 | i_col_gt_col_3) ? 0 : data9;

        d10_o <= (i_col_lt_2) ? 0 : data10;
        d11_o <= (i_col_lt_1) ? 0 : data11;
        d12_o <= data12;
        d13_o <= (i_col_gt_col_2) ? 0 : data13;
        d14_o <= (i_col_gt_col_3) ? 0 : data14;

        d15_o <= (i_row_gt_row_2 | i_col_lt_2) ? 0 : data15;
        d16_o <= (i_row_gt_row_2 | i_col_lt_1) ? 0 : data16;
        d17_o <= (i_row_gt_row_2) ? 0 : data17;
        d18_o <= (i_row_gt_row_2 | i_col_gt_col_2) ? 0 : data18;
        d19_o <= (i_row_gt_row_2 | i_col_gt_col_3) ? 0 : data19;

        d20_o <= (i_row_gt_row_3 | i_col_lt_2) ? 0 : data20;
        d21_o <= (i_row_gt_row_3 | i_col_lt_1) ? 0 : data21;
        d22_o <= (i_row_gt_row_3) ? 0 : data22;
        d23_o <= (i_row_gt_row_3 | i_col_gt_col_2) ? 0 : data23;
        d24_o <= (i_row_gt_row_3 | i_col_gt_col_3) ? 0 : data24;



      end
    end

  end





  always @(posedge clk) begin
    if (~rst_n) begin
      data0  <= 0;
      data1  <= 0;
      data2  <= 0;
      data3  <= 0;
      data4  <= 0;
      data5  <= 0;
      data6  <= 0;
      data7  <= 0;
      data8  <= 0;
      data9  <= 0;
      data10 <= 0;
      data11 <= 0;
      data12 <= 0;
      data13 <= 0;
      data14 <= 0;
      data15 <= 0;
      data16 <= 0;
      data17 <= 0;
      data18 <= 0;
      data19 <= 0;
      data20 <= 0;
      data21 <= 0;
      data22 <= 0;
      data23 <= 0;
      data24 <= 0;
    end else begin
      // d6 d5 d4 d3 d2
      data0  <= data1;
      data1  <= data2;
      data2  <= data3;
      data3  <= data4;
      data4  <= d4_i;
      data5  <= data6;
      data6  <= data7;
      data7  <= data8;
      data8  <= data9;
      data9  <= d3_i;
      data10 <= data11;
      data11 <= data12;
      data12 <= data13;
      data13 <= data14;
      data14 <= d2_i;
      data15 <= data16;
      data16 <= data17;
      data17 <= data18;
      data18 <= data19;
      data19 <= d1_i;
      data20 <= data21;
      data21 <= data22;
      data22 <= data23;
      data23 <= data24;
      data24 <= d0_i;


    end


  end

endmodule
