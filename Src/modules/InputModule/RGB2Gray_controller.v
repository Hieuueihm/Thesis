module RGB2Gray_controller (input clk,
                            input rst,
                            input done_i,
                            output done_o);
    
    wire done_o_1, done_o_2, done_o_3;
    dff #(.WIDTH(1)) RGB_DFF_1(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .D(done_i),
    .Q(done_o_1)
    );
    dff #(.WIDTH(1)) RGB_DFF_1(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .D(done_o_1),
    .Q(done_o_2)
    );
    dff #(.WIDTH(1)) RGB_DFF_1(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .D(done_o_2),
    .Q(done_o_3)
    );
    dff #(.WIDTH(1)) RGB_DFF_1(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .D(done_o_3),
    .Q(done_o)
    );
    
    
endmodule
