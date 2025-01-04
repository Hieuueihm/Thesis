module plus_1 #(parameter WIDTH = 10)
               (input rst,
                input clk,
                input en,
                input [WIDTH - 1:0] D,
                output [WIDTH - 1:0] Q);
    
    reg [9:0] counter_value;
    
    dff #(.WIDTH(WIDTH)) PLUS_1_DFF(
    .clk(clk),
    .rst(rst),
    .en(en),
    .D(D + 1'b1),
    .Q(Q)
    );
    
    
    
endmodule
