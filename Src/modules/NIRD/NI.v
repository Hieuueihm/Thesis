module NI #(parameter WIDTH = 10,
            parameter GAIN = 25)
           (input clk,
            input rst,
            input done_i,
            input progress_done_i,
            input [23:0] S1_r2,
            S2_r2,
            S3_r2,
            S4_r2,
            S5_r2,
            S6_r2,
            S7_r2,
            S8_r2,
            input [WIDTH - 1:0] sum_i,
            output done_o,
            output reg progress_done_o,
            output bit1_o,
            bit2_o,
            bit3_o,
            bit4_o,
            bit5_o,
            bit6_o,
            bit7_o,
            bit8_o);
    
    always @(posedge clk) begin
        if (rst) begin
            progress_done_o <= 1'b0;
            end else begin
            progress_done_o <= progress_done_i;
            
        end
    end
    NI_calc #(.WIDTH(WIDTH), .GAIN(GAIN)) NI1(
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .S(S1_r2),
    .sum_i(sum_i),
    .done_o(done_o),
    .bit_o(bit1_o)
    );
    NI_calc #(.WIDTH(WIDTH), .GAIN(GAIN)) NI2(
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .S(S2_r2),
    .sum_i(sum_i),
    .done_o(),
    .bit_o(bit2_o)
    );
    NI_calc #(.WIDTH(WIDTH), .GAIN(GAIN)) NI3(
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .S(S3_r2),
    .sum_i(sum_i),
    .done_o(),
    .bit_o(bit3_o)
    );
    NI_calc #(.WIDTH(WIDTH), .GAIN(GAIN)) NI4(
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .S(S4_r2),
    .sum_i(sum_i),
    .done_o(),
    .bit_o(bit4_o)
    );
    NI_calc #(.WIDTH(WIDTH), .GAIN(GAIN)) NI5(
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .S(S5_r2),
    .sum_i(sum_i),
    .done_o(),
    .bit_o(bit5_o)
    );
    NI_calc #(.WIDTH(WIDTH), .GAIN(GAIN)) NI6(
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .S(S6_r2),
    .sum_i(sum_i),
    .done_o(),
    .bit_o(bit6_o)
    );
    NI_calc #(.WIDTH(WIDTH), .GAIN(GAIN)) NI7(
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .S(S7_r2),
    .sum_i(sum_i),
    .done_o(),
    .bit_o(bit7_o)
    );
    NI_calc #(.WIDTH(WIDTH), .GAIN(GAIN)) NI8(
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .S(S8_r2),
    .sum_i(sum_i),
    .done_o(),
    .bit_o(bit8_o)
    );
    
    
endmodule
