module data_modulate_3x3 #(
    parameter ROWS = 5,
    parameter COLS = 5
) (
    input clk,
    input rst_n,
    input [7:0] d0_i,  // 99
    input [7:0] d1_i,  // 8
    input [7:0] d2_i,
    input done_i,
    output [7:0] d0_o,
    output [7:0] d1_o,
    output [7:0] d2_o,
    output [7:0] d3_o,
    output [7:0] d4_o,
    output [7:0] d5_o,
    output [7:0] d6_o,
    output [7:0] d7_o,
    output [7:0] d8_o,
    output done_o
);

  wire [2:0] i_counter;
  wire start;
  wire o_en;

  data_modulate_3x3_controller CONTROLLER_3X3 (
      .rst_n(rst_n),
      .clk(clk),
      .done_i(done_i),
      .i_counter(i_counter),
      .o_en(o_en),
      .done_o(done_o),
      .start(start)

  );

  data_modulate_3x3_datapath #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) DATAPATH_3X3 (
      .clk(clk),
      .rst_n(rst_n),
      .d0_i(d0_i),
      .d1_i(d1_i),
      .d2_i(d2_i),
      .done_o(done_o),
      .start(start),
      .o_en(o_en),
      .d0_o(d0_o),
      .d1_o(d1_o),
      .d2_o(d2_o),
      .d3_o(d3_o),
      .d4_o(d4_o),
      .d5_o(d5_o),
      .d6_o(d6_o),
      .d7_o(d7_o),
      .d8_o(d8_o),
      .i_counter(i_counter)
  );


endmodule
