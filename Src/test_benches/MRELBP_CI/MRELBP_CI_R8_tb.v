`timescale 1ns / 1ps

module MRELBP_CI_R8_tb();
    
    reg clk;
    reg rst;
    reg done_i;
    reg [7:0] S1;
    reg [7:0] S2;
    reg [7:0] S3;
    reg [7:0] S4;
    reg [7:0] S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17;
    wire done_o;
    wire ci_o;
    wire progress_done_o;
    MRELBP_CI_R8 DUT (.clk(clk), .rst(rst), .done_i(done_i), .S1(S1), .S2(S2), .S3(S3), .S4(S4), .S5(S5),
    .S6(S6),
    .S7(S7),
    .S8(S8),
    .S9(S9),
    .S10(S10),
    .S11(S11),
    .S12(S12),
    .S13(S13),
    .S14(S14),
    .S15(S15),
    .S16(S16),
    .S17(S17),
    .done_o(done_o), .ci_o(ci_o), .progress_done_o(progress_done_o));
    
    
    // Clock generation
    always #5 clk = ~clk; // 10 ns clock period
    integer i;
    initial begin
        // Initialize inputs
        clk    = 0;
        rst    = 1;
        done_i = 0;
        S1     = 8'h00;
        S2     = 8'h00;
        S3     = 8'h00;
        S4     = 8'h00;
        S5     = 8'h00;
        S6     = 8'h00;
        S7     = 8'h00;
        S8     = 8'h0;
        S9     = 8'h0;
        S10    = 8'h0;
        S11    = 8'h0;
        S12    = 8'h0;
        S13    = 8'h0;
        
        // Apply reset
        #10 rst = 0;
        
        // Test Case 1: Apply some values
        #10;
        done_i = 1;
        
        for (i = 10; i <= 190; i = i + 10) begin
            S1  = i;
            S2  = i;
            S3  = i;
            S4  = i;
            S5  = i;
            S6  = i;
            S7  = i;
            S8  = i;
            S9  = i;
            S10 = i;
            S11 = i;
            S12 = i;
            S13 = i;
            S14 = i;
            S15 = i;
            S16 = i;
            S17 = i;
            #10;
            
        end
        done_i = 0;
        
        
        #1000;
        $stop;
    end
    
    
    
endmodule
