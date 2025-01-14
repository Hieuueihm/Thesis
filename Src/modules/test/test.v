module test(input clk,
            input rst,
            input [7:0] grayscale_i,
            input done_i);
    
    wire done_original_o;
    wire [7:0] data_o;
    wire done_3x3_o;
    wire [7:0] m_3x3_o;
    
    Median_processing #(.ROWS(30), .COLS(30))
    MEDIAN_PROCESSING
    (
    .clk(clk),
    .rst(rst),
    .data_i(grayscale_i),
    .done_i(done_i),
    .data_o(data_o),
    .done_o(done_original_o),
    .m_3x3_o(m_3x3_o),
    .done_3x3_o(done_3x3_o),
    .m_5x5_o(),
    .done_5x5_o(),
    .m_7x7_o(),
    .done_7x7_o(),
    .m_9x9_o(),
    .done_9x9_o()
    );
    
    wire [7:0] data0_3x3_o, data1_3x3_o, data2_3x3_o, data3_3x3_o, data4_3x3_o;
    wire done_buffer_3x3_o;
    Buffer_4_rows #(.DEPTH(30)) BUFFER_4_ROWS_3X3 (
    .clk(clk),
    .rst(rst),
    .done_i(done_3x3_o),
    .data_i(m_3x3_o),
    .data0_o(data0_3x3_o),
    .data1_o(data1_3x3_o),
    .data2_o(data2_3x3_o),
    .data3_o(data3_3x3_o),
    .data4_o(data4_3x3_o),
    .done_o(done_buffer_3x3_o)
    );
    
    wire [7:0] S1_o, S2_o, S3_o, S4_o, S5_o, S6_o, S7_o, S8_o, S9_o, S10_o, S11_o, S12_o, S13_o;
    wire [7:0] S14_o, S15_o, S16_o, S17_o, S18_o, S19_o, S20_o, S21_o, S22_o, S23_o, S24_o, S25_o;
    wire window_buffer_5x5_done_o;
    wire window_buffer_5x5_progress_done_o;
    
    wire [7:0] data0_o, data1_o, data2_o, data3_o, data4_o;
    wire done_o;
    Buffer_4_rows #(.DEPTH(30)) BUFFER_4_ROWS (
    .clk(clk),
    .rst(rst),
    .done_i(done_original_o),
    .data_i(data_o),
    .data0_o(data0_o),
    .data1_o(data1_o),
    .data2_o(data2_o),
    .data3_o(data3_o),
    .data4_o(data4_o),
    .done_o(done_o)
    );
    
    wire [7:0] data0_delay, data1_delay, data2_delay, data3_delay, data4_delay;
    
    
    shift_registers #(.WIDTH(1), .CYCLE(7))
    SHIFT_5_DONE_O (
    .clk(clk),
    .rst(rst),
    .data_i(done_o),
    .data_o(done_o_delay)
    );
    
    shift_registers #(.WIDTH(8), .CYCLE(7))
    SHIFT_5_DATA0 (
    .clk(clk),
    .rst(rst),
    .data_i(data0_o),
    .data_o(data0_delay)
    );
    
    shift_registers #(.WIDTH(8), .CYCLE(7))
    SHIFT_5_DATA1 (
    .clk(clk),
    .rst(rst),
    .data_i(data1_o),
    .data_o(data1_delay)
    );
    
    
    shift_registers #(.WIDTH(8), .CYCLE(7))
    SHIFT_5_DATA2 (
    .clk(clk),
    .rst(rst),
    .data_i(data2_o),
    .data_o(data2_delay)
    );
    
    
    shift_registers #(.WIDTH(8), .CYCLE(7))
    SHIFT_5_DATA3 (
    .clk(clk),
    .rst(rst),
    .data_i(data3_o),
    .data_o(data3_delay)
    );
    
    shift_registers #(.WIDTH(8), .CYCLE(7))
    SHIFT_5_DATA4 (
    .clk(clk),
    .rst(rst),
    .data_i(data4_o),
    .data_o(data4_delay)
    );
    
    wire [7:0] S1_o_3x3, S2_o_3x3, S3_o_3x3, S4_o_3x3, S5_o_3x3, S6_o_3x3, S7_o_3x3, S8_o_3x3, S9_o_3x3;
    wire window_3x3_done_o;
    wire window_3x3_progress_done_o;
    
    // Instantiate the Unit Under Test (UUT)
    
    Window_buffer_5x5 #(.COLS(30), .ROWS(30)) WINDOW_BUFFER_5x5 (
    .clk(clk),
    .rst(rst),
    .done_i(done_buffer_3x3_o),
    .S1_i(data4_3x3_o),
    .S2_i(data3_3x3_o),
    .S3_i(data2_3x3_o),
    .S4_i(data1_3x3_o),
    .S5_i(data0_3x3_o),
    .S1_o(S1_o),
    .S2_o(S2_o),
    .S3_o(S3_o),
    .S4_o(S4_o),
    .S5_o(S5_o),
    .S6_o(S6_o),
    .S7_o(S7_o),
    .S8_o(S8_o),
    .S9_o(S9_o),
    .S10_o(S10_o),
    .S11_o(S11_o),
    .S12_o(S12_o),
    .S13_o(S13_o),
    .S14_o(S14_o),
    .S15_o(S15_o),
    .S16_o(S16_o),
    .S17_o(S17_o),
    .S18_o(S18_o),
    .S19_o(S19_o),
    .S20_o(S20_o),
    .S21_o(S21_o),
    .S22_o(S22_o),
    .S23_o(S23_o),
    .S24_o(S24_o),
    .S25_o(S25_o),
    .done_o(window_buffer_5x5_done_o),
    .progress_done_o(window_buffer_5x5_progress_done_o)
    );
    Window_buffer_3x3 #(.COLS(30), .ROWS(30)) WINDOW_BUFFER_3X3 (
    .clk(clk),
    .rst(rst),
    .done_i(done_o_delay),
    .S1_i(data3_delay),
    .S2_i(data2_delay),
    .S3_i(data1_delay),
    .S1_o(S1_o_3x3),
    .S2_o(S2_o_3x3),
    .S3_o(S3_o_3x3),
    .S4_o(S4_o_3x3),
    .S5_o(S5_o_3x3),
    .S6_o(S6_o_3x3),
    .S7_o(S7_o_3x3),
    .S8_o(S8_o_3x3),
    .S9_o(S9_o_3x3),
    .done_o(window_3x3_done_o),
    .progress_done_o(window_3x3_progress_done_o)
    );
    
    wire [7:0] S1_r1, S2_r1, S3_r1, S4_r1, S5_r1, S6_r1, S7_r1, S8_r1;
    wire done_o_r1;
    wire done_inter;
    
    Interpolation_R_x #(.R(1)) INTERPOLATION_R_1 (
    .clk(clk),
    .rst(rst),
    .progress_done_i(window_buffer_5x5_progress_done_o),
    .done_i(window_buffer_5x5_done_o),
    .S_0_i(S6_o_3x3),
    .S_90_i(S2_o_3x3),
    .S_180_i(S4_o_3x3),
    .S_270_i(S8_o_3x3),
    .S_45_i_1(S3_o_3x3),
    .S_45_i_2(),
    .S_45_i_3(),
    .S_45_i_4(),
    .S_135_i_1(S1_o_3x3),
    .S_135_i_2(),
    .S_135_i_3(),
    .S_135_i_4(),
    .S_225_i_1(S7_o_3x3),
    .S_225_i_2(),
    .S_225_i_3(),
    .S_225_i_4(),
    .S_315_i_1(S9_o_3x3),
    .S_315_i_2(),
    .S_315_i_3(),
    .S_315_i_4(),
    .S1_o(S1_r1),
    .S2_o(S2_r1),
    .S3_o(S3_r1),
    .S4_o(S4_r1),
    .S5_o(S5_r1),
    .S6_o(S6_r1),
    .S7_o(S7_r1),
    .S8_o(S8_r1),
    .done_o(done_o_r1),
    .progress_done_o()
    );
    wire [7:0] S1_r2, S2_r2, S3_r2, S4_r2, S5_r2, S6_r2, S7_r2, S8_r2;
    wire done_o_r2;
    
    Interpolation_R_x #(.R(2)) INTERPOLATION_R_2 (
    .clk(clk),
    .rst(rst),
    .progress_done_i(window_buffer_5x5_progress_done_o),
    .done_i(window_buffer_5x5_done_o),
    .S_0_i(S15_o),
    .S_90_i(S3_o),
    .S_180_i(S11_o),
    .S_270_i(S23_o),
    .S_45_i_1(S4_o),
    .S_45_i_2(S5_o),
    .S_45_i_3(S9_o),
    .S_45_i_4(S10_o),
    .S_135_i_1(S1_o),
    .S_135_i_2(S2_o),
    .S_135_i_3(S6_o),
    .S_135_i_4(S7_o),
    .S_225_i_1(S16_o),
    .S_225_i_2(S17_o),
    .S_225_i_3(S21_o),
    .S_225_i_4(S22_o),
    .S_315_i_1(S19_o),
    .S_315_i_2(S20_o),
    .S_315_i_3(S24_o),
    .S_315_i_4(S25_o),
    .S1_o(S1_r2),
    .S2_o(S2_r2),
    .S3_o(S3_r2),
    .S4_o(S4_r2),
    .S5_o(S5_r2),
    .S6_o(S6_r2),
    .S7_o(S7_r2),
    .S8_o(S8_r2),
    .done_o(done_o_r2),
    .progress_done_o(done_inter)
    );
    
    
endmodule
