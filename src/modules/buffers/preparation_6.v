module preparation_6 #(
    parameter DEPTH = 10
) (
    input clk,
    input rst_n,
    input done_i,
    input [7:0] data_i,
    output [7:0] data0_o,
    output [7:0] data1_o,
    output [7:0] data2_o,
    output [7:0] data3_o,
    output [7:0] data4_o,
    output [7:0] data5_o,
    output [7:0] data6_o,
    output done_o,
    output done_original_o

);


  wire [7:0] line_buffer_out[5:0];
  wire line_buffer_o_valid[5:0];
  wire line_buffer_o_start[5:0];
  wire line_buffer_o_finish[5:0];


  assign done_o = line_buffer_o_start[2];
  assign done_original_o = line_buffer_o_valid[2];
  assign data0_o = data_i;
  assign data1_o = line_buffer_out[0];
  assign data2_o = line_buffer_out[1];
  assign data3_o = line_buffer_out[2];
  assign data4_o = line_buffer_out[3];
  assign data5_o = line_buffer_out[4];
  assign data6_o = line_buffer_out[5];
  generate
    for (genvar i = 0; i < 6; i = i + 1) begin : gen_line_buffers
      line_buffer #(
          .DEPTH(DEPTH)
      ) LINE_BUFFER (
          .clk(clk),
          .rst_n(rst_n),
          .data_i((i == 0) ? data_i : line_buffer_out[i-1]),
          .done_i((i == 0) ? (done_i) : line_buffer_o_valid[i-1]),
          .data_o(line_buffer_out[i]),
          .o_start(line_buffer_o_start[i]),
          .o_valid(line_buffer_o_valid[i]),
          .o_finish(line_buffer_o_finish[i])
      );
    end
  endgenerate




endmodule
