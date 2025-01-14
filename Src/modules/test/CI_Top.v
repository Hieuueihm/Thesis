module CI_top #(parameter ROWS = 30,
                parameter COLS = 30)
               (input clk,
                input rst,
                input [7:0] grayscale_i,
                input done_i,
                output [15:0] R2_bit_one_o,
                output [15:0] R2_bit_zero_o,
                output done_R2,
                output [15:0] R4_bit_one_o,
                output [15:0] R4_bit_zero_o,
                output done_R4,
                output [15:0] R6_bit_one_o,
                output [15:0] R6_bit_zero_o,
                output done_R6,
                output [15:0] R8_bit_one_o,
                output [15:0] R8_bit_zero_o,
                output done_R8);
    
    
    wire [7:0] d0_o, d1_o, d2_o, d3_o, d4_o, d5_o, d6_o, d7_o, d8_o;
    wire prepare_done_o;
    // preparation == buffer
    Preparation #(
    .DEPTH(COLS)
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
    // median = datamodulat + calc
    wire median_done_o;
    wire [7:0] median_o;
    Median_filter_3x3 #(
    .ROWS(ROWS),
    .COLS(COLS)
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
    .done_o(median_done_o)
    );
    // buffer 16 rows;
    wire [7:0] data0_o;
    wire [7:0] data1_o;
    wire [7:0] data2_o;
    wire [7:0] data3_o;
    wire [7:0] data4_o;
    wire [7:0] data5_o;
    wire [7:0] data6_o;
    wire [7:0] data7_o;
    wire [7:0] data8_o;
    wire [7:0] data9_o, data10_o, data11_o, data12_o, data13_o, data14_o, data15_o, data16_o;
    wire buffer_16_done_o;
    Buffer_16_rows #(
    .DEPTH(COLS)
    ) BUFFER_16_ROWS (
    .clk(clk),
    .rst(rst),
    .done_i(median_done_o),
    .data_i(median_o),
    .data0_o(data0_o),
    .data1_o(data1_o),
    .data2_o(data2_o),
    .data3_o(data3_o),
    .data4_o(data4_o),
    .data5_o(data5_o),
    .data6_o(data6_o),
    .data7_o(data7_o),
    .data8_o(data8_o),
    .data9_o(data9_o),
    .data10_o(data10_o),
    .data11_o(data11_o),
    .data12_o(data12_o),
    .data13_o(data13_o),
    .data14_o(data14_o),
    .data15_o(data15_o),
    .data16_o(data16_o),
    .done_o(buffer_16_done_o)
    );
    
    
    
    // // ci calculation
    // R2_top #(.COLS(COLS),
    // .ROWS(ROWS))
    // R2_TOP
    // (
    // .clk(clk),
    // .rst(rst),
    // .done_i(buffer_16_done_o),
    // .S1(data12_o),
    // .S2(data13_o),
    // .S3(data14_o),
    // .S4(data15_o),
    // .S5(data16_o),
    // .done_o(done_R2),
    // .bit_one_o(R2_bit_one_o),
    // .bit_zero_o(R2_bit_zero_o));
    
    // R4_top #(.COLS(COLS),
    // .ROWS(ROWS))
    // R4_TOP
    // (
    // .clk(clk),
    // .rst(rst),
    // .done_i(buffer_16_done_o),
    // .S1(data8_o),
    // .S2(data9_o),
    // .S3(data10_o),
    // .S4(data11_o),
    // .S5(data12_o),
    // .S6(data13_o),
    // .S7(data14_o),
    // .S8(data15_o),
    // .S9(data16_o),
    // .done_o(done_R4),
    // .bit_one_o(R4_bit_one_o),
    // .bit_zero_o(R4_bit_zero_o));
    
    // R6_top #(.COLS(COLS),
    // .ROWS(ROWS))
    // R6_TOP
    // (
    // .clk(clk),
    // .rst(rst),
    // .done_i(buffer_16_done_o),
    // .S1(data4_o),
    // .S2(data5_o),
    // .S3(data6_o),
    // .S4(data7_o),
    // .S5(data8_o),
    // .S6(data9_o),
    // .S7(data10_o),
    // .S8(data11_o),
    // .S9(data12_o),
    // .S10(data13_o),
    // .S11(data14_o),
    // .S12(data15_o),
    // .S13(data16_o),
    // .done_o(done_R6),
    // .bit_one_o(R6_bit_one_o),
    // .bit_zero_o(R6_bit_zero_o));
    
    // R8_top #(.COLS(COLS),
    // .ROWS(ROWS))
    // R8_TOP
    // (
    // .clk(clk),
    // .rst(rst),
    // .done_i(buffer_16_done_o),
    // .S1(data0_o),
    // .S2(data1_o),
    // .S3(data2_o),
    // .S4(data3_o),
    // .S5(data4_o),
    // .S6(data5_o),
    // .S7(data6_o),
    // .S8(data7_o),
    // .S9(data8_o),
    // .S10(data9_o),
    // .S11(data10_o),
    // .S12(data11_o),
    // .S13(data12_o),
    // .S14(data13_o),
    // .S15(data14_o),
    // .S16(data15_o),
    // .S17(data16_o),
    // .done_o(done_R8),
    // .bit_one_o(R8_bit_one_o),
    // .bit_zero_o(R8_bit_zero_o));
    
    
endmodule
