`timescale 1ns / 1ps

module Serialiser_tb();
    reg clk; reg rst; reg done_i;
    reg [9:0] i_col;
    reg [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9, S10;
    reg [7:0] S11, S12, S13, S14, S15, S16, S17, S18, S19, S20; reg [7:0] S21, S22, S23, S24, S25;
    wire [7:0] S1_o, S2_o, S3_o, S4_o, S5_o; wire done_o; wire [2:0] o_select_o;
    Serialiser uut (.clk(clk), .rst(rst), .done_i(done_i), .i_col(i_col), .S1(S1), .S2(S2), .S3(S3), .S4(S4), .S5(S5), .S6(S6), .S7(S7), .S8(S8), .S9(S9), .S10(S10), .S11(S11), .S12(S12), .S13(S13), .S14(S14), .S15(S15), .S16(S16), .S17(S17), .S18(S18), .S19(S19), .S20(S20), .S21(S21), .S22(S22), .S23(S23), .S24(S24), .S25(S25), .S1_o(S1_o), .S2_o(S2_o), .S3_o(S3_o), .S4_o(S4_o), .S5_o(S5_o), .done_o(done_o), .o_select_o(o_select_o));
    
    // Clock generation
    initial clk   = 0;
    always #5 clk = ~clk; // 100MHz clock
    
    // Test stimulus
    initial begin
        // Initialize inputs
        rst    = 1;
        done_i = 0;
        i_col  = 10'd0;
        S1     = 8'd0; S2     = 8'd0; S3     = 8'd0; S4     = 8'd0; S5     = 8'd0;
        S6     = 8'd0; S7     = 8'd0; S8     = 8'd0; S9     = 8'd0; S10     = 8'd0;
        S11    = 8'd0; S12    = 8'd0; S13    = 8'd0; S14    = 8'd0; S15    = 8'd0;
        S16    = 8'd0; S17    = 8'd0; S18    = 8'd0; S19    = 8'd0; S20    = 8'd0;
        S21    = 8'd0; S22    = 8'd0; S23    = 8'd0; S24    = 8'd0; S25    = 8'd0;
        
        // Apply reset
        #10 rst = 0;
        
        // Apply stimulus
        #10 done_i = 1;
        S1         = 8'd1; S2         = 8'd2; S3         = 8'd3; S4         = 8'd4; S5         = 8'd5;
        S6         = 8'd6; S7         = 8'd7; S8         = 8'd8; S9         = 8'd9; S10         = 8'd10;
        S11        = 8'd11; S12        = 8'd12; S13        = 8'd13; S14        = 8'd14; S15        = 8'd15;
        S16        = 8'd16; S17        = 8'd17; S18        = 8'd18; S19        = 8'd19; S20        = 8'd20;
        S21        = 8'd21; S22        = 8'd22; S23        = 8'd23; S24        = 8'd24; S25        = 8'd25;
        
        #10;
        i_col = 10'd1;
        S1    = 8'd1; S2    = 8'd2; S3    = 8'd3; S4    = 8'd4; S5    = 8'd12;
        S6    = 8'd6; S7    = 8'd7; S8    = 8'd8; S9    = 8'd9; S10    = 8'd13;
        S11   = 8'd11; S12   = 8'd12; S13   = 8'd13; S14   = 8'd14; S15   = 8'd14;
        S16   = 8'd16; S17   = 8'd17; S18   = 8'd18; S19   = 8'd19; S20   = 8'd100;
        S21   = 8'd21; S22   = 8'd22; S23   = 8'd23; S24   = 8'd24; S25   = 8'd200;
        // Wait for some cycles
        #10;
        i_col = 10'd2;
        S1    = 8'd1; S2    = 8'd2; S3    = 8'd3; S4    = 8'd4; S5    = 8'd3;
        S6    = 8'd6; S7    = 8'd7; S8    = 8'd8; S9    = 8'd9; S10    = 8'd11;
        S11   = 8'd11; S12   = 8'd12; S13   = 8'd13; S14   = 8'd14; S15   = 8'd14;
        S16   = 8'd16; S17   = 8'd17; S18   = 8'd18; S19   = 8'd19; S20   = 8'd10;
        S21   = 8'd21; S22   = 8'd22; S23   = 8'd23; S24   = 8'd24; S25   = 8'd200;
        #10;
        i_col = 10'd3;
        S1    = 8'd1; S2    = 8'd2; S3    = 8'd3; S4    = 8'd4; S5    = 8'd14;
        S6    = 8'd6; S7    = 8'd7; S8    = 8'd8; S9    = 8'd9; S10    = 8'd3;
        S11   = 8'd11; S12   = 8'd12; S13   = 8'd13; S14   = 8'd14; S15   = 8'd19;
        S16   = 8'd16; S17   = 8'd17; S18   = 8'd18; S19   = 8'd19; S20   = 8'd10;
        S21   = 8'd21; S22   = 8'd22; S23   = 8'd23; S24   = 8'd24; S25   = 8'd20;
        #10;
        i_col = 10'd4;
        S1    = 8'd1; S2    = 8'd2; S3    = 8'd3; S4    = 8'd4; S5    = 8'd12;
        S6    = 8'd6; S7    = 8'd7; S8    = 8'd8; S9    = 8'd9; S10    = 8'd13;
        S11   = 8'd11; S12   = 8'd12; S13   = 8'd13; S14   = 8'd14; S15   = 8'd16;
        S16   = 8'd16; S17   = 8'd17; S18   = 8'd18; S19   = 8'd19; S20   = 8'd18;
        S21   = 8'd21; S22   = 8'd22; S23   = 8'd23; S24   = 8'd24; S25   = 8'd22;
        #10;
        i_col = 10'd0;
        S1    = 8'd1; S2    = 8'd2; S3    = 8'd3; S4    = 8'd4; S5    = 8'd19;
        S6    = 8'd6; S7    = 8'd7; S8    = 8'd8; S9    = 8'd9; S10    = 8'd21;
        S11   = 8'd11; S12   = 8'd12; S13   = 8'd13; S14   = 8'd14; S15   = 8'd22;
        S16   = 8'd16; S17   = 8'd17; S18   = 8'd18; S19   = 8'd19; S20   = 8'd32;
        S21   = 8'd21; S22   = 8'd22; S23   = 8'd23; S24   = 8'd24; S25   = 8'd33;
        #10;
        i_col = 10'd1;
        S1    = 8'd1; S2    = 8'd2; S3    = 8'd3; S4    = 8'd4; S5    = 8'd22;
        S6    = 8'd6; S7    = 8'd7; S8    = 8'd8; S9    = 8'd9; S10    = 8'd26;
        S11   = 8'd11; S12   = 8'd12; S13   = 8'd13; S14   = 8'd14; S15   = 8'd22;
        S16   = 8'd16; S17   = 8'd17; S18   = 8'd18; S19   = 8'd19; S20   = 8'd32;
        S21   = 8'd21; S22   = 8'd22; S23   = 8'd23; S24   = 8'd24; S25   = 8'd33;
        #50;
        
        // Observe outputs
        $display("S1_o   = %d, S2_o   = %d, S3_o   = %d, S4_o   = %d, S5_o   = %d", S1_o, S2_o, S3_o, S4_o, S5_o);
        $display("done_o = %b, o_select_o = %b", done_o, o_select_o);
        
        // Add more stimulus if needed
        
        // Finish simulation
        #100 $stop;
    end
    
endmodule
