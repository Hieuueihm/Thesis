module Zero_one_counter(input clk,
                        input rst,
                        input done_i,
                        input data_i,
                        input progress_done_i,
                        output [9:0] bit_one_o,
                        output [9:0] bit_zero_o,
                        output done_o);
    
    
    // bit one
    
    wire [9:0] mux_1;
    wire [10:0] sum_1_result;
    
    assign mux_1 = (rst == 1'b1) ? 10'b0 : sum_1_result[9:0];
    sum #(.WIDTH(10)) SUM1(
    .clk(clk),
    .rst(rst),
    .a(mux_1),
    .b(10'b1),
    .en(data_i & done_i),
    .result(sum_1_result)
    );
    
    assign bit_one_o = sum_1_result[9:0];
    
    // bit zero
    wire [9:0] mux_2;
    wire [10:0] sum_2_result;
    
    assign mux_2 = (rst == 1'b1) ? 10'b0 : sum_2_result[9:0];
    
    assign bit_zero_o = sum_2_result[9:0];
    
    sum #(.WIDTH(10))  SUM2 (
    .clk(clk),
    .rst(rst),
    .a(mux_2),
    .b(10'b1),
    .en(~data_i & done_i),
    .result(bit_zero_o)
    );
    
    
    dff #(.WIDTH(1)) DONE_DFF(
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .D(progress_done_i),
    .Q(done_o)
    );
    
    
endmodule
