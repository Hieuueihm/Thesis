module TopModule #(parameter COLS = 30,
                   parameter ROWS = 30)
                  (input clk,
                   input rst,
                   input [7:0] grayscale_i,
                   input done_i);
    
    //    output [15:0] cinird_r2,
    //    output done_r2,
    //    output [15:0] cinidrd_r4,
    //    output done_r4,
    //    output [15:0] cinird_r6,
    //    output done_r6,
    //    output [15:0] cinird_r8,
    //    output done_r8,
    //    output finish
    wire [7:0]done_original_o, data_original_o;
    wire[7:0] m_3x3_o; wire done_m_3x3_o;
    wire [7:0] m_5x5_o; wire done_m_5x5_o;
    wire [7:0] m_7x7_o;wire  done_m_7x7_o;
    wire [7:0] m_9x9_o; wire done_m_9x9_o;
    Median_processing #(.ROWS(ROWS), .COLS(COLS))
    MEDIAN_PROCESSING
    (
    .clk(clk),
    .rst(rst),
    .data_i(grayscale_i),
    .done_i(done_i),
    .data_o(data_original_o),
    .done_o(done_original_o),
    .m_3x3_o(m_3x3_o),
    .done_3x3_o(done_m_3x3_o),
    .m_5x5_o(m_5x5_o),
    .done_5x5_o(done_m_5x5_o),
    .m_7x7_o(m_7x7_o),
    .done_7x7_o(done_m_7x7_o),
    .m_9x9_o(m_9x9_o),
    .done_9x9_o(done_m_9x9_o)
    );
    
    wire ci_r2_o, done_ci_r2, progress_done_ci_r2;
    wire ci_r4_o, done_ci_r4, progress_done_ci_r4;
    wire ci_r6_o, done_ci_r6, progress_done_ci_r6;
    wire ci_r8_o, done_ci_r8, progress_done_ci_r8;
    
    CI_top #(.ROWS(ROWS),
    .COLS(COLS)) CI_TOP
    (
    .clk(clk),
    .rst(rst),
    .m_3x3_i(m_3x3_o),
    .done_i(done_m_3x3_o),
    .ci_r2_o(ci_r2_o),
    .done_r2(done_ci_r2),
    .progress_done_r2(progress_done_ci_r2),
    .ci_r4_o(ci_r4_o),
    .done_r4(done_ci_r4),
    .progress_done_r4(progress_done_ci_r4),
    .ci_r6_o(ci_r6_o),
    .done_r6(done_ci_r6_o),
    .progress_done_r6(progress_done_ci_r6),
    .ci_r8_o(ci_r8_o),
    .done_r8(done_ci_r8),
    .progress_done_r8(progress_done_ci_r8));
    
    
    wire [3:0] ni_o, rd_o;
    wire done_o_nird, progress_done_o_nird;
    R2_NIRD #(.COLS(30),
    .ROWS(30))
    R2_NI_RD
    (
    .clk(clk),
    .rst(rst),
    .m_3x3_i(m_3x3_o),
    .done_m_3x3_i(done_m_3x3_o),
    .data_original_i(data_original_o),
    .done_original_i(done_original_o),
    .ni_o(ni_o),
    .rd_o(rd_o),
    .done_o(done_o_nird),
    .progress_done_o(progress_done_o_nird));
    
    
    wire done_o_ni_rd_delay, progress_done_nird_delay;
    wire [3:0] ni_delay, rd_delay;
    shift_registers #(.WIDTH(1), .CYCLE(12 * COLS - 3))
    SHIFT_DONE_O_delay (
    .clk(clk),
    .rst(rst),
    .data_i(done_o_nird),
    .data_o(done_o_ni_rd_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(12 * COLS - 3))
    SHIFT_finish_O_delay (
    .clk(clk),
    .rst(rst),
    .data_i(progress_done_o_nird),
    .data_o(progress_done_nird_delay)
    );
    shift_registers #(.WIDTH(4), .CYCLE(12 * COLS - 3))
    SHIFT_NI (
    .clk(clk),
    .rst(rst),
    .data_i(ni_o),
    .data_o(ni_delay)
    );
    shift_registers #(.WIDTH(4), .CYCLE(12 * COLS - 3))
    SHIFT_RD (
    .clk(clk),
    .rst(rst),
    .data_i(rd_o),
    .data_o(rd_delay)
    );
    
endmodule
