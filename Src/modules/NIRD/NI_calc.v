module NI_calc #(parameter WIDTH = 10,
                 parameter GAIN = 25)
                (input clk,
                 input rst,
                 input [23:0] S,
                 input [WIDTH - 1:0] sum_i,
                 input done_i,
                 output reg done_o,
                 output bit_o);
    reg [16+WIDTH - 1:0] scaled_S_r2;
    always @(posedge clk) begin
        if (rst) begin
            done_o <= 1'b0;
            end else begin
            done_o <= done_i;
            
        end
    end
    
    
    
    
    always @(posedge clk) begin
        if (rst) begin
            scaled_S_r2 <= 0;
            end else if (done_i) begin
            scaled_S_r2 <= S * GAIN;
        end
    end
    
    wire [WIDTH - 1 : 0] sum_delay;
    dff #(.WIDTH(WIDTH)) DFF_SUM(
    .clk(clk),
    .rst(rst),
    .en(done_i),
    .D(sum_i),
    .Q(sum_delay)
    );
    assign compare_result = (scaled_S_r2[16 + WIDTH - 1 : 16] < sum_delay) ? 1'b0 : 1'b1;
    
    
    assign bit_o = compare_result;
    
    
    
    
    
endmodule
