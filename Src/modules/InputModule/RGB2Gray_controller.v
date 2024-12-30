module RGB2Gray_controller (input clk,
                            input rst,
                            input done_i,
                            output done_o);
    
    
    dff RGB_DFF_1(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .D(done_i),
    .Q(done_o)
    );
    
endmodule
