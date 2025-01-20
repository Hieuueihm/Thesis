`timescale 1ns / 1ps

module Window_buffer_7x7_tb();
    
    // Parameters
    parameter COLS = 9;
    parameter ROWS = 9;
    
    // Inputs
    reg clk;
    reg rst;
    reg done_i;
    reg [7:0] S1_i, S2_i, S3_i, S4_i, S5_i, S6_i, S7_i;
    
    // Outputs
    wire [7:0] S1_o, S2_o, S3_o, S4_o, S5_o, S6_o, S7_o, S8_o, S9_o, S10_o, S11_o, S12_o, S13_o;
    wire [7:0] S14_o, S15_o, S16_o, S17_o, S18_o, S19_o, S20_o, S21_o, S22_o, S23_o, S24_o, S25_o;
    wire [7:0] S26_o, S27_o, S28_o, S29_o, S30_o, S31_o, S32_o, S33_o, S34_o, S35_o, S36_o, S37_o, S38_o, S39_o;
    wire [7:0] S40_o, S41_o, S42_o, S43_o, S44_o, S45_o, S46_o, S47_o, S48_o, S49_o;
    wire done_o;
    wire progress_done_o;
    
    // Instantiate the Unit Under Test (UUT)
    Window_buffer_7x7 #(.COLS(COLS), .ROWS(ROWS)) uut (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .S1_i(S1_i),
    .S2_i(S2_i),
    .S3_i(S3_i),
    .S4_i(S4_i),
    .S5_i(S5_i),
    .S6_i(S6_i),
    .S7_i(S7_i),
    .S1_o(S1_o),
    .S2_o(S2_o),
    .S3_o(S3_o),
    .S4_o(S4_o),
    .S5_o(S5_o),
    .S6_o(S6_o),
    .S7_o(S7_o),
    .S8_o(S8_o),
    .S9_o(S9_o),
    .S10_o(S10_o),
    .S11_o(S11_o),
    .S12_o(S12_o),
    .S13_o(S13_o),
    .S14_o(S14_o),
    .S15_o(S15_o),
    .S16_o(S16_o),
    .S17_o(S17_o),
    .S18_o(S18_o),
    .S19_o(S19_o),
    .S20_o(S20_o),
    .S21_o(S21_o),
    .S22_o(S22_o),
    .S23_o(S23_o),
    .S24_o(S24_o),
    .S25_o(S25_o),
    .S26_o(S26_o),
    .S27_o(S27_o),
    .S28_o(S28_o),
    .S29_o(S29_o),
    .S30_o(S30_o), 
    .S31_o(S31_o),
    .S32_o(S32_o),
    .S33_o(S33_o),
    .S34_o(S34_o), 
    .S35_o(S35_o), 
    .S36_o(S36_o),
    .S37_o(S37_o), 
    .S38_o(S38_o),
    .S39_o(S39_o),
    .S40_o(S40_o),
    .S41_o(S41_o),
    .S42_o(S42_o),
    .S43_o(S43_o),
    .S44_o(S44_o),
    .S45_o(S45_o),
    .S46_o(S46_o),
    .S47_o(S47_o),
    .S48_o(S48_o),
    .S49_o(S49_o),
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
        
        // 1 2 3 4 5 6 7 8 9
        // 1 2 3 4 5 6 7 8 9
        // 1 2 3 4 5 6 7 8 9 
        // 10 11 12 13 14 15 16 17 18
        for(i = 1; i < 22; i = i + 1) begin
            S1_i = i;
            S2_i = i;
            S3_i = i;
            S4_i = i;
            S5_i = i;
            S6_i = i;
            S7_i = i;
            #10;
        end
        done_i = 0;
        
        
        #50;
        #1000;
        $stop;
    end
    
endmodule
