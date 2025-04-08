module window_buffer_3x3 #(
    parameter COLS = 128,
    parameter ROWS = 128
) (
    input clk,
    input rst_n,
    input done_i,
    input [7:0] S1_i,
    S2_i,
    S3_i,
    output [7:0] S1_o,
    S2_o,
    S3_o,
    S4_o,
    S5_o,
    S6_o,
    S7_o,
    S8_o,
    S9_o,
    output done_o,
    output progress_done_o
);
  wire i_row_eq_max, i_col_eq_max, i_col_ge_threshold;
  wire count_en;
  wire reset_en;
  window_buffer_3x3_controller WINDOW_BUFFER_3X3_CONTROLLER (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .i_row_eq_max(i_row_eq_max),
      .i_col_eq_max(i_col_eq_max),
      .i_col_ge_threshold(i_col_ge_threshold),
      .count_en(count_en),
      .progress_done(progress_done_o),
      .done_o(done_o),
      .reset_en(reset_en)
  );

  window_buffer_3x3_datapath #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) WINDOW_BUFFER_3X3_DATAPATH (
      .clk(clk),
      .rst_n(rst_n),
      .count_en(count_en),
      .S1_i(S1_i),
      .S2_i(S2_i),
      .S3_i(S3_i),
      .i_row_eq_max(i_row_eq_max),
      .S1_o(S1_o),
      .S2_o(S2_o),
      .S3_o(S3_o),
      .S4_o(S4_o),
      .S5_o(S5_o),
      .S6_o(S6_o),
      .S7_o(S7_o),
      .S8_o(S8_o),
      .S9_o(S9_o),
      .i_col_eq_max(i_col_eq_max),
      .reset_en(reset_en),
      .i_col_ge_threshold(i_col_ge_threshold)
  );

endmodule
