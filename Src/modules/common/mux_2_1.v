module mux_2_1 #(parameter WIDTH = 1)
                (input [WIDTH - 1 : 0] a,
                 input [WIDTH - 1 : 0] b,
                 input sel,
                 output [WIDTH - 1 : 0] y);
    assign y = (sel) ? a : b;
    
endmodule
