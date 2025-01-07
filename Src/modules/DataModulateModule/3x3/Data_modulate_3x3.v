module Data_modulate_3x3 #(parameter ROWS = 5,
                           parameter COLS = 5)
                          (input clk,
                           input rst,
                           input [7:0] d0_i,   // 99
                           input [7:0] d1_i,   // 8
                           input [7:0] d2_i,   // 7
                           input [7:0] d3_i,
                           input [7:0] d4_i,
                           input [7:0] d5_i,
                           input [7:0] d6_i,
                           input [7:0] d7_i,
                           input [7:0] d8_i,
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
                           output done_o);
    
    wire [2:0] i_counter;
    wire done_reg, start;
    
    Data_modulate_3x3_controller CONTROLLER_3X3(
    .rst(rst),
    .clk(clk),
    .done_i(done_i),
    .i_counter(i_counter),
    .done_reg(done_reg),
    .done_o(done_o),
    .start(start)
    
    );
    
    Data_modulate_3x3_datapath #(
    .ROWS(ROWS),
    .COLS(COLS)
    ) DATAPATH_3X3
    
    (
    .clk(clk),
    .rst(rst),
    .d0_i(d0_i),
    .d1_i(d1_i),
    .d2_i(d2_i),
    .d3_i(d3_i),
    .d4_i(d4_i),
    .d5_i(d5_i),
    .d6_i(d6_i),
    .d7_i(d7_i),
    .d8_i(d8_i),
    .start(start),
    .done_o(done_o),
    .d0_o(d0_o),
    .d1_o(d1_o),
    .d2_o(d2_o),
    .d3_o(d3_o),
    .d4_o(d4_o),
    .d5_o(d5_o),
    .d6_o(d6_o),
    .d7_o(d7_o),
    .d8_o(d8_o),
    .done_reg(done_reg),
    .i_counter(i_counter)
    );
    
    
endmodule
