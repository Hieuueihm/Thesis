module median_filter_3x3 #(
    parameter ROWS = 5,
    parameter COLS = 5
) (
    input clk,
    input rst_n,
    input done_i,
    input [7:0] d0_i,
    input [7:0] d1_i,
    input [7:0] d2_i,
    output [7:0] median_o,
    output done_o
);
  wire [7:0] data0, data1, data2, data3, data4, data5, data6, data7, data8;
  wire done_o_modulate;
  data_modulate_3x3 #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) median_3X3_DATA_MODULATE (
      .clk(clk),
      .rst_n(rst_n),
      .d0_i(d0_i),  // 99
      .d1_i(d1_i),  // 8
      .d2_i(d2_i),
      // d5 d4 d3
      .done_i(done_i),
      .d0_o(data0),
      .d1_o(data1),
      .d2_o(data2),
      .d3_o(data3),
      .d4_o(data4),
      .d5_o(data5),
      .d6_o(data6),
      .d7_o(data7),
      .d8_o(data8),
      .done_o(done_o_modulate)

  );

  median_filter_3x3_calc median_3X3_CALC (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_o_modulate),
      .S1(data0),
      .S2(data1),
      .S3(data2),
      .S4(data3),
      .S5(data4),
      .S6(data5),
      .S7(data6),
      .S8(data7),
      .S9(data8),
      .median_o(median_o),
      .done_o(done_o)
  );



endmodule
