`timescale 1ns / 1ps

module MRELBP_CI_R2_tb();
    
    reg clk;
    reg rst;
    reg done_i;
    reg [7:0] S1;
    reg [7:0] S2;
    reg [7:0] S3;
    reg [7:0] S4; reg [7:0] S5;
    wire done_o;
    wire [15:0] bit_one_o, bit_zero_o;
    R2_top DUT (.clk(clk), .rst(rst), .done_i(done_i), .S1(S1), .S2(S2), .S3(S3), .S4(S4), .S5(S5),
    .done_o(done_o), .bit_one_o(bit_one_o), .bit_zero_o(bit_zero_o));
    
    
    // Clock generation
    always #5 clk = ~clk; // 10 ns clock period
    
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
        
        // Apply reset
        #10 rst = 0;
        
        // Test Case 1: Apply some values
        #10;
        done_i = 1;
        S1     = 8'd10;
        S2     = 8'd20;
        S3     = 8'd30;
        S4     = 8'd40;
        S5     = 8'd50;
        #10;
        done_i = 1;
        S1     = 8'd10;
        S2     = 8'd10;
        S3     = 8'd10;
        S4     = 8'd10;
        S5     = 8'd10;
        #10;
        done_i = 1;
        S1     = 8'd20;
        S2     = 8'd20;
        S3     = 8'd20;
        S4     = 8'd20;
        S5     = 8'd20;
        #10;
        done_i = 1;
        S1     = 8'd30;
        S2     = 8'd30;
        S3     = 8'd30;
        S4     = 8'd30;
        S5     = 8'd30;
        #10;
        done_i = 1;
        S1     = 8'd40;
        S2     = 8'd40;
        S3     = 8'd40;
        S4     = 8'd40;
        S5     = 8'd40;
        #10;
        done_i = 1;
        S1     = 8'd50;
        S2     = 8'd50;
        S3     = 8'd50;
        S4     = 8'd50;
        S5     = 8'd50;
        #10;
        done_i = 1;
        S1     = 8'd60;
        S2     = 8'd60;
        S3     = 8'd60;
        S4     = 8'd60;
        S5     = 8'd60;
        #10;
        S1 = 8'd10;
        S2 = 8'd20;
        S3 = 8'd30;
        S4 = 8'd40;
        S5 = 8'd50;
        #10;
        done_i = 1;
        S1     = 8'd10;
        S2     = 8'd10;
        S3     = 8'd10;
        S4     = 8'd10;
        S5     = 8'd10;
        #10;
        done_i = 1;
        S1     = 8'd20;
        S2     = 8'd20;
        S3     = 8'd20;
        S4     = 8'd20;
        S5     = 8'd20;
        #10;
        done_i = 1;
        S1     = 8'd30;
        S2     = 8'd30;
        S3     = 8'd30;
        S4     = 8'd30;
        S5     = 8'd30;
        #10;
        done_i = 1;
        S1     = 8'd40;
        S2     = 8'd40;
        S3     = 8'd40;
        S4     = 8'd40;
        S5     = 8'd40;
        #10;
        done_i = 1;
        S1     = 8'd50;
        S2     = 8'd50;
        S3     = 8'd50;
        S4     = 8'd50;
        S5     = 8'd50;
        #10;
        done_i = 1;
        S1     = 8'd60;
        S2     = 8'd60;
        S3     = 8'd60;
        S4     = 8'd60;
        S5     = 8'd60;
        #10;
        S1 = 8'd10;
        S2 = 8'd10;
        S3 = 8'd10;
        S4 = 8'd10;
        S5 = 8'd10;
        #10;
        done_i = 1;
        S1     = 8'd20;
        S2     = 8'd20;
        S3     = 8'd20;
        S4     = 8'd20;
        S5     = 8'd20;
        #10;
        done_i = 1;
        S1     = 8'd30;
        S2     = 8'd30;
        S3     = 8'd30;
        S4     = 8'd30;
        S5     = 8'd30;
        #10;
        done_i = 1;
        S1     = 8'd40;
        S2     = 8'd40;
        S3     = 8'd40;
        S4     = 8'd40;
        S5     = 8'd40;
        #10;
        done_i = 1;
        S1     = 8'd50;
        S2     = 8'd50;
        S3     = 8'd50;
        S4     = 8'd50;
        S5     = 8'd50;
        #10;
        done_i = 1;
        S1     = 8'd60;
        S2     = 8'd60;
        S3     = 8'd60;
        S4     = 8'd60;
        S5     = 8'd60;
        #10;
        done_i = 1;
        S1     = 8'd70;
        S2     = 8'd70;
        S3     = 8'd70;
        S4     = 8'd70;
        S5     = 8'd70;
        #10;
        done_i = 0;
        
        
        #1000;
        $stop;
    end
    
    
    
endmodule
