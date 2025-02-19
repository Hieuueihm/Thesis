module plus_1 #(parameter WIDTH = 10)
               (input rst_n,
                input clk,
                input en,
                input [WIDTH - 1:0] D,
                output [WIDTH - 1:0] Q);
    
    wire [WIDTH - 1 : 0] d_plus_1;
    assign d_plus_1 = D + 1'b1;
    register #(.WIDTH(WIDTH)) PLUS_1_DFF(
    .clk(clk),
    .rst_n(rst_n),
    .en(en),
    .D(d_plus_1),
    .Q(Q)
    );

    
    
    
    
endmodule
