module data_modulate_3x3_datapath #(
    parameter ROWS = 5,
    parameter COLS = 5
) (
    input            clk,
    input            rst_n,
    input      [7:0] d0_i,       // 99
    input      [7:0] d1_i,       // 8
    input      [7:0] d2_i,       // 7
    input            start,
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
    output reg [2:0] i_counter,
    input            done_o
);

  reg  done_o_prev;
  wire done_o_negedge;
  always @(posedge clk) begin
    if (~rst_n) begin
      done_o_prev <= 0;
    end else begin
      done_o_prev <= done_o;
    end
  end

  assign done_o_negedge = (done_o_prev == 1 & done_o == 0) ? 1'b1 : 1'b0;
  reg [9:0] i_row, i_col;
  reg [7:0] data0, data1, data2, data3, data4, data5, data6, data7, data8;


  wire i_row_lt_1 = (i_row < 1) ? 1 : 0;
  wire i_col_lt_1 = (i_col < 1) ? 1 : 0;
  wire i_col_eq_max = (i_col == COLS - 1) ? 1 : 0;
  wire i_row_eq_max = (i_row == ROWS - 1) ? 1 : 0;

  always @(posedge clk) begin
    if (~rst_n) begin
      i_col <= 0;
    end else if (done_o_negedge) begin
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
    end else if (done_o_negedge) begin
      i_row <= 0;
    end else if (i_row == ROWS) begin
      i_row <= 0;
    end else if (o_en & i_col_eq_max) begin
      i_row <= i_row + 1;
    end

  end

  always @(posedge clk) begin
    if (~rst_n) begin
      i_counter <= 0;
    end else if (done_o_negedge) begin
      i_counter <= 0;

    end else if (i_col_eq_max & i_row_eq_max) begin
      i_counter <= 0;
    end else if (i_counter == 2) begin
      i_counter <= i_counter;
    end else if (start) begin
      i_counter <= i_counter + 1;
    end
  end



  always @(posedge clk) begin
    if (~rst_n) begin
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
      if (o_en) begin
        d0_o <= (i_row_lt_1 | i_col_lt_1) ? 0 : data0;
        d1_o <= (i_row_lt_1) ? 0 : data1;
        d2_o <= (i_row_lt_1 | i_col_eq_max) ? 0 : data2;
        d3_o <= (i_col_lt_1) ? 0 : data3;
        d4_o <= data4;
        d5_o <= (i_col_eq_max) ? 0 : data5;
        d6_o <= (i_row_eq_max | i_col_lt_1) ? 0 : data6;
        d7_o <= (i_row_eq_max) ? 0 : data7;
        d8_o <= (i_row_eq_max | i_col_eq_max) ? 0 : data8;
      end
    end

  end






  always @(posedge clk) begin
    if (~rst_n) begin
      data0 <= 0;
      data1 <= 0;
      data2 <= 0;
      data3 <= 0;
      data4 <= 0;
      data5 <= 0;
      data6 <= 0;
      data7 <= 0;
      data8 <= 0;

      // 0 
      // 1 
      // 2
      // 3
      // 4 
      // 5 
      // 6 
    end else begin
      if (start) begin
        data0 <= data1;
        data1 <= data2;
        data2 <= d2_i;


        data3 <= data4;
        data4 <= data5;
        data5 <= d1_i;


        data6 <= data7;
        data7 <= data8;
        data8 <= d0_i;

      end

    end


  end
endmodule
