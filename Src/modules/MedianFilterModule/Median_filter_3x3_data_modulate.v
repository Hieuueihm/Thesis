module Median_filter_3x3_data_modulate #(
    parameter ROWS,
    parameter COLS
) (
    input clk,
    input rst,

    input [7:0] d0_i,  // 99
    input [7:0] d1_i,  // 8
    input [7:0] d2_i,  // 7
    input [7:0] d3_i,
    input [7:0] d4_i,
    input [7:0] d5_i,
    input [7:0] d6_i,
    input [7:0] d7_i,
    input [7:0] d8_i,

    // d5 d4 d3

    input done_i,

    output reg [7:0] d0_o,
    output reg [7:0] d1_o,
    output reg [7:0] d2_o,
    output reg [7:0] d3_o,
    output reg [7:0] d4_o,
    output reg [7:0] d5_o,
    output reg [7:0] d6_o,
    output reg [7:0] d7_o,
    output reg [7:0] d8_o,


    output done_o


);
  // ----- d0 d1 d2 -----
  // ----- d3 d4 d5 -----
  // ----- d6 d7 d8 -----;

  reg [9:0] i_row, i_col;

  reg [7:0] i_counter;

  reg [7:0] data0, data1, data2, data3, data4, data5, data6, data7, data8;


  assign done_o = (i_counter == 2) ? 1 : 0;

  // handle with i rows and i cols

  always @(posedge clk) begin
    if (rst) begin
      i_row <= 0;
      i_col <= 0;
    end else begin
      if (done_o) begin
        i_col <= (i_col == COLS - 1) ? 0 : i_col + 1;

        if (i_col == COLS - 1) begin
          i_row <= (i_row == ROWS - 1) ? 0 : i_row + 1;
        end
      end
    end
  end

  always @(*) begin
    if (rst) begin
      d0_o <= 0;
      d1_o <= 0;
      d2_o <= 0;
      d3_o <= 0;
      d4_o <= 0;
      d5_o <= 0;
      d6_o <= 0;
      d7_o <= 0;
      d8_o <= 0;

    end else begin
      // zero padding
      if (done_o) begin
        if (i_col == 0 && i_row == 0) begin
          d0_o <= 0;
          d1_o <= 0;
          d2_o <= 0;
          d3_o <= 0;
          d4_o <= data4;
          d5_o <= data5;
          d6_o <= 0;
          d7_o <= data7;
          d8_o <= data8;
        end else if (i_row == 0 && i_col > 0 && i_col < COLS - 1) begin
          d0_o <= 0;
          d1_o <= 0;
          d2_o <= 0;
          d3_o <= data3;
          d4_o <= data4;
          d5_o <= data5;
          d6_o <= data6;
          d7_o <= data7;
          d8_o <= data8;
        end else if (i_row == 0 && i_col == COLS - 1) begin
          d0_o <= 0;
          d1_o <= 0;
          d2_o <= 0;
          d3_o <= data3;
          d4_o <= data4;
          d5_o <= 0;
          d6_o <= data6;
          d7_o <= data7;
          d8_o <= 0;
        end else if (i_row > 0 && i_row < ROWS - 1 && i_col == 0) begin
          d0_o <= 0;
          d1_o <= data1;
          d2_o <= data2;
          d3_o <= 0;
          d4_o <= data4;
          d5_o <= data5;
          d6_o <= 0;
          d7_o <= data7;
          d8_o <= data8;
        end else if (i_row > 0 && i_row < ROWS - 1 && i_col > 0 && i_col < COLS - 1) begin
          d0_o <= data0;
          d1_o <= data1;
          d2_o <= data2;
          d3_o <= data3;
          d4_o <= data4;
          d5_o <= data5;
          d6_o <= data6;
          d7_o <= data7;
          d8_o <= data8;
        end else if (i_row > 0 && i_row < ROWS - 1 && i_col == COLS - 1) begin
          d0_o <= data0;
          d1_o <= data1;
          d2_o <= 0;
          d3_o <= data3;
          d4_o <= data4;
          d5_o <= 0;
          d6_o <= data6;
          d7_o <= data7;
          d8_o <= 0;
        end else if (i_row == ROWS - 1 && i_col == 0) begin
          d0_o <= 0;
          d1_o <= data1;
          d2_o <= data2;
          d3_o <= 0;
          d4_o <= data4;
          d5_o <= data5;
          d6_o <= 0;
          d7_o <= 0;
          d8_o <= 0;

        end else if (i_row == ROWS - 1 && i_col > 0 && i_col < COLS - 1) begin
          d0_o <= data0;
          d1_o <= data1;
          d2_o <= data2;
          d3_o <= data3;
          d4_o <= data4;
          d5_o <= data5;
          d6_o <= 0;
          d7_o <= 0;
          d8_o <= 0;

        end else if (i_row == ROWS - 1 && i_col == COLS - 1) begin
          d0_o <= data0;
          d1_o <= data1;
          d2_o <= 0;
          d3_o <= data3;
          d4_o <= data4;
          d5_o <= 0;
          d6_o <= 0;
          d7_o <= 0;
          d8_o <= 0;

        end


      end
    end

  end



  always @(posedge clk) begin
    if (rst) begin

      i_counter <= 0;
    end else begin
      if (done_i) begin
        i_counter <= (i_counter == 2) ? i_counter : i_counter + 1;
      end


    end

  end


  always @(posedge clk) begin
    if (rst) begin
      data0 <= 0;
      data1 <= 0;
      data2 <= 0;
      data3 <= 0;
      data4 <= 0;
      data5 <= 0;
      data6 <= 0;
      data7 <= 0;
      data8 <= 0;


    end else begin
      if (done_i) begin
        data0 <= data1;
        data1 <= data2;
        data2 <= d5_i;


        data3 <= data4;
        data4 <= data5;
        data5 <= d4_i;


        data6 <= data7;
        data7 <= data8;
        data8 <= d3_i;

      end

    end


  end

endmodule
