`timescale 1ns / 1ps

module Window_buffer_3x3_tb();

    
    // Parameters
parameter COLS = 5;
    parameter ROWS = 5;
    
    // Inputs
    reg clk;
    reg rst;
    reg done_i;
    reg [7:0] S1_i, S2_i, S3_i;
    
    // Outputs
    wire [7:0] S1_o, S2_o, S3_o, S4_o, S5_o, S6_o, S7_o, S8_o, S9_o;
    wire done_o;
    wire progress_done_o;
    
    // Instantiate the Unit Under Test (UUT)
    Window_buffer_3x3 #(.COLS(COLS), .ROWS(ROWS)) uut (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .S1_i(S1_i),
    .S2_i(S2_i),
    .S3_i(S3_i),
    .S1_o(S1_o),
    .S2_o(S2_o),
    .S3_o(S3_o),
    .S4_o(S4_o),
    .S5_o(S5_o),
    .S6_o(S6_o),
    .S7_o(S7_o),
    .S8_o(S8_o),
    .S9_o(S9_o),
    .done_o(done_o),
    .progress_done_o(progress_done_o)
    );
    
    // Clock generation
    always #5 clk = ~clk;
    
    integer i;
    // Test stimulus
    initial begin
        // Initialize Inputs
        clk    = 0;
        rst    = 1;
        done_i = 0;
        S1_i   = 0;
        S2_i   = 0;
    S3_i   = 0;
        
        // Reset pulse
        #10;
        rst    = 0;
        done_i = 1;
        // 1 2 3 4 5
        // 1 2 3 4 5
        // 1 2 3 4 5
        
        // 6 7 8 9 10
        // 6 7 8 9 10
        // 6 7 8 9 10
        for(i = 1; i < 16; i = i + 1) begin
            S1_i = i;
            S2_i = i;
            S3_i = i;
            #10;
        end
        done_i = 0;
        
        
        #50;
        #100;
        $stop;
    end
    
endmodule
