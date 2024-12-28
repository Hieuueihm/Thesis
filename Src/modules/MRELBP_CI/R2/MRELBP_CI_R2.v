module MRELBP_CI_R2 (input clk,
                     input rst,
                     input done_i,
                     input [7:0] S1,
                     input [7:0] S2,
                     input [7:0] S3,
                     input [7:0] S4,
                     input [7:0] S5,
                     output ci_o,
                     output progress_done_o,
                     output done_o);
    
    wire cum_en, sum_en, count_en, done_delayed;
    wire [9:0] i_counter;
    wire i_start_gt_1;
    wire ld_en;
    wire start_en;
    wire done_o_sum;
    wire [12:0] sum_o;
    wire [7:0] central_value;
    
    R2_controller #(.COSL(7)) R2_CONTROLLER
    
    (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .i_counter(i_counter),
    .i_start_gt_1(i_start_gt_1),
    .ld_en(ld_en),
    .cum_en(cum_en),
    .done_o(done_o_sum),
    .sum_en(sum_en),
    .count_en(count_en),
    .done_delayed(done_delayed),
    .start_en(start_en),
    .progress_done(progress_done_o)
    
    );
    
    R2_sum #(.COLS(7),.ROWS(7)) R2_SUM
    (
    .clk(clk),
    .rst(rst),
    .cum_en(cum_en),
    .done_delayed(done_delayed),
    .count_en(count_en),
    .sum_en(sum_en),
    .ld_en(ld_en),
    .S1(S1),
    .S2(S2),
    .S3(S3),
    .S4(S4),
    .S5(S5),
    .sum_o(sum_o),
    .i_counter(i_counter),
    .i_start_gt_1(i_start_gt_1),
    .central_value(central_value),
    .start_en(start_en)
    
    
    );
    
    R2_CI R2_CI_INSTANCE(
    .clk(clk),
    .rst(rst),
    .done_i(done_o_sum),
    .sum_i(sum_o),
    .central_value(central_value),
    .ci_o(ci_o),
    .done_o(done_o));
    
endmodule
