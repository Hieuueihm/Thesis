module Interpolation_R_x #(parameter R = 2)
                          (input clk,
                           input rst,
                           input [7:0],
                           mid_i,
                           S_0_i,
                           S_90_i,
                           S_180_i,
                           S_270_i,
                           S_45_i_1,
                           S_45_i_2,
                           S_45_i_3,
                           S_45_i_4,
                           S_135_i_1,
                           S_135_i_2,
                           S_135_i_3,
                           S_135_i_4,
                           S_225_i_1,
                           S_225_i_2,
                           S_225_i_3,
                           S_225_i_4,
                           S_315_i_1,
                           S_315_i_2,
                           S_315_i_3,
                           S_315_i_4,
                           output [7:0] S1_o,
                           S2_o,
                           S3_o,
                           S4_o,
                           S5_o,
                           S6_o,
                           S7_o,
                           S8_o,
                           mid_o,
                           output done_o);
    
    
    wire done_45_o, done_135_o, done_225_o, done_315_o;
    // 0 -> 1
    // 45 -> 2
    // 90 -> 3
    // 135 -> 4
    // 180 -> 5
    // 225 -> 6
    // 270 -> 7
    // 315 -> 8
    
    
    generate
    if (R == 2) begin
        Interpolation_calc #(.R(2),
        .RADIUS(45)) INTER_R2_45
        (
        .clk(clk),
        .rst(rst),
        .done_i(done_i),
        .A(S_45_i_1),
        .B(S_45_i_2),
        .C(S_45_i_3),
        .D(S_45_i_4),
        data_o(S2_o),
        done_o(done_45_o));
        
        Interpolation_calc #(.R(2),
        .RADIUS(135)) INTER_R2_135
        (
        .clk(clk),
        .rst(rst),
        .done_i(done_i),
        .A(S_135_i_1),
        .B(S_135_i_2),
        .C(S_135_i_3),
        .D(S_135_i_4),
        data_o(S4_o),
        done_o(done_135_o));
        
        
        
        Interpolation_calc #(.R(2),
        .RADIUS(225)) INTER_R2_225
        (
        .clk(clk),
        .rst(rst),
        .done_i(done_i),
        .A(S_225_i_1),
        .B(S_225_i_2),
        .C(S_225_i_3),
        .D(S_225_i_4),
        data_o(S6_o),
        done_o(done_225_o));
        
        
        Interpolation_calc #(.R(2),
        .RADIUS(315)) INTER_R2_315
        (
        .clk(clk),
        .rst(rst),
        .done_i(done_i),
        .A(S_315_i_1),
        .B(S_315_i_2),
        .C(S_315_i_3),
        .D(S_315_i_4),
        data_o(S7_o),
        done_o(done_315_o));
        
        
        
        end else if (R == 4) begin
        
        
        
        end else if (R == 6) begin
        
        
        end else if (R == 8) begin
        
    end
    
    endgenerate
    
    
endmodule
