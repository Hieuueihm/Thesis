module MRELBP_CI_R2 #(
    parameter ROWS,
    parameter COLS
) (
    input clk,
    input rst,
    input done_i,
    input [7:0] d0_i,
    input [7:0] d1_i,
    input [7:0] d2_i,
    input [7:0] d3_i,
    d4_i,
    output ci_o,
    output done_o
);
  wire [7:0] data0, data1, data2, data3, data4;
  wire buffer_done;
  wire [9:0] i_row, i_col;
  CI_buffer_R2 #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) CI_R2 (
      .clk(clk),
      .rst(rst),
      .done_i(done_i),
      .d0_i(d0_i),
      .d1_i(d1_i),
      .d2_i(d2_i),
      .d3_i(d3_i),
      .d4_i(d4_i),
      .data0_o(data0),
      .data1_o(data1),
      .data2_o(data2),
      .data3_o(data3),
      .data4_o(data4),
      .done_o(buffer_done),
      .i_row_o(i_row),
      .i_col_o(i_col)
  );

  wire s_all_en, acum_en;
  MRELBP_CI_R2_controller #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) CONTROLLER (
      .clk(clk),
      .rst(rst),
      .done_i(buffer_done),
      .i_row_i(i_row),
      .i_col_i(i_col),
      .s_all_en(s_all_en),
      .accum_en(acum_en)
  );

  MRELBP_CI_R2_datapath DATAPATH (
      .clk(clk),
      .rst(rst),
      .s_all_en(s_all_en),
      .accum_en(acum_en),
      .data0_i(data0),
      .data1_i(data1),
      .data2_i(data2),
      .data3_i(data3),
      .data4_i(data4),
      .ci_o(ci_o),
      .done_o(done_o)
  );


endmodule
