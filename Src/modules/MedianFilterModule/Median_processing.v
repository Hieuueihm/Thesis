module Median_processing #(parameter COLS = 30,
                           parameter ROWS = 30)
                          (input clk,
                           input rst,
                           input [7:0] data_i,
                           input done_i,
                           output [7:0] data_o,
                           output done_o,
                           output [7:0] m_3x3_o,
                           output done_3x3_o,
                           output [7:0] m_5x5_o,
                           output done_5x5_o,
                           output [7:0] m_7x7_o,
                           output done_7x7_o,
                           output [7:0] m_9x9_o,
                           output done_9x9_o);
    
    
    wire [7:0] d0_o, d1_o, d2_o, d3_o, d4_o, d5_o, d6_o, d7_o, d8_o;
    wire prepare_done_o;
    Preparation #(
    .DEPTH(COLS)
    ) MEDIAN_PREPARATION (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .data_i(data_i),
    .data0_o(d0_o),
    .data1_o(d1_o),
    .data2_o(d2_o),
    .data3_o(d3_o),
    .data4_o(d4_o),
    .data5_o(d5_o),
    .data6_o(d6_o),
    .data7_o(d7_o),
    .data8_o(d8_o),
    .done_o(prepare_done_o)
    );
    assign data_o = d4_o;
    assign done_o = prepare_done_o;
    
    
    
    Median_filter_3x3 #(
    .ROWS(ROWS),
    .COLS(COLS)
    ) MEDIAN_FILTER_3x3(
    .clk(clk),
    .rst(rst),
    .done_i(prepare_done_o),
    .d0_i(d0_o),
    .d1_i(d1_o),
    .d2_i(d2_o),
    .d3_i(d3_o),
    .d4_i(d4_o),
    .d5_i(d5_o),
    .d6_i(d6_o),
    .d7_i(d7_o),
    .d8_i(d8_o),
    .median_o(m_3x3_o),
    .done_o(done_3x3_o)
    );
    
    Median_filter_5x5 #(
    .ROWS(ROWS),
    .COLS(COLS)
    ) MEDIAN_FILTER_5x5(
    .clk(clk),
    .rst(rst),
    .done_i(prepare_done_o),
    .d0_i(d0_o),
    .d1_i(d1_o),
    .d2_i(d2_o),
    .d3_i(d3_o),
    .d4_i(d4_o),
    .d5_i(d5_o),
    .d6_i(d6_o),
    .d7_i(d7_o),
    .d8_i(d8_o),
    .median_o(m_5x5_o),
    .done_o(done_5x5_o)
    );
    
    
    Median_filter_7x7 #(
    .ROWS(ROWS),
    .COLS(COLS)
    ) MEDIAN_FILTER_7x7(
    .clk(clk),
    .rst(rst),
    .done_i(prepare_done_o),
    .d0_i(d0_o),
    .d1_i(d1_o),
    .d2_i(d2_o),
    .d3_i(d3_o),
    .d4_i(d4_o),
    .d5_i(d5_o),
    .d6_i(d6_o),
    .d7_i(d7_o),
    .d8_i(d8_o),
    .median_o(m_7x7_o),
    .done_o(done_7x7_o)
    );
    
    Median_filter_9x9 #(
    .ROWS(ROWS),
    .COLS(COLS)
    ) MEDIAN_FILTER_9x9(
    .clk(clk),
    .rst(rst),
    .done_i(prepare_done_o),
    .d0_i(d0_o),
    .d1_i(d1_o),
    .d2_i(d2_o),
    .d3_i(d3_o),
    .d4_i(d4_o),
    .d5_i(d5_o),
    .d6_i(d6_o),
    .d7_i(d7_o),
    .d8_i(d8_o),
    .median_o(m_9x9_o),
    .done_o(done_9x9_o)
    );
    
    
endmodule
