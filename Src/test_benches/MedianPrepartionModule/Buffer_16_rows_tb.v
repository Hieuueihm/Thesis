`timescale 1ns / 1ps

module Buffer_16_rows_tb ();
    
    // Parameters
    parameter DEPTH = 17;  // Set the DEPTH parameter
    
    // Inputs to the Median_preparation module
    reg clk;
    reg rst;
    reg done_i;
    reg [7:0] grayscale_i;
    
    // Outputs from the Median_preparation module
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
    wire done_o;
    
    // Instantiate the Median_preparation module
    Buffer_16_rows #(
    .DEPTH(DEPTH)
    ) uut (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .data_i(grayscale_i),
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
    .done_o(done_o)
    );
    
    // Clock generation (50 MHz clock)
    always begin
        #5 clk = ~clk;  // Toggle clock every 5ns to get a 100 MHz clock
    end
    
    // Stimulus process
    initial begin
        // Initialize signals
        clk         = 0;
        rst         = 0;
        done_i      = 0;
        grayscale_i = 0;
        
        // Apply reset
        rst = 1;
        #10;
        rst = 0;
        #10;
        
        for (grayscale_i = 1; grayscale_i < 290; grayscale_i = grayscale_i + 1) begin
            done_i = 1;
            #10;
        end
        done_i = 0;
        
        #1000;
        
        $stop;
    end
    
    
    
endmodule
