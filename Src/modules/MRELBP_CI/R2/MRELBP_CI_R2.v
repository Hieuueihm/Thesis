module MRELBP_CI_R2 (input clk,
                     input rst,
                     input done_i,
                     input [7:0] S1,
                     input [7:0] S2,
                     input [7:0] S3,
                     input [7:0] S4,
                     input [7:0] S5,
                     output [12:0] sum_o,
                     output progressing,
                     output done_o);
    
    wire cum_en, sum_en, count_en, done_delayed;
    wire [9:0] i_counter;
    wire [7:0] central_value;
    wire i_row_eq_0;
    wire i_start_gt_1;
    wire ld_en;
    wire start_en;
    
    R2_controller #(.COSL(7)) R2_CONTROLLER
    
    (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .i_row_eq_0(i_row_eq_0),
    .i_counter(i_counter),
    .i_start_gt_1(i_start_gt_1),
    .ld_en(ld_en),
    .cum_en(cum_en),
    .done_o(done_o),
    .sum_en(sum_en),
    .count_en(count_en),
    .done_delayed(done_delayed),
    .start_en(start_en),
    .progressing(progressing)
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
    .i_row_eq_0(i_row_eq_0),
    .i_counter(i_counter),
    .i_start_gt_1(i_start_gt_1),
    .central_value(central_value),
    .start_en(start_en)
    
    
    );
    
    
endmodule
