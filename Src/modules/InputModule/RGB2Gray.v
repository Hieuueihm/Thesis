`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11/15/2024 03:05:36 PM
// Design Name:
// Module Name: RGB2Gray
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module RGB2Gray (input clk,
                 input rst,
                 input [7:0] red_i,
                 input [7:0] green_i,
                 input [7:0] blue_i,
                 input done_i,
                 output [7:0] grayscale_o,
                 output reg);
    
    
    
    RGB2Gray_datapath DATAPATH
    (
    .clk(clk),
    .rst(rst),
    .red_i(red_i),
    .green_i(green_i),
    .blue_i(blue_i),
    .done_i(done_i),
    .grayscale_o(grayscale_o)
    );
    RGB2Gray_controller CONTROLLER
    (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .done_o(done_o)
    );
    
endmodule
