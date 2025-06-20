
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

  wire finish_en;
  wire o_en;
  wire count_en;
  wire reset_en;
  wire padding_fi;

  data_modulate_3x3_controller CONTROLLER_3X3 (
      .rst_n(rst_n),
      .clk(clk),
      .done_i(done_i),
      .padding_fi(padding_fi),
      .finish_en(finish_en),
      .o_en(o_en),
      .o_valid(done_o),
      .count_en(count_en),
      .reset_en(reset_en)
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
      .finish_en(finish_en),
      .padding_fi(padding_fi),
      .count_en(count_en),
      .reset_en(reset_en)
  );


endmodule
