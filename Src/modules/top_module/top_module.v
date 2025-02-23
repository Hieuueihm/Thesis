module top_module #(
    parameter COLS = 128,
    parameter ROWS = 128
) (
    input clk,
    input rst_n,
    input [7:0] grayscale_i,
    input start_i,
    input i_valid,
    output [15:0] histogram_o,
    output o_valid,
    output o_intr
);


  wire finish;
  wire read_finish;
  wire read_en;
  top_module__controller inst_top_module__controller (
      .clk        (clk),
      .rst_n      (rst_n),
      .finish_i   (finish),
      .start_i    (start_i),
      .read_finish(read_finish),
      .o_intr     (o_intr),
      .read_en    (read_en)
  );
  top_module__datapath #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) inst_top_module__datapath (
      .clk        (clk),
      .rst_n      (rst_n),
      .grayscale_i(grayscale_i),
      .i_valid    (i_valid),
      .read_en    (read_en),
      .histogram_o(histogram_o),
      .o_valid    (o_valid),
      .finish     (finish),
      .read_finish(read_finish)
  );



endmodule

