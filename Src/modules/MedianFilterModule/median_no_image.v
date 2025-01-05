module median_no_image (input clk,
                        input rst,
                        input [7:0] grayscale_i,
                        input done_i,
                        output [7:0] median_o,
                        output done_o);
    
    wire [7:0] d0_o, d1_o, d2_o, d3_o, d4_o, d5_o, d6_o, d7_o, d8_o;
    
    wire prepare_done_o;
    
    `define WIDTH 9
    
    Preparation #(
    .DEPTH(`WIDTH)
    ) MEDIAN_PREPARATION (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .data_i(grayscale_i),
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
    
    
    Median_filter_7x7 #(
    .ROWS(`WIDTH),
    .COLS(`WIDTH)
    ) MEDIAN_FILTER_3x3 (
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
    .median_o(median_o),
    .done_o(done_o)
    );
    
    
    
endmodule
