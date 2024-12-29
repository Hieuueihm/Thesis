module R2_mean(input clk,
               input rst,
               input done_i,
               input [12:0] sum_i,
               output reg [7:0] muy,
               output reg [7:0] r,
               output reg done_o);
    
    always @(posedge clk) begin
        if (rst) begin
            r      <= 0;
            muy    <= 0;
            done_o <= 0;
            end else if (done_i) begin
            muy    <= sum_i / 25;
            r      <= sum_i % 25;
            done_o <= done_i;
            end else begin
            done_o <= 0;
        end
    end
    
endmodule
