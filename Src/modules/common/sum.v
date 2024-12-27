module sum #(parameter WIDTH = 8)
            (input clk,
             input rst,
             input [WIDTH-1:0] a,
             input [WIDTH-1:0] b,
             output reg [WIDTH:0] result);
    
    always @(posedge clk) begin
        if (rst) begin
            result <= 0;
            end else begin
            result <= a + b;
        end
    end
    
endmodule
