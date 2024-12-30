module mux_2_1 (input a,
                input b,
                input sel,
                output y);
    assign y = (sel) ? a : b;
    
endmodule
