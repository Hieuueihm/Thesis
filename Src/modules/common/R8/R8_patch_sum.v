module R8_patch_sum #(parameter COLS = 19,
                      parameter ROWS = 19)
                     (input clk,
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
                      S14,
                      S15,
                      S16,
                      S17,
                      output [16:0] sum_o,     // 0 or 1
                      output done_o,
                      output progress_done_o);
    
    
    
    
    wire cum_en, sum_en, count_en;
    wire [9:0] i_counter;
    wire i_start_gt_3;
    wire ld_en;
    wire start_en;
    wire [7:0] central_value;
    wire i_row_eq_max;
    
    
    R8_controller #(.COLS(COLS)) R8_CONTROLLER
    
    (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .i_counter(i_counter),
    .i_start_gt_3(i_start_gt_3),
    .ld_en(ld_en),
    .cum_en(cum_en),
    .done_o(done_o),
    .sum_en(sum_en),
    .count_en(count_en),
    .start_en(start_en),
    .i_row_eq_max(i_row_eq_max),
    .progress_done(progress_done_o)
    
    );
    
    R8_sum #(.COLS(COLS),.ROWS(ROWS)) R8_SUM
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
    .S10(S10),
    .S11(S11),
    .S12(S12),
    .S13(S13),
    .S14(S14),
    .S15(S15),
    .S16(S16),
    .S17(S17),
    .sum_o(sum_o),
    .i_counter(i_counter),
    .i_start_gt_3(i_start_gt_3),
    .i_row_eq_max(i_row_eq_max),
    .central_value(central_value),
    .start_en(start_en)
    
    
    );
    
    
endmodule
