module data_modulate_5x5 #(
    parameter ROWS = 7,
    parameter COLS = 7
) (
    input clk,
    input rst_n,
    input [7:0] d0_i,
    input [7:0] d1_i,
    input [7:0] d2_i,
    input [7:0] d3_i,
    input [7:0] d4_i,
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
    output [7:0] d9_o,
    output [7:0] d10_o,
    output [7:0] d11_o,
    output [7:0] d12_o,
    output [7:0] d13_o,
    output [7:0] d14_o,
    output [7:0] d15_o,
    output [7:0] d16_o,
    output [7:0] d17_o,
    output [7:0] d18_o,
    output [7:0] d19_o,
    output [7:0] d20_o,
    output [7:0] d21_o,
    output [7:0] d22_o,
    output [7:0] d23_o,
    output [7:0] d24_o,
    output done_o
);
  wire start;
  wire [2:0] i_counter;
  wire o_en;
  data_modulate_5x5_controller CONTROLLER_5X5 (
      .rst_n(rst_n),
      .clk(clk),
      .done_i(done_i),
      .i_counter(i_counter),
      .done_o(done_o),
      .o_en(o_en),
      .start(start)
  );
  data_modulate_5x5_datapath #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) DATAPATH_5X5 (
      .clk  (clk),
      .rst_n(rst_n),
      .start(start),
      .o_en (o_en),
      .d0_i (d0_i),
      .d1_i (d1_i),
      .d2_i (d2_i),
      .d3_i (d3_i),
      .d4_i (d4_i),
      .d0_o (d0_o),
      .d1_o (d1_o),
      .d2_o (d2_o),
      .d3_o (d3_o),
      .d4_o (d4_o),
      .d5_o (d5_o),
      .d6_o (d6_o),
      .d7_o (d7_o),
      .d8_o (d8_o),
      .d9_o (d9_o),
      .d10_o(d10_o),
      .d11_o(d11_o),
      .d12_o(d12_o),
      .d13_o(d13_o),
      .d14_o(d14_o),
      .d15_o(d15_o),
      .d16_o(d16_o),

      .d17_o(d17_o),
      .d18_o(d18_o),
      .d19_o(d19_o),

      .d20_o(d20_o),
      .d21_o(d21_o),
      .d22_o(d22_o),
      .d23_o(d23_o),
      .d24_o(d24_o),
      .i_counter(i_counter),
      .done_o(done_o)
  );

endmodule
