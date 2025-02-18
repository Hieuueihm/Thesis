`timescale 1ns/1ps

module Line_buffer_tb();
    parameter DEPTH = 10;
    
    reg clk;
    reg rst_n;
    reg done_i;
    reg [7:0] data_i;
    wire [7:0] data_o;
    wire done_o;
    
    // Instantiate DUT (Device Under Test)
    Line_buffer #(DEPTH) DUT (
    .clk(clk),
    .rst_n(rst_n),
    .done_i(done_i),
    .data_i(data_i),
    .data_o(data_o),
    .done_o(done_o)
    );
    
    // Clock generation
    always #5 clk = ~clk;  // 10ns clock period
    
    initial begin
        // Initialize signals
        clk    = 0;
        rst_n    = 1;
        done_i = 0;
        data_i = 0;
        
        // Reset sequence
        #10 rst_n = 0;
        
        // Write data into the buffer
        repeat (DEPTH) begin
            #10 data_i = data_i + 1; // Increment input data
            done_i     = 1;
        end
        
        // Stop done_i signal
        
        // Read data from the buffer
        repeat (DEPTH) begin
            #10;
        end
        
        // End simulation
        #50;
        $stop;
    end
endmodule
