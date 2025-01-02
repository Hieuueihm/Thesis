module R8_top #(parameter COLS = 19,
                parameter ROWS = 19)
               (input clk,
                input rst,
                input done_i,
                input [7:0] S1,
                input [7:0] S2,
                input [7:0] S3,
                input [7:0] S4,
                input [7:0] S5,
                S6,
                S7,
                S8,
                S9,
                S10,
                S11,
                S12,
                S13,
                S14,
                S15,
                S16,
                S17,
                output done_o,
                output [15:0] bit_one_o,
                output [15:0] bit_zero_o);
    
    wire done_o_R8, progress_done_o;
    wire ci_o;
    MRELBP_CI_R8  #(.COLS(COLS), .ROWS(ROWS)) CI_R8(
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
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
    .ci_o(ci_o),
    .progress_done_o(progress_done_o),
    .done_o(done_o_R8));
    
    Zero_one_counter CI_COUNTER_R8(
    .clk(clk),
    .rst(rst),
    .done_i(done_o_R8),
    .data_i(ci_o),
    .progress_done_i(progress_done_o),
    .bit_one_o(bit_one_o),
    .bit_zero_o(bit_zero_o),
    .done_o(done_o));
    
    
endmodule
