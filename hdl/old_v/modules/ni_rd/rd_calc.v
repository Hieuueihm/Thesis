module rd_calc(input clk,
               input rst_n,
               input [23:0] S_r2,
               input [23:0] S_r1,
               input done_i,
               output reg done_o,
               output bit_o);
    
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            done_o <= 1'b0;
            end else begin
            done_o <= done_i;
            
        end
    end
    
    assign bit = (S_r2 < S_r1) ? 1'b0 : 1'b1;
    register #(.WIDTH(1)) register_BIT (
    .clk(clk),
    .rst_n(rst_n),
    .D(bit),
    .Q(bit_o)
    );
    
    
endmodule
