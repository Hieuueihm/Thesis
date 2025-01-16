`timescale 1ns / 1ps

module Joint_histogram_tb();
    
    // Clock and reset signals
    reg clk;
    reg rst;
    
    // Inputs to the DUT
    reg ci_i;
    reg [3:0] ni_i;
    reg [3:0] rd_i;
    reg done_i;
    reg progress_done_i;
    
    // Outputs from the DUT
    wire [15:0] cinird_o;
    wire done_o;
    wire finish;
    
    // Instantiate the DUT
    Joint_histogram DUT (
    .clk(clk),
    .rst(rst),
    .ci_i(ci_i),
    .ni_i(ni_i),
    .rd_i(rd_i),
    .done_i(done_i),
    .progress_done_i(progress_done_i),
    .cinird_o(cinird_o),
    .done_o(done_o),
    .finish(finish)
    );
    
    // Clock generation
    initial begin
        clk            = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end
    
    // Test stimulus
    initial begin
        rst             = 1;
        ci_i            = 0;
        ni_i            = 0;
        rd_i            = 0;
        done_i          = 0;
        progress_done_i = 0;
        
        #20;
        rst    = 0;
        done_i = 1;
        
        ci_i = 1;
        ni_i = 4'd2;
        rd_i = 4'd0;
        
        #10;
        ci_i = 0;
        ni_i = 4'd2;
        rd_i = 4'd1;
        
        #10;
        progress_done_i = 1;
        done_i          = 0;
        #10;
        progress_done_i = 0; // Deassert progress_done_i
        
        // Wait and monitor outputs
        repeat (500) @(posedge clk); // Allow time for all registers to be processed
        
        // Finish simulation
        $stop;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time: %0t | ci_i: %b | ni_i: %h | rd_i: %b | done_o: %b | finish: %b | cinird_o: %h",
        $time, ci_i, ni_i, rd_i, done_o, finish, cinird_o);
    end
    
    
endmodule
