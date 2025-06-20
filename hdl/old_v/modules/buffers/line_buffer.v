module line_buffer #(
    parameter DEPTH = 17
) (
    input clk,
    input rst_n,
    input done_i,
    input [7:0] data_i,
    output [7:0] data_o,
    output o_start,
    output o_valid,
    output o_finish
);
  wire rd_en, wr_en;
  wire reset_en;


  line_buffer_controller #(
      .DEPTH(DEPTH)
  ) controller_inst (
      .clk(clk),  // Clock input
      .rst_n(rst_n),  // Reset input
      .done_i(done_i),  // Done signal when operation is complete
      .first_done(first_done),
      .last_done(last_done),
      .wr_en(wr_en),  // Write enable signal
      .rd_en(rd_en),  // Read enable signal
      .reset_en(reset_en),
      .o_valid(o_valid),
      .o_start(o_start),
      .o_finish(o_finish)
  );

  // Instantiate the datapath
  line_buffer_datapath #(
      .DEPTH(DEPTH)
  ) datapath_inst (
      .clk(clk),
      .rst_n(rst_n),
      .data_i(data_i),
      .wr_en(wr_en),
      .rd_en(rd_en),
      .data_o(data_o),
      .reset_en(reset_en),
      .first_done(first_done),
      .last_done(last_done)
  );

endmodule

