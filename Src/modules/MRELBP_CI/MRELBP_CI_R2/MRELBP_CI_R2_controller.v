module MRELBP_CI_R2_controller #(
    parameter ROWS,
    parameter COLS
) (
    input clk,
    input rst,
    input done_i,
    input [9:0] i_row_i,
    input [9:0] i_col_i,
    output reg s_all_en,
    output reg accum_en
);

  reg [9:0] delay_i_row;

  always @(posedge clk) begin
    if (rst) begin
      delay_i_row <= 0;
    end else begin
      delay_i_row <= i_row_i;
    end
  end

  always @(*) begin
    if (rst) begin
      s_all_en <= 0;
    end else if (done_i) begin
      if (i_col_i == 5) begin
        s_all_en <= 1;
      end else begin
        s_all_en <= 0;
      end
    end
  end
  always @(*) begin
    if (rst) begin
      accum_en <= 0;
    end else if (done_i) begin
      if (i_col_i > 5) begin
        accum_en <= 1;
      end else begin
        accum_en <= 0;
      end
    end
  end





endmodule
