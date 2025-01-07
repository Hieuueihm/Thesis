module MRELBP_CI_R4 #(parameter COLS = 11,
                      parameter ROWS = 11)
                     (input clk,
                      input rst,
                      input done_i,
                      input [7:0] S1,
                      input [7:0] S2,
                      input [7:0] S3,
                      input [7:0] S4,
                      input [7:0] S5,
                      input [7:0] S6,
                      S7,
                      S8,
                      S9,
                      output ci_o,
                      output progress_done_o,
                      output done_o);
    
    wire cum_en, sum_en, count_en;
    wire [9:0] i_counter;
    wire i_start_gt_2;
    wire ld_en;
    wire start_en;
    wire done_o_sum;
    wire [14:0] sum_o;
    wire [7:0] central_value;
    wire i_row_eq_max;
    
    
    R4_controller #(.COLS(COLS)) R4_CONTROLLER
    
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
    .i_row_eq_max(i_row_eq_max),
    .start_en(start_en),
    .progress_done(progress_done_o)
    
    );
    
    R4_sum #(.COLS(COLS),.ROWS(ROWS)) R4_SUM
    (
    .clk(clk),
    .rst(rst),
    .cum_en(cum_en),
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
    .sum_o(sum_o),
    .i_counter(i_counter),
    .i_row_eq_max(i_row_eq_max),
    .i_start_gt_2(i_start_gt_2),
    .central_value(central_value),
    .start_en(start_en)
    
    
    );
    
    reg [29:0] scale_value;
    reg done_scale;
    reg [14:0] sum_o_delay;
    always @(posedge clk) begin
        if (rst) begin
            done_scale  <= 0;
            scale_value <= 0;
            sum_o_delay <= 0;
            end else begin
            done_scale  <= done_o_sum;
            scale_value <= central_value * 81;
            sum_o_delay <= sum_o;
        end
    end
    
    assign ci_o   = (scale_value < sum_o_delay) ? 1'b0: 1'b1;
    assign done_o = done_scale;
    
endmodule
