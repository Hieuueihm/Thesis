module sum #(parameter WIDTH = 8)
            (input clk,
             input rst_n,
             input [WIDTH-1:0] a,
             input [WIDTH-1:0] b,
             input en,
             output [WIDTH:0] result);
    
    
    wire [WIDTH:0] sum;
    assign sum = a + b;
    dff #(.WIDTH(WIDTH + 1)) SUM_DFF (
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .D(sum),
    .Q(result)
    );
    
    
endmodule
