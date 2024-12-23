module Serialiser_datapath (input clk,
                            input rst,
                            input [7:0] S1,
                            S2,
                            S3,
                            S4,
                            S5,
                            S6,
                            S7,
                            S8,
                            S9,
                            S10,
                            S11,
                            S12,
                            S13,
                            S14,
                            S15,
                            S16,
                            S17,
                            S18,
                            S19,
                            S20,
                            S21,
                            S22,
                            S23,
                            S24,
                            S25,
                            input [2:0] o_select,
                            output reg [7:0] S1_o,
                            S2_o,
                            S3_o,
                            S4_o,
                            S5_o);
    
    reg [7:0] st0_S1, st0_S2, st0_S3, st0_S4, st0_S5;
    reg [7:0] st0_S6, st0_S7, st0_S8, st0_S9, st0_S10;
    reg [7:0] st0_S11, st0_S12, st0_S13, st0_S14, st0_S15;
    reg [7:0] st0_S16, st0_S17, st0_S18, st0_S19, st0_S20;
    reg [7:0]  st0_S21, st0_S22, st0_S23, st0_S24, st0_S25;
    
    reg [7:0] st1_S2, st1_S3, st1_S4, st1_S5,
    st1_S7, st1_S8, st1_S9, st1_S10,
    st1_S12, st1_S13, st1_S14, st1_S15,
    st1_S17, st1_S18, st1_S19, st1_S20,
    st1_S22, st1_S23, st1_S24, st1_S25;
    
    reg [7:0] st2_S3,
    st2_S4,
    st2_S5,
    st2_S8,
    st2_S9,
    st2_S10,
    st2_S13,
    st2_S14,
    st2_S15,
    st2_S18,
    st2_S19,
    st2_S20,
    st2_S23,
    st2_S24,
    st2_S25;
    
    reg [7:0] st3_S4,
    st3_S5,
    st3_S9,
    st3_S10,
    st3_S14,
    st3_S15,
    st3_S19,
    st3_S20,
    st3_S24,
    st3_S25;
    
    
    reg [7:0] st4_S5,
    st4_S10,
    st4_S15,
    st4_S20,
    st4_S25;
    always @(posedge clk) begin
        if (rst) begin
            
            st0_S1  <= 8'd0;
            st0_S2  <= 8'd0;
            st0_S3  <= 8'd0;
            st0_S4  <= 8'd0;
            st0_S5  <= 8'd0;
            st0_S6  <= 8'd0;
            st0_S7  <= 8'd0;
            st0_S8  <= 8'd0;
            st0_S9  <= 8'd0;
            st0_S10 <= 8'd0;
            st0_S11 <= 8'd0;
            st0_S12 <= 8'd0;
            st0_S13 <= 8'd0;
            st0_S14 <= 8'd0;
            st0_S15 <= 8'd0;
            st0_S16 <= 8'd0;
            st0_S17 <= 8'd0;
            st0_S18 <= 8'd0;
            st0_S19 <= 8'd0;
            st0_S20 <= 8'd0;
            st0_S21 <= 8'd0;
            st0_S22 <= 8'd0;
            st0_S23 <= 8'd0;
            st0_S24 <= 8'd0;
            st0_S25 <= 8'd0;
            
            st1_S2  <= 8'd0;
            st1_S3  <= 8'd0;
            st1_S4  <= 8'd0;
            st1_S5  <= 8'd0;
            st1_S7  <= 8'd0;
            st1_S8  <= 8'd0;
            st1_S9  <= 8'd0;
            st1_S10 <= 8'd0;
            st1_S12 <= 8'd0;
            st1_S13 <= 8'd0;
            st1_S14 <= 8'd0;
            st1_S15 <= 8'd0;
            st1_S17 <= 8'd0;
            st1_S18 <= 8'd0;
            st1_S19 <= 8'd0;
            st1_S20 <= 8'd0;
            st1_S22 <= 8'd0;
            st1_S23 <= 8'd0;
            st1_S24 <= 8'd0;
            st1_S25 <= 8'd0;
            
            
            
            
            st2_S3  <= 0;
            st2_S4  <= 0;
            st2_S5  <= 0;
            st2_S8  <= 0;
            st2_S9  <= 0;
            st2_S10 <= 0;
            st2_S13 <= 0;
            st2_S14 <= 0;
            st2_S15 <= 0;
            st2_S18 <= 0;
            st2_S19 <= 0;
            st2_S20 <= 0;
            st2_S23 <= 0;
            st2_S24 <= 0;
            st2_S25 <= 0;
            
            
            
            st3_S4  <= 0;
            st3_S5  <= 0;
            st3_S9  <= 0;
            st3_S10 <= 0;
            st3_S14 <= 0;
            st3_S15 <= 0;
            st3_S19 <= 0;
            st3_S20 <= 0;
            st3_S24 <= 0;
            st3_S25 <= 0;
            
            
            st4_S5  <= 0;
            st4_S10 <= 0;
            st4_S15 <= 0;
            st4_S20 <= 0;
            st4_S25 <= 0;
            end else begin
            
            
            st0_S1  <= S1;
            st0_S2  <= S2;
            st0_S3  <= S3;
            st0_S4  <= S4;
            st0_S5  <= S5;
            st0_S6  <= S6;
            st0_S7  <= S7;
            st0_S8  <= S8;
            st0_S9  <= S9;
            st0_S10 <= S10;
            st0_S11 <= S11;
            st0_S12 <= S12;
            st0_S13 <= S13;
            st0_S14 <= S14;
            st0_S15 <= S15;
            st0_S16 <= S16;
            st0_S17 <= S17;
            st0_S18 <= S18;
            st0_S19 <= S19;
            st0_S20 <= S20;
            st0_S21 <= S21;
            st0_S22 <= S22;
            st0_S23 <= S23;
            st0_S24 <= S24;
            st0_S25 <= S25;
            
            st1_S2  <= S2;
            st1_S3  <= S3;
            st1_S4  <= S4;
            st1_S5  <= S5;
            st1_S7  <= S7;
            st1_S8  <= S8;
            st1_S9  <= S9;
            st1_S10 <= S10;
            st1_S12 <= S12;
            st1_S13 <= S13;
            st1_S14 <= S14;
            st1_S15 <= S15;
            st1_S17 <= S17;
            st1_S18 <= S18;
            st1_S19 <= S19;
            st1_S20 <= S20;
            st1_S22 <= S22;
            st1_S23 <= S23;
            st1_S24 <= S24;
            st1_S25 <= S25;
            
            
            st2_S3  <= st1_S3;
            st2_S4  <= st1_S4;
            st2_S5  <= st1_S5;
            st2_S8  <= st1_S8;
            st2_S9  <= st1_S9;
            st2_S10 <= st1_S10;
            st2_S13 <= st1_S13;
            st2_S14 <= st1_S14;
            st2_S15 <= st1_S15;
            st2_S18 <= st1_S18;
            st2_S19 <= st1_S19;
            st2_S20 <= st1_S20;
            st2_S23 <= st1_S23;
            st2_S24 <= st1_S24;
            st2_S25 <= st1_S25;
            
            
            
            st3_S4  <= st2_S4;
            st3_S5  <= st2_S5;
            st3_S9  <= st2_S9;
            st3_S10 <= st2_S10;
            st3_S14 <= st2_S14;
            st3_S15 <= st2_S15;
            st3_S19 <= st2_S19;
            st3_S20 <= st2_S20;
            st3_S24 <= st2_S24;
            st3_S25 <= st2_S25;
            
            
            st4_S5  <= st3_S5;
            st4_S10 <= st3_S10;
            st4_S15 <= st3_S15;
            st4_S20 <= st3_S20;
            st4_S25 <= st3_S25;
            
        end
    end
    
    always @(*) begin
        case (o_select)
            3'd0:
            begin
                S1_o <= S1;
                S2_o <= S6;
                S3_o <= S11;
                S4_o <= S16;
                S5_o <= S21;
            end
            3'd1: begin
                S1_o <= st0_S2;
                S2_o <= st0_S7;
                S3_o <= st0_S12;
                S4_o <= st0_S17;
                S5_o <= st0_S22;
            end
            3'd2: begin
                S1_o <= st1_S3;
                S2_o <= st1_S8;
                S3_o <= st1_S13;
                S4_o <= st1_S18;
                S5_o <= st1_S23;
            end
            3'd3: begin
                S1_o <= st2_S4;
                S2_o <= st2_S9;
                S3_o <= st2_S14;
                S4_o <= st2_S19;
                S5_o <= st2_S24;
            end
            3'd4:begin
                S1_o <= st3_S5;
                S2_o <= st3_S10;
                S3_o <= st3_S15;
                S4_o <= st3_S20;
                S5_o <= st3_S25;
            end
            3'd5:begin
                S1_o <= st4_S5;
                S2_o <= st4_S10;
                S3_o <= st4_S15;
                S4_o <= st4_S20;
                S5_o <= st4_S25;
            end
            3'd6:begin
                S1_o <= st4_S5;
                S2_o <= st4_S10;
                S3_o <= st4_S15;
                S4_o <= st4_S20;
                S5_o <= st4_S25;
            end
            
            default: begin
                S1_o <= 0;
                S2_o <= 0;
                S3_o <= 0;
                S4_o <= 0;
                S5_o <= 0;
                
            end
            
        endcase
    end
    
    
endmodule
