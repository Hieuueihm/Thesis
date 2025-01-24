module R6_NIRD #(parameter COLS = 30,
                 parameter ROWS = 30)
                (input clk,
                 input rst,
                 input [7:0] m_5x5_i,
                 input done_m_5x5_i,
                 input [7:0] m_7x7_i,
                 input done_m_7x7_i,
                 output [3:0] ni_o,
                 output [3:0] rd_o,
                 output done_o,
                 output progress_done_o);
    
    
    wire [7:0] data0_5x5_o, data1_5x5_o, data2_5x5_o, data3_5x5_o, data4_5x5_o;
    wire [7:0] data5_5x5_o, data6_5x5_o, data7_5x5_o, data8_5x5_o;
    wire [7:0] data9_5x5_o, data10_5x5_o, data11_5x5_o, data12_5x5_o;
    wire done_buffer_5x5_o;
    Buffer_12_rows #(.DEPTH(COLS)) BUFFER_12_ROWS_5x5 (
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
    .data9_o(data9_5x5_o),
    .data10_o(data10_5x5_o),
    .data11_o(data11_5x5_o),
    .data12_o(data12_5x5_o),
    .done_o(done_buffer_5x5_o)
    );
    wire [7:0] data0_7x7_o, data1_7x7_o, data2_7x7_o, data3_7x7_o;
    wire [7:0] data4_7x7_o;
    wire [7:0] data5_7x7_o, data6_7x7_o, data7_7x7_o, data8_7x7_o;
    wire [7:0] data9_7x7_o, data10_7x7_o, data11_7x7_o, data12_7x7_o;
    
    wire done_buffer_7x7_o;
    Buffer_12_rows #(.DEPTH(COLS)) BUFFER_8_ROWS_7x7 (
    .clk(clk),
    .rst(rst),
    .done_i(done_m_7x7_i),
    .data_i(m_7x7_i),
    .data0_o(data0_7x7_o),
    .data1_o(data1_7x7_o),
    .data2_o(data2_7x7_o),
    .data3_o(data3_7x7_o),
    .data4_o(data4_7x7_o),
    .data5_o(data5_7x7_o),
    .data6_o(data6_7x7_o),
    .data7_o(data7_7x7_o),
    .data8_o(data8_7x7_o),
    .data9_o(data9_7x7_o),
    .data10_o(data10_7x7_o),
    .data11_o(data11_7x7_o),
    .data12_o(data12_7x7_o),
    .done_o(done_buffer_7x7_o)
    );
    wire done_buffer_5x5_delay;
    wire[7:0] data0_5x5_delay, data1_5x5_delay, data2_5x5_delay, data3_5x5_delay, data4_5x5_delay, data5_5x5_delay;
    wire[7:0] data6_5x5_delay, data7_5x5_delay, data8_5x5_delay;
    wire[7:0] data9_5x5_delay, data10_5x5_delay, data11_5x5_delay, data12_5x5_delay;
    
    `define CYCLE_DELAY 26
    
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY))
    SHIFT_DONE_5x5_O (
    .clk(clk),
    .rst(rst),
    .data_i(done_buffer_5x5_o),
    .data_o(done_buffer_5x5_delay)
    );
    
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA0_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data0_5x5_o),
    .data_o(data0_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA1_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data1_5x5_o),
    .data_o(data1_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA2_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data2_5x5_o),
    .data_o(data2_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA3_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data3_5x5_o),
    .data_o(data3_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA4_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data4_5x5_o),
    .data_o(data4_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA5_5x5 (
    .clk(clk),
    .rst(rst),
    
    .data_i(data5_5x5_o),
    .data_o(data5_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA6_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data6_5x5_o),
    .data_o(data6_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA7_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data7_5x5_o),
    
    .data_o(data7_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA8_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data8_5x5_o),
    .data_o(data8_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA9_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data9_5x5_o),
    .data_o(data9_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    
    SHIFT_DATA10_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data10_5x5_o),
    .data_o(data10_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA11_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data11_5x5_o),
    .data_o(data11_5x5_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA12_5x5 (
    .clk(clk),
    .rst(rst),
    .data_i(data12_5x5_o),
    .data_o(data12_5x5_delay)
    );
    
    
    
    wire [7:0] S1_7x7_o, S2_7x7_o, S3_7x7_o, S4_7x7_o, S5_7x7_o, S6_7x7_o, S7_7x7_o, S8_7x7_o;
    wire [7:0] S9_7x7_o, S10_7x7_o, S11_7x7_o, S12_7x7_o, S13_7x7_o, S14_7x7_o, S15_7x7_o, S16_7x7_o;
    wire [7:0] S17_7x7_o, S18_7x7_o, S19_7x7_o, S20_7x7_o, S21_7x7_o, S22_7x7_o, S23_7x7_o, S24_7x7_o;
    wire [7:0] S25_7x7_o, S26_7x7_o, S27_7x7_o, S28_7x7_o, S29_7x7_o, S30_7x7_o, S31_7x7_o, S32_7x7_o;
    wire [7:0] S33_7x7_o, S34_7x7_o, S35_7x7_o, S36_7x7_o, S37_7x7_o, S38_7x7_o, S39_7x7_o, S40_7x7_o;
    wire [7:0] S41_7x7_o, S42_7x7_o, S43_7x7_o, S44_7x7_o, S45_7x7_o, S46_7x7_o, S47_7x7_o, S48_7x7_o;
    wire [7:0] S49_7x7_o, S50_7x7_o, S51_7x7_o, S52_7x7_o, S53_7x7_o, S54_7x7_o, S55_7x7_o, S56_7x7_o;
    wire [7:0] S57_7x7_o, S58_7x7_o, S59_7x7_o, S60_7x7_o, S61_7x7_o, S62_7x7_o, S63_7x7_o, S64_7x7_o;
    wire [7:0] S65_7x7_o, S66_7x7_o, S67_7x7_o, S68_7x7_o, S69_7x7_o, S70_7x7_o, S71_7x7_o, S72_7x7_o;
    wire [7:0] S73_7x7_o, S74_7x7_o, S75_7x7_o, S76_7x7_o, S77_7x7_o, S78_7x7_o, S79_7x7_o, S80_7x7_o;
    wire [7:0] S81_7x7_o, S82_7x7_o, S83_7x7_o, S84_7x7_o, S85_7x7_o, S86_7x7_o, S87_7x7_o, S88_7x7_o;
    wire [7:0] S89_7x7_o, S90_7x7_o, S91_7x7_o, S92_7x7_o, S93_7x7_o, S94_7x7_o, S95_7x7_o, S96_7x7_o;
    wire [7:0] S97_7x7_o, S98_7x7_o, S99_7x7_o, S100_7x7_o, S101_7x7_o, S102_7x7_o, S103_7x7_o, S104_7x7_o;
    wire [7:0] S105_7x7_o, S106_7x7_o, S107_7x7_o, S108_7x7_o, S109_7x7_o, S110_7x7_o, S111_7x7_o, S112_7x7_o;
    wire [7:0] S113_7x7_o, S114_7x7_o, S115_7x7_o, S116_7x7_o, S117_7x7_o, S118_7x7_o, S119_7x7_o, S120_7x7_o;
    wire [7:0] S121_7x7_o;
    
    wire wdbf_11x11_done;
    wire wdbf_11x11_progress_done;
    Window_buffer_11x11 #(.COLS(COLS), .ROWS(ROWS)) WINDOW_BUFFER_11x11 (
    .clk(clk),
    .rst(rst),
    .done_i(done_buffer_5x5_delay),
    .S1_i(data11_5x5_delay),
    .S2_i(data10_5x5_delay),
    .S3_i(data9_5x5_delay),
    .S4_i(data8_5x5_delay),
    .S5_i(data7_5x5_delay),
    .S6_i(data6_5x5_delay),
    .S7_i(data5_5x5_delay),
    .S8_i(data4_5x5_delay),
    .S9_i(data3_5x5_delay),
    .S10_i(data2_5x5_delay),
    .S11_i(data1_5x5_delay),
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
    .S50_o(S50_7x7_o),
    .S51_o(S51_7x7_o),
    .S52_o(S52_7x7_o),
    .S53_o(S53_7x7_o),
    .S54_o(S54_7x7_o),
    .S55_o(S55_7x7_o),
    .S56_o(S56_7x7_o),
    .S57_o(S57_7x7_o),
    .S58_o(S58_7x7_o),
    .S59_o(S59_7x7_o),
    .S60_o(S60_7x7_o),
    .S61_o(S61_7x7_o),
    .S62_o(S62_7x7_o),
    .S63_o(S63_7x7_o),
    .S64_o(S64_7x7_o),
    .S65_o(S65_7x7_o),
    .S66_o(S66_7x7_o),
    .S67_o(S67_7x7_o),
    .S68_o(S68_7x7_o),
    .S69_o(S69_7x7_o),
    .S70_o(S70_7x7_o),
    .S71_o(S71_7x7_o),
    .S72_o(S72_7x7_o),
    .S73_o(S73_7x7_o),
    .S74_o(S74_7x7_o),
    .S75_o(S75_7x7_o),
    .S76_o(S76_7x7_o),
    .S77_o(S77_7x7_o),
    .S78_o(S78_7x7_o),
    .S79_o(S79_7x7_o),
    .S80_o(S80_7x7_o),
    .S81_o(S81_7x7_o),
    .S82_o(S82_7x7_o),
    .S83_o(S83_7x7_o),
    .S84_o(S84_7x7_o),
    .S85_o(S85_7x7_o),
    .S86_o(S86_7x7_o),
    .S87_o(S87_7x7_o),
    .S88_o(S88_7x7_o),
    .S89_o(S89_7x7_o),
    .S90_o(S90_7x7_o),
    .S91_o(S91_7x7_o),
    .S92_o(S92_7x7_o),
    .S93_o(S93_7x7_o),
    .S94_o(S94_7x7_o),
    .S95_o(S95_7x7_o),
    .S96_o(S96_7x7_o),
    .S97_o(S97_7x7_o),
    .S98_o(S98_7x7_o),
    .S99_o(S99_7x7_o),
    .S100_o(S100_7x7_o),
    .S101_o(S101_7x7_o),
    .S102_o(S102_7x7_o),
    .S103_o(S103_7x7_o),
    .S104_o(S104_7x7_o),
    .S105_o(S105_7x7_o),
    .S106_o(S106_7x7_o),
    .S107_o(S107_7x7_o),
    .S108_o(S108_7x7_o),
    .S109_o(S109_7x7_o),
    .S110_o(S110_7x7_o),
    .S111_o(S111_7x7_o),
    .S112_o(S112_7x7_o),
    .S113_o(S113_7x7_o),
    .S114_o(S114_7x7_o),
    .S115_o(S115_7x7_o),
    .S116_o(S116_7x7_o),
    .S117_o(S117_7x7_o),
    .S118_o(S118_7x7_o),
    .S119_o(S119_7x7_o),
    .S120_o(S120_7x7_o),
    .S121_o(S121_7x7_o),
    .done_o(wdbf_11x11_done),
    .progress_done_o(wdbf_11x11_progress_done)
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
    wire [7:0] S82_9x9_o, S83_9x9_o, S84_9x9_o, S85_9x9_o, S86_9x9_o, S87_9x9_o, S88_9x9_o, S89_9x9_o, S90_9x9_o;
    wire [7:0] S91_9x9_o, S92_9x9_o, S93_9x9_o, S94_9x9_o, S95_9x9_o, S96_9x9_o, S97_9x9_o, S98_9x9_o, S99_9x9_o;
    wire [7:0] S100_9x9_o, S101_9x9_o, S102_9x9_o, S103_9x9_o, S104_9x9_o, S105_9x9_o, S106_9x9_o, S107_9x9_o, S108_9x9_o;
    wire [7:0] S109_9x9_o, S110_9x9_o, S111_9x9_o, S112_9x9_o, S113_9x9_o, S114_9x9_o, S115_9x9_o, S116_9x9_o, S117_9x9_o;
    wire [7:0] S118_9x9_o, S119_9x9_o, S120_9x9_o, S121_9x9_o, S122_9x9_o, S123_9x9_o, S124_9x9_o, S125_9x9_o, S126_9x9_o;
    wire [7:0] S127_9x9_o, S128_9x9_o, S129_9x9_o, S130_9x9_o, S131_9x9_o, S132_9x9_o, S133_9x9_o, S134_9x9_o, S135_9x9_o;
    wire [7:0] S136_9x9_o, S137_9x9_o, S138_9x9_o, S139_9x9_o, S140_9x9_o, S141_9x9_o, S142_9x9_o, S143_9x9_o, S144_9x9_o;
    wire [7:0] S145_9x9_o, S146_9x9_o, S147_9x9_o, S148_9x9_o, S149_9x9_o, S150_9x9_o, S151_9x9_o, S152_9x9_o, S153_9x9_o;
    wire [7:0] S154_9x9_o, S155_9x9_o, S156_9x9_o, S157_9x9_o, S158_9x9_o, S159_9x9_o, S160_9x9_o, S161_9x9_o, S162_9x9_o;
    wire [7:0] S163_9x9_o, S164_9x9_o, S165_9x9_o, S166_9x9_o, S167_9x9_o, S168_9x9_o, S169_9x9_o;
    wire wdbf_13x13_done;
    wire wdbf_13x13_progress_done;
    
    Window_buffer_13x13 #(
    .COLS(COLS),
    .ROWS(ROWS)
    ) WINDOW_BUFFER_13x13 (
    .clk             (clk),
    .rst             (rst),
    .done_i          (done_buffer_7x7_o),
    .S1_i            (data12_7x7_o),
    .S2_i            (data11_7x7_o),
    .S3_i            (data10_7x7_o),
    .S4_i            (data9_7x7_o),
    .S5_i            (data8_7x7_o),
    .S6_i            (data7_7x7_o),
    .S7_i            (data6_7x7_o),
    .S8_i            (data5_7x7_o),
    .S9_i            (data4_7x7_o),
    .S10_i(data3_7x7_o),
    .S11_i(data2_7x7_o),
    .S12_i(data1_7x7_o),
    .S13_i(data0_7x7_o),
    
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
    .S82_o           (S82_9x9_o),
    .S83_o           (S83_9x9_o),
    .S84_o           (S84_9x9_o),
    .S85_o           (S85_9x9_o),
    .S86_o           (S86_9x9_o),
    .S87_o           (S87_9x9_o),
    .S88_o           (S88_9x9_o),
    .S89_o           (S89_9x9_o),
    .S90_o           (S90_9x9_o),
    .S91_o           (S91_9x9_o),
    .S92_o           (S92_9x9_o),
    .S93_o           (S93_9x9_o),
    .S94_o           (S94_9x9_o),
    .S95_o           (S95_9x9_o),
    .S96_o           (S96_9x9_o),
    .S97_o           (S97_9x9_o),
    .S98_o           (S98_9x9_o),
    .S99_o           (S99_9x9_o),
    .S100_o          (S100_9x9_o),
    .S101_o          (S101_9x9_o),
    .S102_o          (S102_9x9_o),
    .S103_o          (S103_9x9_o),
    .S104_o          (S104_9x9_o),
    .S105_o          (S105_9x9_o),
    .S106_o          (S106_9x9_o),
    .S107_o          (S107_9x9_o),
    .S108_o          (S108_9x9_o),
    .S109_o          (S109_9x9_o),
    .S110_o          (S110_9x9_o),
    .S111_o          (S111_9x9_o),
    .S112_o          (S112_9x9_o),
    .S113_o          (S113_9x9_o),
    .S114_o          (S114_9x9_o),
    .S115_o          (S115_9x9_o),
    .S116_o          (S116_9x9_o),
    .S117_o          (S117_9x9_o),
    .S118_o          (S118_9x9_o),
    .S119_o          (S119_9x9_o),
    .S120_o          (S120_9x9_o),
    .S121_o          (S121_9x9_o),
    .S122_o          (S122_9x9_o),
    .S123_o          (S123_9x9_o),
    .S124_o          (S124_9x9_o),
    .S125_o          (S125_9x9_o),
    .S126_o          (S126_9x9_o),
    .S127_o          (S127_9x9_o),
    .S128_o          (S128_9x9_o),
    .S129_o          (S129_9x9_o),
    .S130_o          (S130_9x9_o),
    .S131_o          (S131_9x9_o),
    .S132_o          (S132_9x9_o),
    .S133_o          (S133_9x9_o),
    .S134_o          (S134_9x9_o),
    .S135_o          (S135_9x9_o),
    .S136_o          (S136_9x9_o),
    .S137_o          (S137_9x9_o),
    .S138_o          (S138_9x9_o),
    .S139_o          (S139_9x9_o),
    .S140_o          (S140_9x9_o),
    .S141_o          (S141_9x9_o),
    .S142_o          (S142_9x9_o),
    .S143_o          (S143_9x9_o),
    .S144_o          (S144_9x9_o),
    .S145_o          (S145_9x9_o),
    .S146_o          (S146_9x9_o),
    .S147_o          (S147_9x9_o),
    .S148_o          (S148_9x9_o),
    .S149_o          (S149_9x9_o),
    .S150_o          (S150_9x9_o),
    .S151_o          (S151_9x9_o),
    .S152_o          (S152_9x9_o),
    .S153_o          (S153_9x9_o),
    .S154_o          (S154_9x9_o),
    .S155_o          (S155_9x9_o),
    .S156_o          (S156_9x9_o),
    .S157_o          (S157_9x9_o),
    .S158_o          (S158_9x9_o),
    .S159_o          (S159_9x9_o),
    .S160_o          (S160_9x9_o),
    .S161_o          (S161_9x9_o),
    .S162_o          (S162_9x9_o),
    .S163_o          (S163_9x9_o),
    .S164_o          (S164_9x9_o),
    .S165_o          (S165_9x9_o),
    .S166_o          (S166_9x9_o),
    .S167_o          (S167_9x9_o),
    .S168_o          (S168_9x9_o),
    .S169_o          (S169_9x9_o),
    .done_o          (wdbf_13x13_done),
    .progress_done_o (wdbf_13x13_progress_done)
    );
    
    wire [23:0] S1_r3, S2_r3, S3_r3, S4_r3, S5_r3, S6_r3, S7_r3, S8_r3;
    wire done_o_r3;
    
    Interpolation_R_x #(.R(5)) INTERPOLATION_R_5 (
    .clk(clk),
    .rst(rst),
    .progress_done_i(wdbf_13x13_progress_done),
    .done_i(wdbf_13x13_done),
    .S_0_i(S66_7x7_o),
    .S_90_i(S6_7x7_o),
    .S_180_i(S56_7x7_o),
    .S_270_i(S116_7x7_o),
    .S_45_i_1(S20_7x7_o),
    .S_45_i_2(S21_7x7_o),
    .S_45_i_3(S31_7x7_o),
    .S_45_i_4(S32_7x7_o),
    .S_135_i_1(S13_7x7_o),
    .S_135_i_2(S14_7x7_o),
    .S_135_i_3(S24_7x7_o),
    .S_135_i_4(S25_7x7_o),
    .S_225_i_1(S90_7x7_o),
    .S_225_i_2(S91_7x7_o),
    .S_225_i_3(S101_7x7_o),
    .S_225_i_4(S102_7x7_o),
    .S_315_i_1(S97_7x7_o),
    .S_315_i_2(S98_7x7_o),
    .S_315_i_3(S108_7x7_o),
    .S_315_i_4(S109_7x7_o),
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
    Interpolation_R_x #(.R(6)) INTERPOLATION_R_6 (
    .clk(clk),
    .rst(rst),
    .progress_done_i(wdbf_13x13_progress_done),
    .done_i(wdbf_13x13_done),
    .S_0_i(S91_9x9_o),
    .S_90_i(S7_9x9_o),
    .S_180_i(S79_9x9_o),
    .S_270_i(S163_9x9_o),
    .S_45_i_1(S24_9x9_o),
    .S_45_i_2(S25_9x9_o),
    .S_45_i_3(S37_9x9_o),
    .S_45_i_4(S38_9x9_o),
    .S_135_i_1(S15_9x9_o),
    .S_135_i_2(S16_9x9_o),
    .S_135_i_3(S28_9x9_o),
    .S_135_i_4(S29_9x9_o),
    .S_225_i_1(S132_9x9_o),
    .S_225_i_2(S133_9x9_o),
    .S_225_i_3(S145_9x9_o),
    .S_225_i_4(S146_9x9_o),
    .S_315_i_1(S141_9x9_o),
    .S_315_i_2(S142_9x9_o),
    .S_315_i_3(S154_9x9_o),
    .S_315_i_4(S155_9x9_o),
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
    
    
    
    
    wire [15:0] r6_patch_sum;
    wire patch_sum_done_o;
    wire patch_progress_done;
    R6_patch_sum #(.COLS(COLS),
    .ROWS(ROWS)) R6_PATCH_SUM
    (
    .clk(clk),
    .rst(rst),
    .done_i(done_buffer_7x7_o),
    .S1(data0_7x7_o),
    .S2(data1_7x7_o),
    .S3(data2_7x7_o),
    .S4(data3_7x7_o),
    .S5(data4_7x7_o),
    .S6(data5_7x7_o),
    .S7(data6_7x7_o),
    .S8(data7_7x7_o),
    .S9(data8_7x7_o),
    .S10(data9_7x7_o),
    .S11(data10_7x7_o),
    .S12(data11_7x7_o),
    .S13(data12_7x7_o),
    .sum_o(r6_patch_sum),
    .done_o(patch_sum_done_o),
    .progress_done_o(patch_progress_done));
    
    wire [23:0] S1_r4_delay, S2_r4_delay, S3_r4_delay, S4_r4_delay, S5_r4_delay, S6_r4_delay, S7_r4_delay, S8_r4_delay;
    wire done_o_r4_delay;
    wire finish_interpolation_delay;
    shift_registers #(.WIDTH(24), .CYCLE(1)) SHIFT_S1_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S1_r4),
    .data_o(S1_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(1)) SHIFT_S2_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S2_r4),
    .data_o(S2_r4_delay)
    );
    
    shift_registers #(.WIDTH(24), .CYCLE(1)) SHIFT_S3_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S3_r4),
    .data_o(S3_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(1)) SHIFT_S4_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S4_r4),
    .data_o(S4_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(1)) SHIFT_S5_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S5_r4),
    .data_o(S5_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(1)) SHIFT_S6_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S6_r4),
    .data_o(S6_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(1)) SHIFT_S7_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S7_r4),
    .data_o(S7_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(1)) SHIFT_S8_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S8_r4),
    .data_o(S8_r4_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(1)) SHIFT_DONE_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(done_o_r4),
    .data_o(done_o_r4_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(1)) SHIFT_FINISH_INTERPOLATION (
    .clk(clk),
    .rst(rst),
    .data_i(finish_interpolation),
    .data_o(finish_interpolation_delay)
    );
    
    
    
    
    
    
    wire rd_r4_done, rd_r4_progress_done, bit1_o, bit2_o, bit3_o, bit4_o, bit5_o, bit6_o, bit7_o, bit8_o;
    RD RD_CALC_R6 (
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
    `define CYCLE_DELAY_NI 1
    
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
    
    
    wire ni_r4_done, ni_r4_progress_done, bit1_o_ni, bit2_o_ni, bit3_o_ni,
    bit4_o_ni, bit5_o_ni, bit6_o_ni, bit7_o_ni, bit8_o_ni;
    NI #(.WIDTH(16), .GAIN(169)) NI_CALC_R6 (
    .clk(clk),
    .rst(rst),
    .done_i(done_o_r4_delay),
    .progress_done_i(finish_interpolation_delay),
    .S1_r2(S1_r4_delay),
    .S2_r2(S2_r4_delay),
    .S3_r2(S3_r4_delay),
    .S4_r2(S4_r4_delay),
    .S5_r2(S5_r4_delay),
    .S6_r2(S6_r4_delay),
    .S7_r2(S7_r4_delay),
    .S8_r2(S8_r4_delay),
    .sum_i(r6_patch_sum),
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
