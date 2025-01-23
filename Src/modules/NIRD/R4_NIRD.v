module R4_NIRD #(parameter COLS = 30,
                 parameter ROWS = 30)
                (input clk,
                 input rst,
                 input [7:0] m_3x3_i,
                 input done_m_3x3_i,
                 input [7:0] m_5x5_i,
                 input done_m_5x5_i,
                 output [3:0] ni_o,
                 output [3:0] rd_o,
                 output done_o,
                 output progress_done_o);
    
    
    wire [7:0] data0_3x3_o, data1_3x3_o, data2_3x3_o, data3_3x3_o, data4_3x3_o, data5_3x3_o, data6_3x3_o, data7_3x3_o, data8_3x3_o;
    wire done_buffer_3x3_o;
    Buffer_8_rows #(.DEPTH(COLS)) BUFFER_8_ROWS_3X3 (
    .clk(clk),
    .rst(rst),
    .done_i(done_m_3x3_i),
    .data_i(m_3x3_i),
    .data0_o(data0_3x3_o),
    .data1_o(data1_3x3_o),
    .data2_o(data2_3x3_o),
    .data3_o(data3_3x3_o),
    .data4_o(data4_3x3_o),
    .data5_o(data5_3x3_o),
    .data6_o(data6_3x3_o),
    .data7_o(data7_3x3_o),
    .data8_o(data8_3x3_o),
    .done_o(done_buffer_3x3_o)
    );
    wire [7:0] data0_5x5_o, data1_5x5_o, data2_5x5_o, data3_5x5_o, data4_5x5_o;
    wire [7:0] data5_5x5_o, data6_5x5_o, data7_5x5_o, data8_5x5_o;
    wire done_buffer_5x5_o;
    Buffer_8_rows #(.DEPTH(COLS)) BUFFER_8_ROWS_5x5 (
    .clk(clk),
    .rst(rst),
    .done_i(done_m_5x5_i),
    .data_i(m_5x5_i),
    .data0_o(data0_5x5_o),
    .data1_o(data1_5x5_o),
    .data2_o(data2_5x5_o),
    .data3_o(data3_5x5_o),
    .data4_o(data4_5x5_o),
    .data5_o(data5_5x5_o),
    .data6_o(data6_5x5_o),
    .data7_o(data7_5x5_o),
    .data8_o(data8_5x5_o),
    .done_o(done_buffer_5x5_o)
    );
    wire done_buffer_3x3_delay;
    wire[7:0] data0_3x3_delay, data1_3x3_delay, data2_3x3_delay, data3_3x3_delay, data4_3x3_delay, data5_3x3_delay;
    wire[7:0] data6_3x3_delay, data7_3x3_delay, data8_3x3_delay;
    
    `define CYCLE_DELAY 12
    
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY))
    SHIFT_DONE_3x3_O (
    .clk(clk),
    .rst(rst),
    .data_i(done_buffer_3x3_o),
    .data_o(done_buffer_3x3_delay)
    );
    
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA0_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data0_3x3_o),
    .data_o(data0_3x3_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA1_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data1_3x3_o),
    .data_o(data1_3x3_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA2_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data2_3x3_o),
    .data_o(data2_3x3_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA3_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data3_3x3_o),
    .data_o(data3_3x3_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA4_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data4_3x3_o),
    .data_o(data4_3x3_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA5_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data5_3x3_o),
    .data_o(data5_3x3_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA6_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data6_3x3_o),
    .data_o(data6_3x3_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA7_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data7_3x3_o),
    .data_o(data7_3x3_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA8_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data8_3x3_o),
    .data_o(data8_3x3_delay)
    );
    
    
    wire [7:0] S1_7x7_o, S2_7x7_o, S3_7x7_o, S4_7x7_o, S5_7x7_o, S6_7x7_o, S7_7x7_o, S8_7x7_o;
    wire [7:0] S9_7x7_o, S10_7x7_o, S11_7x7_o, S12_7x7_o, S13_7x7_o, S14_7x7_o, S15_7x7_o, S16_7x7_o;
    wire [7:0] S17_7x7_o, S18_7x7_o, S19_7x7_o, S20_7x7_o, S21_7x7_o, S22_7x7_o, S23_7x7_o, S24_7x7_o;
    wire [7:0] S25_7x7_o, S26_7x7_o, S27_7x7_o, S28_7x7_o, S29_7x7_o, S30_7x7_o, S31_7x7_o, S32_7x7_o;
    wire [7:0] S33_7x7_o, S34_7x7_o, S35_7x7_o, S36_7x7_o, S37_7x7_o, S38_7x7_o, S39_7x7_o, S40_7x7_o;
    wire [7:0] S41_7x7_o, S42_7x7_o, S43_7x7_o, S44_7x7_o, S45_7x7_o, S46_7x7_o, S47_7x7_o, S48_7x7_o;
    wire [7:0] S49_7x7_o;
    
    wire wdbf_7x7_done;
    wire wdbf_7x7_progress_done;
    Window_buffer_7x7 #(.COLS(COLS), .ROWS(ROWS)) WINDOW_BUFFER_7X7 (
    .clk(clk),
    .rst(rst),
    .done_i(done_buffer_3x3_delay),
    .S1_i(data7_3x3_delay),
    .S2_i(data6_3x3_delay),
    .S3_i(data5_3x3_delay),
    .S4_i(data4_3x3_delay),
    .S5_i(data3_3x3_delay),
    .S6_i(data2_3x3_delay),
    .S7_i(data1_3x3_delay),
    .S1_o(S1_7x7_o),
    .S2_o(S2_7x7_o),
    .S3_o(S3_7x7_o),
    .S4_o(S4_7x7_o),
    .S5_o(S5_7x7_o),
    .S6_o(S6_7x7_o),
    .S7_o(S7_7x7_o),
    .S8_o(S8_7x7_o),
    .S9_o(S9_7x7_o),
    .S10_o(S10_7x7_o),
    .S11_o(S11_7x7_o),
    .S12_o(S12_7x7_o),
    .S13_o(S13_7x7_o),
    .S14_o(S14_7x7_o),
    .S15_o(S15_7x7_o),
    .S16_o(S16_7x7_o),
    .S17_o(S17_7x7_o),
    .S18_o(S18_7x7_o),
    .S19_o(S19_7x7_o),
    .S20_o(S20_7x7_o),
    .S21_o(S21_7x7_o),
    .S22_o(S22_7x7_o),
    .S23_o(S23_7x7_o),
    .S24_o(S24_7x7_o),
    .S25_o(S25_7x7_o),
    .S26_o(S26_7x7_o),
    .S27_o(S27_7x7_o),
    .S28_o(S28_7x7_o),
    .S29_o(S29_7x7_o),
    .S30_o(S30_7x7_o),
    .S31_o(S31_7x7_o),
    .S32_o(S32_7x7_o),
    .S33_o(S33_7x7_o),
    .S34_o(S34_7x7_o),
    .S35_o(S35_7x7_o),
    .S36_o(S36_7x7_o),
    .S37_o(S37_7x7_o),
    .S38_o(S38_7x7_o),
    .S39_o(S39_7x7_o),
    .S40_o(S40_7x7_o),
    .S41_o(S41_7x7_o),
    .S42_o(S42_7x7_o),
    .S43_o(S43_7x7_o),
    .S44_o(S44_7x7_o),
    .S45_o(S45_7x7_o),
    .S46_o(S46_7x7_o),
    .S47_o(S47_7x7_o),
    .S48_o(S48_7x7_o),
    .S49_o(S49_7x7_o),
    .done_o(wdbf_7x7_done),
    .progress_done_o(wdbf_7x7_progress_done)
    );
    
    
    wire [7:0] S1_9x9_o, S2_9x9_o, S3_9x9_o, S4_9x9_o, S5_9x9_o, S6_9x9_o, S7_9x9_o, S8_9x9_o, S9_9x9_o;
    wire [7:0] S10_9x9_o, S11_9x9_o, S12_9x9_o, S13_9x9_o, S14_9x9_o, S15_9x9_o, S16_9x9_o, S17_9x9_o, S18_9x9_o;
    wire [7:0] S19_9x9_o, S20_9x9_o, S21_9x9_o, S22_9x9_o, S23_9x9_o, S24_9x9_o, S25_9x9_o, S26_9x9_o, S27_9x9_o;
    wire [7:0] S28_9x9_o, S29_9x9_o, S30_9x9_o, S31_9x9_o, S32_9x9_o, S33_9x9_o, S34_9x9_o, S35_9x9_o, S36_9x9_o;
    wire [7:0] S37_9x9_o, S38_9x9_o, S39_9x9_o, S40_9x9_o, S41_9x9_o, S42_9x9_o, S43_9x9_o, S44_9x9_o, S45_9x9_o;
    wire [7:0] S46_9x9_o, S47_9x9_o, S48_9x9_o, S49_9x9_o, S50_9x9_o, S51_9x9_o, S52_9x9_o, S53_9x9_o, S54_9x9_o;
    wire [7:0] S55_9x9_o, S56_9x9_o, S57_9x9_o, S58_9x9_o, S59_9x9_o, S60_9x9_o, S61_9x9_o, S62_9x9_o, S63_9x9_o;
    wire [7:0] S64_9x9_o, S65_9x9_o, S66_9x9_o, S67_9x9_o, S68_9x9_o, S69_9x9_o, S70_9x9_o, S71_9x9_o, S72_9x9_o;
    wire [7:0] S73_9x9_o, S74_9x9_o, S75_9x9_o, S76_9x9_o, S77_9x9_o, S78_9x9_o, S79_9x9_o, S80_9x9_o, S81_9x9_o;
    wire wdbf_9x9_done;
    wire wdbf_9x9_progress_done;
    
    Window_buffer_9x9 #(
    .COLS(COLS),
    .ROWS(ROWS)
    ) WINDOW_BUFFER_9X9 (
    .clk             (clk),
    .rst             (rst),
    .done_i          (done_buffer_5x5_o),
    .S1_i            (data8_5x5_o),
    .S2_i            (data7_5x5_o),
    .S3_i            (data6_5x5_o),
    .S4_i            (data5_5x5_o),
    .S5_i            (data4_5x5_o),
    .S6_i            (data3_5x5_o),
    .S7_i            (data2_5x5_o),
    .S8_i            (data1_5x5_o),
    .S9_i            (data0_5x5_o),
    .S1_o            (S1_9x9_o),
    .S2_o            (S2_9x9_o),
    .S3_o            (S3_9x9_o),
    .S4_o            (S4_9x9_o),
    .S5_o            (S5_9x9_o),
    .S6_o            (S6_9x9_o),
    .S7_o            (S7_9x9_o),
    .S8_o            (S8_9x9_o),
    .S9_o            (S9_9x9_o),
    .S10_o           (S10_9x9_o),
    .S11_o           (S11_9x9_o),
    .S12_o           (S12_9x9_o),
    .S13_o           (S13_9x9_o),
    .S14_o           (S14_9x9_o),
    .S15_o           (S15_9x9_o),
    .S16_o           (S16_9x9_o),
    .S17_o           (S17_9x9_o),
    .S18_o           (S18_9x9_o),
    .S19_o           (S19_9x9_o),
    .S20_o           (S20_9x9_o),
    .S21_o           (S21_9x9_o),
    .S22_o           (S22_9x9_o),
    .S23_o           (S23_9x9_o),
    .S24_o           (S24_9x9_o),
    .S25_o           (S25_9x9_o),
    .S26_o           (S26_9x9_o),
    .S27_o           (S27_9x9_o),
    .S28_o           (S28_9x9_o),
    .S29_o           (S29_9x9_o),
    .S30_o           (S30_9x9_o),
    .S31_o           (S31_9x9_o),
    .S32_o           (S32_9x9_o),
    .S33_o           (S33_9x9_o),
    .S34_o           (S34_9x9_o),
    .S35_o           (S35_9x9_o),
    .S36_o           (S36_9x9_o),
    .S37_o           (S37_9x9_o),
    .S38_o           (S38_9x9_o),
    .S39_o           (S39_9x9_o),
    .S40_o           (S40_9x9_o),
    .S41_o           (S41_9x9_o),
    .S42_o           (S42_9x9_o),
    .S43_o           (S43_9x9_o),
    .S44_o           (S44_9x9_o),
    .S45_o           (S45_9x9_o),
    .S46_o           (S46_9x9_o),
    .S47_o           (S47_9x9_o),
    .S48_o           (S48_9x9_o),
    .S49_o           (S49_9x9_o),
    .S50_o           (S50_9x9_o),
    .S51_o           (S51_9x9_o),
    .S52_o           (S52_9x9_o),
    .S53_o           (S53_9x9_o),
    .S54_o           (S54_9x9_o),
    .S55_o           (S55_9x9_o),
    .S56_o           (S56_9x9_o),
    .S57_o           (S57_9x9_o),
    .S58_o           (S58_9x9_o),
    .S59_o           (S59_9x9_o),
    .S60_o           (S60_9x9_o),
    .S61_o           (S61_9x9_o),
    .S62_o           (S62_9x9_o),
    .S63_o           (S63_9x9_o),
    .S64_o           (S64_9x9_o),
    .S65_o           (S65_9x9_o),
    .S66_o           (S66_9x9_o),
    .S67_o           (S67_9x9_o),
    .S68_o           (S68_9x9_o),
    .S69_o           (S69_9x9_o),
    .S70_o           (S70_9x9_o),
    .S71_o           (S71_9x9_o),
    .S72_o           (S72_9x9_o),
    .S73_o           (S73_9x9_o),
    .S74_o           (S74_9x9_o),
    .S75_o           (S75_9x9_o),
    .S76_o           (S76_9x9_o),
    .S77_o           (S77_9x9_o),
    .S78_o           (S78_9x9_o),
    .S79_o           (S79_9x9_o),
    .S80_o           (S80_9x9_o),
    .S81_o           (S81_9x9_o),
    .done_o          (wdbf_9x9_done),
    .progress_done_o (wdbf_9x9_progress_done)
    );
    
    wire [23:0] S1_r3, S2_r3, S3_r3, S4_r3, S5_r3, S6_r3, S7_r3, S8_r3;
    wire done_o_r3;
    
    Interpolation_R_x #(.R(3)) INTERPOLATION_R_3 (
    .clk(clk),
    .rst(rst),
    .progress_done_i(wdbf_9x9_progress_done),
    .done_i(wdbf_9x9_done),
    .S_0_i(S28_7x7_o),
    .S_90_i(S4_7x7_o),
    .S_180_i(S22_7x7_o),
    .S_270_i(S46_7x7_o),
    .S_45_i_1(S6_7x7_o),
    .S_45_i_2(S7_7x7_o),
    .S_45_i_3(S13_7x7_o),
    .S_45_i_4(S14_7x7_o),
    .S_135_i_1(S1_7x7_o),
    .S_135_i_2(S2_7x7_o),
    .S_135_i_3(S8_7x7_o),
    .S_135_i_4(S9_7x7_o),
    .S_225_i_1(S36_7x7_o),
    .S_225_i_2(S37_7x7_o),
    .S_225_i_3(S43_7x7_o),
    .S_225_i_4(S44_7x7_o),
    .S_315_i_1(S41_7x7_o),
    .S_315_i_2(S42_7x7_o),
    .S_315_i_3(S48_7x7_o),
    .S_315_i_4(S49_7x7_o),
    .S1_o(S1_r3),
    .S2_o(S2_r3),
    .S3_o(S3_r3),
    .S4_o(S4_r3),
    .S5_o(S5_r3),
    .S6_o(S6_r3),
    .S7_o(S7_r3),
    .S8_o(S8_r3),
    .done_o(done_o_r3),
    .progress_done_o()
    );
    wire [23:0] S1_r4, S2_r4, S3_r4, S4_r4, S5_r4, S6_r4, S7_r4, S8_r4;
    wire done_o_r4;
    
    wire finish_interpolation;
    Interpolation_R_x #(.R(4)) INTERPOLATION_R_4 (
    .clk(clk),
    .rst(rst),
    .progress_done_i(wdbf_9x9_progress_done),
    .done_i(wdbf_9x9_done),
    .S_0_i(S45_9x9_o),
    .S_90_i(S5_9x9_o),
    .S_180_i(S37_9x9_o),
    .S_270_i(S77_9x9_o),
    .S_45_i_1(S16_9x9_o),
    .S_45_i_2(S17_9x9_o),
    .S_45_i_3(S25_9x9_o),
    .S_45_i_4(S26_9x9_o),
    .S_135_i_1(S11_9x9_o),
    .S_135_i_2(S12_9x9_o),
    .S_135_i_3(S20_9x9_o),
    .S_135_i_4(S21_9x9_o),
    .S_225_i_1(S56_9x9_o),
    .S_225_i_2(S57_9x9_o),
    .S_225_i_3(S65_9x9_o),
    .S_225_i_4(S66_9x9_o),
    .S_315_i_1(S61_9x9_o),
    .S_315_i_2(S62_9x9_o),
    .S_315_i_3(S70_9x9_o),
    .S_315_i_4(S71_9x9_o),
    .S1_o(S1_r4),
    .S2_o(S2_r4),
    .S3_o(S3_r4),
    .S4_o(S4_r4),
    .S5_o(S5_r4),
    .S6_o(S6_r4),
    .S7_o(S7_r4),
    .S8_o(S8_r4),
    .done_o(done_o_r4),
    .progress_done_o(finish_interpolation)
    );
    `define CYCLE_DELAY_NI 1
    
    wire done_inter_r4_delay;
    wire finish_inter_r4_delay;
    wire [23:0] S1_r4_delay, S2_r4_delay, S3_r4_delay, S4_r4_delay, S5_r4_delay, S6_r4_delay, S7_r4_delay, S8_r4_delay;
    
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_FINISH_REGISTER (
    .clk(clk),
    .rst(rst),
    .data_i(finish_interpolation),
    .data_o(finish_inter_r4_delay)
    );
    
    
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_DONE_R4_O (
    .clk(clk),
    .rst(rst),
    .data_i(done_o_r4),
    .data_o(done_inter_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_S1_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S1_r4),
    .data_o(S1_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_S2_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S2_r4),
    .data_o(S2_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_S3_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S3_r4),
    .data_o(S3_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_S4_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S4_r4),
    .data_o(S4_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_S5_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S5_r4),
    .data_o(S5_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_S6_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S6_r4),
    .data_o(S6_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_S7_R4 (
    .clk(clk),
    .rst(rst),
    
    .data_i(S7_r4),
    .data_o(S7_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_S8_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S8_r4),
    .data_o(S8_r4_delay)
    );
    
    
    
    
    
    
    wire [14:0] r4_patch_sum;
    wire patch_sum_done_o;
    wire patch_progress_done;
    R4_patch_sum #(.COLS(COLS),
    .ROWS(ROWS)) R4_PATCH_SUM
    (
    .clk(clk),
    .rst(rst),
    .done_i(done_buffer_5x5_o),
    .S1(data0_5x5_o),
    .S2(data1_5x5_o),
    .S3(data2_5x5_o),
    .S4(data3_5x5_o),
    .S5(data4_5x5_o),
    .S6(data5_5x5_o),
    .S7(data6_5x5_o),
    .S8(data7_5x5_o),
    .S9(data8_5x5_o),
    .sum_o(r4_patch_sum),
    .done_o(patch_sum_done_o),
    .progress_done_o(patch_progress_done));
    
    
    wire rd_r4_done, rd_r4_progress_done, bit1_o, bit2_o, bit3_o, bit4_o, bit5_o, bit6_o, bit7_o, bit8_o;
    RD RD_CALC_R4 (
    .clk(clk),
    .rst(rst),
    .done_i(done_o_r4),
    .progress_done_i(finish_interpolation),
    .S1_r2(S1_r4),
    .S2_r2(S2_r4),
    .S3_r2(S3_r4),
    .S4_r2(S4_r4),
    .S5_r2(S5_r4),
    .S6_r2(S6_r4),
    .S7_r2(S7_r4),
    .S8_r2(S8_r4),
    .S1_r1(S1_r3),
    .S2_r1(S2_r3),
    .S3_r1(S3_r3),
    .S4_r1(S4_r3),
    .S5_r1(S5_r3),
    .S6_r1(S6_r3),
    .S7_r1(S7_r3),
    .S8_r1(S8_r3),
    .done_o(rd_r4_done),
    .progress_done_o(rd_r4_progress_done),
    .bit1_o(bit1_o),
    .bit2_o(bit2_o),
    .bit3_o(bit3_o),
    .bit4_o(bit4_o),
    .bit5_o(bit5_o),
    .bit6_o(bit6_o),
    .bit7_o(bit7_o),
    .bit8_o(bit8_o)
    );
    
    wire rd_done_delay, rd_progress_done_delay;
    wire bit1_delay, bit2_delay, bit3_delay, bit4_delay, bit5_delay, bit6_delay, bit7_delay, bit8_delay;
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_RD_DONE (
    .clk(clk),
    .rst(rst),
    .data_i(rd_r4_done),
    .data_o(rd_done_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_RD_PROGRESS_DONE (
    .clk(clk),
    .rst(rst),
    .data_i(rd_r4_progress_done),
    .data_o(rd_progress_done_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_BIT1 (
    .clk(clk),
    .rst(rst),
    .data_i(bit1_o),
    .data_o(bit1_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_BIT2 (
    .clk(clk),
    .rst(rst),
    .data_i(bit2_o),
    .data_o(bit2_delay)
    );
    
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_BIT3 (
    .clk(clk),
    .rst(rst),
    .data_i(bit3_o),
    .data_o(bit3_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_BIT4 (
    .clk(clk),
    .rst(rst),
    .data_i(bit4_o),
    .data_o(bit4_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_BIT5 (
    .clk(clk),
    .rst(rst),
    .data_i(bit5_o),
    .data_o(bit5_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_BIT6 (
    .clk(clk),
    .rst(rst),
    .data_i(bit6_o),
    .data_o(bit6_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_BIT7 (
    .clk(clk),
    .rst(rst),
    .data_i(bit7_o),
    .data_o(bit7_delay)
    );
    
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_NI))
    SHIFT_BIT8 (
    .clk(clk),
    .rst(rst),
    .data_i(bit8_o),
    .data_o(bit8_delay)
    );
    
    
    
    // wire [7:0] o_test_rd;
    // assign o_test_rd = {bit8_delay, bit7_delay, bit6_delay, bit5_delay, bit4_delay, bit3_delay, bit2_delay, bit1_delay};
    
    
    wire ni_r4_done, ni_r4_progress_done, bit1_o_ni, bit2_o_ni, bit3_o_ni,
    bit4_o_ni, bit5_o_ni, bit6_o_ni, bit7_o_ni, bit8_o_ni;
    NI #(.WIDTH(15), .GAIN(81)) NI_CALC_R4 (
    .clk(clk),
    .rst(rst),
    .done_i(done_inter_r4_delay),
    .progress_done_i(finish_inter_r4_delay),
    .S1_r2(S1_r4_delay),
    .S2_r2(S2_r4_delay),
    .S3_r2(S3_r4_delay),
    .S4_r2(S4_r4_delay),
    .S5_r2(S5_r4_delay),
    .S6_r2(S6_r4_delay),
    .S7_r2(S7_r4_delay),
    .S8_r2(S8_r4_delay),
    .sum_i(r4_patch_sum),
    .done_o(ni_r4_done),
    .progress_done_o(ni_r4_progress_done),
    .bit1_o(bit1_o_ni),
    .bit2_o(bit2_o_ni),
    .bit3_o(bit3_o_ni),
    .bit4_o(bit4_o_ni),
    .bit5_o(bit5_o_ni),
    .bit6_o(bit6_o_ni),
    .bit7_o(bit7_o_ni),
    .bit8_o(bit8_o_ni)
    );
    // wire [7:0] o_test_ni;
    // assign o_test_ni = {bit8_o_ni, bit7_o_ni, bit6_o_ni, bit5_o_ni, bit4_o_ni, bit3_o_ni, bit2_o_ni, bit1_o_ni};
    
    
    riu2_mapping RIU2_RD(
    .clk(clk),
    .rst(rst),
    .done_i(rd_done_delay),
    .progress_done_i(rd_progress_done_delay),
    .bit1_i(bit1_delay),
    .bit2_i(bit2_delay),
    .bit3_i(bit3_delay),
    .bit4_i(bit4_delay),
    .bit5_i(bit5_delay),
    .bit6_i(bit6_delay),
    .bit7_i(bit7_delay),
    .bit8_i(bit8_delay),
    .data_o(rd_o),
    .done_o(done_o),
    .progress_done_o(progress_done_o));
    
    
    riu2_mapping RIU2_NI(
    .clk(clk),
    .rst(rst),
    .done_i(ni_r4_done),
    .progress_done_i(ni_r4_progress_done),
    .bit1_i(bit1_o_ni),
    .bit2_i(bit2_o_ni),
    .bit3_i(bit3_o_ni),
    .bit4_i(bit4_o_ni),
    .bit5_i(bit5_o_ni),
    .bit6_i(bit6_o_ni),
    .bit7_i(bit7_o_ni),
    .bit8_i(bit8_o_ni),
    .data_o(ni_o),
    .done_o(),
    .progress_done_o());
    
    
    
endmodule
