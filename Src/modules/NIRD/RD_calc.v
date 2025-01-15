module RD_calc(input clk,
               input rst,
               input [23:0] S_r2,
               input [23:0] S_r1,
               input done_i,
               output reg done_o,
               output bit_o);
    
    always @(posedge clk) begin
        if (rst) begin
            done_o <= 1'b0;
            end else begin
            done_o <= done_i;
            
        end
    end
    
    assign bit = (S_r2 < S_r1) ? 1'b0 : 1'b1;
    dff #(.WIDTH(1)) DFF_BIT (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .D(bit),
    .Q(bit_o)
    );
    
    
endmodule
