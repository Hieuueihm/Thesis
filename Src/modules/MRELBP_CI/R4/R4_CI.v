module R4_CI(input clk,
             input rst,
             input done_i,
             input [13:0] sum_i,
             input [7:0] central_value,
             output ci_o,
             output reg done_o);
    reg [7:0] muy;
    reg [7:0] r;
    reg [7:0] ths;
    always @(posedge clk) begin
        if (rst) begin
            r      <= 0;
            muy    <= 0;
            done_o <= 0;
            ths    <= 0;
            end else if (done_i) begin
            muy    <= sum_i / 81;
            r      <= sum_i % 81;
            done_o <= done_i;
            ths    <= central_value;
            
            end else begin
            done_o <= 0;
        end
    end
    assign ci_o = (ths > muy || (ths == muy && r == 0)) ? 1'b1 : 1'b0;
    
endmodule
