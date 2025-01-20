module Interpolation_R_x #(parameter R = 2)
                          (input clk,
                           input rst,
                           input done_i,
                           input progress_done_i,
                           input [7:0] S_0_i,
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
                           output [23:0] S1_o,
                           S2_o,
                           S3_o,
                           S4_o,
                           S5_o,
                           S6_o,
                           S7_o,
                           S8_o,
                           output done_o,
                           output progress_done_o);
    
    
    // 0 -> 1
    // 45 -> 2
    // 90 -> 3
    // 135 -> 4
    // 180 -> 5
    // 225 -> 6
    // 270 -> 7
    // 315 -> 8
    
    
    generate
    if (R == 1) begin: R1_LOGIC
    reg [7:0] S2_shift_1, S2_shift_2, S2_shift_3;
    reg [7:0] S4_shift_1, S4_shift_2, S4_shift_3;
    reg [7:0] S6_shift_1, S6_shift_2, S6_shift_3;
    reg [7:0] S8_shift_1, S8_shift_2, S8_shift_3;
    
    
    // S1 = S_0_i
    // S2 = S_45_i_1
    // S3 = S_90_i
    // S4 = S_135_i_1
    // S5 = S_180_i
    // S6 = S_225_i_1
    // S7 = S_270_i
    // S8 = S_315_i_1
    
    // Shift logic for S2
    always @(posedge clk) begin
        if (rst) begin
            S2_shift_1 <= 0;
            S2_shift_2 <= 0;
            S2_shift_3 <= 0;
            end else begin
            S2_shift_1 <= S_45_i_1;
            S2_shift_2 <= S2_shift_1;
            S2_shift_3 <= S2_shift_2;
        end
    end
    assign S2_o = {S2_shift_3, 16'b0};
    
    // Shift logic for S4
    always @(posedge clk) begin
        if (rst) begin
            S4_shift_1 <= 0;
            S4_shift_2 <= 0;
            S4_shift_3 <= 0;
            end else begin
            S4_shift_1 <= S_135_i_1;
            S4_shift_2 <= S4_shift_1;
            S4_shift_3 <= S4_shift_2;
        end
    end
    assign S4_o = {S4_shift_3, 16'b0};
    
    // Shift logic for S6
    always @(posedge clk) begin
        if (rst) begin
            S6_shift_1 <= 0;
            S6_shift_2 <= 0;
            S6_shift_3 <= 0;
            end else begin
            S6_shift_1 <= S_225_i_1;
            S6_shift_2 <= S6_shift_1;
            S6_shift_3 <= S6_shift_2;
        end
    end
    assign S6_o = {S6_shift_3, 16'b0};
    
    
    // Shift logic for S8
    always @(posedge clk) begin
        if (rst) begin
            S8_shift_1 <= 0;
            S8_shift_2 <= 0;
            S8_shift_3 <= 0;
            end else begin
            S8_shift_1 <= S_315_i_1;
            S8_shift_2 <= S8_shift_1;
            S8_shift_3 <= S8_shift_2;
        end
    end
    assign S8_o = {S8_shift_3, 16'b0};
    
    
    end else if (R > 1) begin
    // same time
    
    Interpolation_calc #(.R(R),
    .RADIUS(45)) INTER_R2_45
    (
    .clk(clk),
    .rst(rst),
    .A(S_45_i_1),
    .B(S_45_i_2),
    .C(S_45_i_3),
    .D(S_45_i_4),
    .data_o(S2_o));
    
    Interpolation_calc #(.R(R), .RADIUS(135)) INTER_R2_135
    (
    .clk(clk),
    .rst(rst),
    .A(S_135_i_1),
    .B(S_135_i_2),
    .C(S_135_i_3),
    .D(S_135_i_4),
    .data_o(S4_o));
    
    
    
    Interpolation_calc #(.R(R),
    .RADIUS(225)) INTER_R2_225
    (
    .clk(clk),
    .rst(rst),
    .A(S_225_i_1),
    .B(S_225_i_2),
    .C(S_225_i_3),
    .D(S_225_i_4),
    .data_o(S6_o));
    
    
    Interpolation_calc #(.R(R),
    .RADIUS(315)) INTER_R2_315
    (
    .clk(clk),
    .rst(rst),
    .A(S_315_i_1),
    .B(S_315_i_2),
    .C(S_315_i_3),
    .D(S_315_i_4),
    .data_o(S8_o));
    
    
    end
    endgenerate
    
    reg [2:0] done_shift;
    always @(posedge clk) begin
        if (rst) begin
            done_shift <= 0;
            end else begin
            done_shift <= {done_shift[1:0], done_i};
            
        end
    end
    
    assign done_o = done_shift[2];
    
    reg [2:0] progress_shift;
    always @(posedge clk) begin
        if (rst) begin
            progress_shift <= 0;
            end else begin
            progress_shift <= {progress_shift[1:0], progress_done_i};
            
        end
    end
    
    assign progress_done_o = progress_shift[2];
    
    reg [7:0] S1_shift_1, S1_shift_2, S1_shift_3;
    reg [7:0] S3_shift_1, S3_shift_2, S3_shift_3;
    reg [7:0] S5_shift_1, S5_shift_2, S5_shift_3;
    reg [7:0] S7_shift_1, S7_shift_2, S7_shift_3;
    always @(posedge clk) begin
        if (rst) begin
            S1_shift_1 <= 0;
            S1_shift_2 <= 0;
            S1_shift_3 <= 0;
            end else begin
            S1_shift_1 <= S_0_i;
            S1_shift_2 <= S1_shift_1;
            S1_shift_3 <= S1_shift_2;
        end
    end
    assign S1_o = {S1_shift_3, 16'b0};
    always @(posedge clk) begin
        if (rst) begin
            S3_shift_1 <= 0;
            S3_shift_2 <= 0;
            S3_shift_3 <= 0;
            end else begin
            S3_shift_1 <= S_90_i;
            S3_shift_2 <= S3_shift_1;
            S3_shift_3 <= S3_shift_2;
        end
    end
    assign S3_o = {S3_shift_3, 16'b0};
    
    always @(posedge clk) begin
        if (rst) begin
            S5_shift_1 <= 0;
            S5_shift_2 <= 0;
            S5_shift_3 <= 0;
            end else begin
            S5_shift_1 <= S_180_i;
            S5_shift_2 <= S5_shift_1;
            S5_shift_3 <= S5_shift_2;
        end
    end
    assign S5_o = {S5_shift_3, 16'b0};
    
    always @(posedge clk) begin
        if (rst) begin
            S7_shift_1 <= 0;
            S7_shift_2 <= 0;
            S7_shift_3 <= 0;
            end else begin
            S7_shift_1 <= S_270_i;
            S7_shift_2 <= S7_shift_1;
            S7_shift_3 <= S7_shift_2;
        end
    end
    assign S7_o = {S7_shift_3, 16'b0};
endmodule
