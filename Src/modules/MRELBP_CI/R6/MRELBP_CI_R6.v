module MRELBP_CI_R6 (input clk,
                     input rst,
                     input done_i,
                     input [7:0] S1,
                     input [7:0] S2,
                     input [7:0] S3,
                     input [7:0] S4,
                     input [7:0] S5,
                     input [7:0] S6,
                     input [7:0] S7,
                     input [7:0] S8,
                     input [7:0] S9,
                     input [7:0] S10,
                     input [7:0] S11,
                     input [7:0] S12,
                     input [7:0] S13,
                     output ci_o,             // 0 or 1
                     output reg done_o,
                     output progress_done_o);
    
    
    `define DEPTH 15
    
    wire cum_en, sum_en, count_en, done_delayed;
    wire [9:0] i_counter;
    wire i_start_gt_2;
    wire ld_en;
    wire start_en;
    wire done_o_sum, done_o_mean;
    wire [15:0] sum_o;
    wire [7:0] central_value;
    
    
    wire [7:0] muy;
    wire [7:0] r;
    
    R6_controller #(.COLS(`DEPTH)) R6_CONTROLLER
    
    (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .i_counter(i_counter),
    .i_start_gt_2(i_start_gt_2),
    .ld_en(ld_en),
    .cum_en(cum_en),
    .done_o(done_o_sum),
    .sum_en(sum_en),
    .count_en(count_en),
    .done_delayed(done_delayed),
    .start_en(start_en),
    .progress_done(progress_done_o)
    
    );
    
    R6_sum #(.COLS(`DEPTH),.ROWS(`DEPTH)) R6_SUM
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
    .S6(S6),
    .S7(S7),
    .S8(S8),
    .S9(S9),
    .S10(S10),
    .S11(S11),
    .S12(S12),
    .S13(S13),
    .sum_o(sum_o),
    .i_counter(i_counter),
    .i_start_gt_2(i_start_gt_2),
    .central_value(central_value),
    .start_en(start_en)
    
    
    );
    
    R6_mean R6_MEAN_INSTANCE(
    .clk(clk),
    .rst(rst),
    .done_i(done_o_sum),
    .sum_i(sum_o),
    .muy(muy),
    .r(r),
    .done_o(done_o_mean));
    always @(posedge clk) begin
        if (rst) begin
            done_o <= 0;
            end else if (done_o_mean) begin
            done_o <= done_o_mean;
        end
        else begin
            done_o <= 0;
        end
    end
    
    assign ci_o = (central_value > muy || (central_value == muy && r == 0)) ? 1'b1 : 1'b0;
    
endmodule
