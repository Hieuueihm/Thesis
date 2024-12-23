module bilinear_interpolation (input clk,
                               input rst,
                               input [2:0] r,
                               input [1:0] angle,
                               input [7:0] A,
                               B,
                               C,
                               D,
                               output [7:0] I,
                               output z);
    
    // load 1 - dx, 1 - dy, dx, dy
    // calculate A, B, C, D
    // +
    // 3 clk
    
    wire [15:0] one_minus_dx, one_minus_dy, dx, dy;
    // 2D LUT r angle
    // r 0 -> 7 ->1, 2,3, 4,5 6,7, 8
    // angle 0 -> 3 -> 45, 135, 225, 315
    reg [63:0] lut[0:3][0:3];
    
    reg [7:0] _A, _B, _C, _D;
    assign one_minus_dx = lut[r][angle][63:48];
    assign one_minus_dy = lut[r][angle][47:32];
    assign dx           = lut[r][angle][31:16];
    assign dy           = lut[r][angle][15:0];
    
    reg [31:0] mult_result1, mult_result2, mult_result3, mult_result4;
    
    reg [31:0] product1, product2, product3, product4;
    reg [15:0] final_result;
    
    
    initial begin
        // r = 1
        // a b c
        // d e f
        // g h i -> f c b a d g h i
        // r = 2
        lut[1][0] = {16'h006A, 16'h0096, 16'h0096, 16'h006A};
        lut[1][1] = {16'h006A, 16'h006A, 16'h0096, 16'h0096};
        lut[1][2] = {16'h0096, 16'h006A, 16'h006A, 16'h0096};
        lut[1][3] = {16'h0096, 16'h0096, 16'h006A, 16'h006A};
        // r = 3
        lut[2][0] = {16'h001F, 16'h00E1, 16'h00E1, 16'h001F};
        lut[2][1] = {16'h001F, 16'h001F, 16'h00E1, 16'h00E1};
        lut[2][2] = {16'h00E1, 16'h001F, 16'h001F, 16'h00E1};
        lut[2][3] = {16'h00E1, 16'h00E1, 16'h001F, 16'h001F};
        // R = 4
        lut[3][0] = {16'h00D4, 16'h002C, 16'h002C, 16'h00D4};
        lut[3][1] = {16'h00D4, 16'h00D4, 16'h002C, 16'h002C};
        lut[3][2] = {16'h002C, 16'h00D4, 16'h00D4, 16'h002C};
        lut[3][3] = {16'h002C, 16'h002C, 16'h00D4, 16'h00D4};
        
        // R = 5
        
        lut[4][0] = {16'h0089, 16'h0077, 16'h0077, 16'h0089};
        lut[4][1] = {16'h0089, 16'h0089, 16'h0077, 16'h0077};
        lut[4][2] = {16'h0077, 16'h0089, 16'h0089, 16'h0077};
        lut[4][3] = {16'h0077, 16'h0077, 16'h0089, 16'h0089};
        
        // R = 6
        
        lut[5][0] = {16'h003E, 16'h00C2, 16'h00C2, 16'h003E};
        lut[5][1] = {16'h003E, 16'h003E, 16'h00C2, 16'h00C2};
        lut[5][2] = {16'h00C2, 16'h003E, 16'h003E, 16'h00C2};
        lut[5][3] = {16'h00C2, 16'h00C2, 16'h003E, 16'h003E};
        
        // rg = 7
        
        lut[6][0] = {16'h00F4, 16'h000C, 16'h000C, 16'h00F4};
        lut[6][1] = {16'h00F4, 16'h00F4, 16'h000C, 16'h000C};
        lut[6][2] = {16'h000C, 16'h00F4, 16'h00F4, 16'h000C};
        lut[6][3] = {16'h000C, 16'h000C, 16'h00F4, 16'h00F4};
        // r = 8
        
        lut[7][0] = {16'h00A8, 16'h0058, 16'h0058, 16'h00A8};
        lut[7][1] = {16'h00A8, 16'h00A8, 16'h0058, 16'h0058};
        lut[7][2] = {16'h0058, 16'h00A8, 16'h00A8, 16'h0058};
        lut[7][3] = {16'h0058, 16'h0058, 16'h00A8, 16'h00A8};
    end
    
    // Main interpolation logic
    always @(posedge clk) begin
        if (rst) begin
            mult_result1 <= 32'h0;
            mult_result2 <= 32'h0;
            mult_result3 <= 32'h0;
            mult_result4 <= 32'h0;
            product1     <= 32'h0;
            product2     <= 32'h0;
            product3     <= 32'h0;
            product4     <= 32'h0;
            final_result <= 32'h0;
            _A           <= 0;
            _B           <= 0;
            _C           <= 0;
            _D           <= 0;
            end else begin
            
            
            _A           <= A;
            _B           <= B;
            _C           <= C;
            _D           <= D;
            mult_result1 <= one_minus_dx * one_minus_dy;
            mult_result2 <= dx * one_minus_dy;
            mult_result3 <= dy * one_minus_dx;
            mult_result4 <= dx * dy;
            
            
            
            product1 <= mult_result1[23:8] * {_A, 8'b0};
            product2 <= mult_result2[23:8] * {_B, 8'b0};
            product3 <= mult_result3[23:8] * {_C, 8'b0};
            product4 <= mult_result4[23:8] * {_D, 8'b0};
            
            final_result <= product1[23:8] + product2[23:8] + product3[23:8] + product4[23:8];
            
        end
    end
    assign I = (final_result[7:0] > 8'h80) ? final_result[15:8] + 1 : final_result[15:8];
    assign z = &(~final_result[7:0]);
endmodule
