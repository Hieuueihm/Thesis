module Data_modulate_7x7_controller (input rst_n,
                                     input clk,
                                     input done_i,
                                     input [2:0] i_counter, // 8
                                     input done_reg,
                                     output done_o,
                                     output o_en,
                                     output start);
    wire o_en_r = (i_counter == 4 && done_reg == 0) ? 1 : 0;
    assign o_en = o_en_r;
    dff #(.WIDTH(1)) DFF_DONE(
        .clk(clk),
        .rst_n(rst_n),
        .D(o_en_r),
        .Q(done_o)
    );
    assign start  = done_i;
    
    
endmodule
