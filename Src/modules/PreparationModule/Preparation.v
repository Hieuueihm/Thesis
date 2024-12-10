module Preparation #(
    parameter DEPTH
) (
    input clk,
    input rst,
    input done_i,
    input [7:0] data_i,
    // outputs
    output [7:0] data0_o,
    output [7:0] data1_o,
    output [7:0] data2_o,
    output [7:0] data3_o,
    output [7:0] data4_o,
    output [7:0] data5_o,
    output [7:0] data6_o,
    output [7:0] data7_o,
    output [7:0] data8_o,
    output done_o
);

  wire [7:0] line_buffer_out[7:0];
  wire line_buffer_done[7:0];
  assign done_o  = line_buffer_done[3];  // line buffer 3 done 
  assign data0_o = grayscale_i;
  assign data1_o = line_buffer_out[0];
  assign data2_o = line_buffer_out[1];
  assign data3_o = line_buffer_out[2];
  assign data4_o = line_buffer_out[3];
  assign data5_o = line_buffer_out[4];
  assign data6_o = line_buffer_out[5];
  assign data7_o = line_buffer_out[6];
  assign data8_o = line_buffer_out[7];
  generate
    for (genvar i = 0; i < 8; i = i + 1) begin : gen_line_buffers
      Line_buffer #(
          .DEPTH(DEPTH)
      ) LINE_BUFFER (
          .clk(clk),
          .rst(rst),
          .data_i((i == 0) ? grayscale_i : line_buffer_out[i-1]),
          .done_i((i == 0) ? done_i : line_buffer_done[i-1]),
          .data_o(line_buffer_out[i]),
          .done_o(line_buffer_done[i])
      );
    end
  endgenerate




endmodule
