module r6_patch_sum #(
    parameter COLS = 15,
    parameter ROWS = 15
) (
    input clk,
    input rst_n,
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
    input [7:0] S10,
    input [7:0] S11,
    input [7:0] S12,
    input [7:0] S13,
    output [15:0] sum_o,
    output done_o,
    output progress_done_o
);




  wire cum_en, sum_en, count_en;
  wire [9:0] i_counter;
  wire i_start_gt_2;
  wire ld_en;
  wire start_en;
  wire [7:0] central_value;
  wire i_row_eq_max;
  wire reset_en;

  r6_controller #(
      .COLS(COLS)
  ) r6_CONTROLLER (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .i_counter(i_counter),
      .i_start_gt_2(i_start_gt_2),
      .ld_en(ld_en),
      .cum_en(cum_en),
      .done_o(done_o),
      .sum_en(sum_en),
      .count_en(count_en),
      .start_en(start_en),
      .i_row_eq_max(i_row_eq_max),
      .progress_done(progress_done_o),
      .reset_en(reset_en)

  );

  r6_sum #(
      .COLS(COLS),
      .ROWS(ROWS),
      .USE_CENTRAL_VALUE(0)
  ) r6_SUM (
      .clk(clk),
      .rst_n(rst_n),
      .cum_en(cum_en),
      .count_en(count_en),
      .sum_en(sum_en),
      .ld_en(ld_en),
      .S1(S1),
      .S2(S2),
      .S3(S3),
      .S4(S4),
      .S5(S5),
      .S6(S6),
      .S7(S7),
      .S8(S8),
      .S9(S9),
      .S10(S10),
      .S11(S11),
      .S12(S12),
      .S13(S13),
      .sum_o(sum_o),
      .i_counter(i_counter),
      .i_start_gt_2(i_start_gt_2),
      .i_row_eq_max(i_row_eq_max),
      .central_value(central_value),
      .start_en(start_en),
      .reset_en(reset_en)


  );

endmodule
