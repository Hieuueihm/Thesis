module line_buffer #(
    parameter DEPTH = 17
) (
    input clk,
    input rst_n,
    input done_i,
    input [7:0] data_i,
    output [7:0] data_o,
    output done_o
);
  wire rd_en, wr_en;
  wire [9:0] wr_pointer;
  wire [9:0] rd_pointer;
  wire [9:0] i_counter;


  // Instantiate the controller
  line_buffer_controller #(
      .DEPTH(DEPTH)
  ) controller_inst (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .done_o(done_o),
      .wr_en(wr_en),
      .rd_en(rd_en),
      .i_counter(i_counter)
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
      .i_counter(i_counter),
      .data_o(data_o)
  );

endmodule

