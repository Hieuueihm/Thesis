module sum #(parameter WIDTH = 8)
            (input clk,
             input rst,
             input [WIDTH-1:0] a,
             input [WIDTH-1:0] b,
             input en,
             output [WIDTH:0] result);
    
    
    wire [WIDTH:0] sum;
    assign sum = a + b;
    dff #(.WIDTH(WIDTH + 1)) SUM_DFF (
    .clk(clk),
    .rst(rst),
    .en(en),
    .D(sum),
    .Q(result)
    );
    
    
endmodule
