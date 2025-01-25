module test_r8 #(parameter COLS = 30,
                 parameter ROWS = 30)
                (input clk,
                 input rst,
                 input [7:0] grayscale_i,
                 input done_i);
    
    wire done_original_o;
    wire [7:0] data_o;
    wire done_3x3_o;
    wire [7:0] m_3x3_o;
    wire [7:0] m_5x5_o;
    wire done_5x5_o;
    wire [7:0] m_7x7_o;
    wire done_7x7_o;
    wire [7:0] m_9x9_o;
    wire done_9x9_o;
    
    Median_processing #(.ROWS(ROWS), .COLS(COLS))
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
    .m_5x5_o(m_5x5_o),
    .done_5x5_o(done_5x5_o),
    .m_7x7_o(m_7x7_o),
    .done_7x7_o(done_7x7_o),
    .m_9x9_o(m_9x9_o),
    .done_9x9_o(done_9x9_o)
    );
    
    wire [7:0] data0_7x7_o, data1_7x7_o, data2_7x7_o, data3_7x7_o, data4_7x7_o;
    wire [7:0] data5_7x7_o, data6_7x7_o, data7_7x7_o, data8_7x7_o;
    wire [7:0] data9_7x7_o, data10_7x7_o, data11_7x7_o, data12_7x7_o;
    wire [7:0] data13_7x7_o, data14_7x7_o, data15_7x7_o, data16_7x7_o;
    wire done_buffer_7x7_o;
    Buffer_16_rows #(.DEPTH(COLS)) BUFFER_16_ROWS_7x7 (
    .clk(clk),
    .rst(rst),
    .done_i(done_7x7_o),
    .data_i(m_7x7_o),
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
    .data13_o(data13_7x7_o),
    .data14_o(data14_7x7_o),
    .data15_o(data15_7x7_o),
    .data16_o(data16_7x7_o),
    .done_o(done_buffer_7x7_o)
    );
    wire [7:0] data0_9x9_o, data1_9x9_o, data2_9x9_o, data3_9x9_o;
    wire [7:0] data4_9x9_o;
    wire [7:0] data5_9x9_o, data6_9x9_o, data7_9x9_o, data8_9x9_o;
    wire [7:0] data9_9x9_o, data10_9x9_o, data11_9x9_o, data12_9x9_o;
    wire [7:0] data13_9x9_o, data14_9x9_o, data15_9x9_o, data16_9x9_o;
    
    wire done_buffer_9x9_o;
    Buffer_16_rows #(.DEPTH(COLS)) BUFFER_16_ROWS_9x9 (
    .clk(clk),
    .rst(rst),
    .done_i(done_9x9_o),
    .data_i(m_9x9_o),
    .data0_o(data0_9x9_o),
    .data1_o(data1_9x9_o),
    .data2_o(data2_9x9_o),
    .data3_o(data3_9x9_o),
    .data4_o(data4_9x9_o),
    .data5_o(data5_9x9_o),
    .data6_o(data6_9x9_o),
    .data7_o(data7_9x9_o),
    .data8_o(data8_9x9_o),
    .data9_o(data9_9x9_o),
    .data10_o(data10_9x9_o),
    .data11_o(data11_9x9_o),
    .data12_o(data12_9x9_o),
    .data13_o(data13_9x9_o),
    .data14_o(data14_9x9_o),
    .data15_o(data15_9x9_o),
    .data16_o(data16_9x9_o),
    .done_o(done_buffer_9x9_o)
    );
    wire done_buffer_7x7_delay;
    wire[7:0] data0_7x7_delay, data1_7x7_delay, data2_7x7_delay, data3_7x7_delay, data4_7x7_delay, data5_7x7_delay;
    wire[7:0] data6_7x7_delay, data7_7x7_delay, data8_7x7_delay;
    wire[7:0] data9_7x7_delay, data10_7x7_delay, data11_7x7_delay, data12_7x7_delay;
    wire [7:0] data13_7x7_delay, data14_7x7_delay, data15_7x7_delay, data16_7x7_delay;
    
    `define CYCLE_DELAY 54
    
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY))
    SHIFT_DONE_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(done_buffer_7x7_o),
    .data_o(done_buffer_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA0_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data0_7x7_o),
    .data_o(data0_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA1_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data1_7x7_o),
    .data_o(data1_7x7_delay)
    );
    
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA2_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data2_7x7_o),
    .data_o(data2_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA3_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data3_7x7_o),
    .data_o(data3_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA4_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data4_7x7_o),
    .data_o(data4_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA5_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data5_7x7_o),
    .data_o(data5_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA6_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data6_7x7_o),
    .data_o(data6_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA7_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data7_7x7_o),
    .data_o(data7_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA8_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data8_7x7_o),
    .data_o(data8_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA9_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data9_7x7_o),
    .data_o(data9_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA10_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data10_7x7_o),
    .data_o(data10_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA11_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data11_7x7_o),
    .data_o(data11_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA12_7x7_O (
    
    .clk(clk),
    .rst(rst),
    .data_i(data12_7x7_o),
    .data_o(data12_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA13_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data13_7x7_o),
    .data_o(data13_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA14_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data14_7x7_o),
    .data_o(data14_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA15_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data15_7x7_o),
    .data_o(data15_7x7_delay)
    );
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA16_7x7_O (
    .clk(clk),
    .rst(rst),
    .data_i(data16_7x7_o),
    .data_o(data16_7x7_delay)
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
    wire [7:0] S121_7x7_o, S122_7x7_o, S123_7x7_o, S124_7x7_o, S125_7x7_o, S126_7x7_o, S127_7x7_o, S128_7x7_o;
    wire [7:0] S129_7x7_o, S130_7x7_o, S131_7x7_o, S132_7x7_o, S133_7x7_o, S134_7x7_o, S135_7x7_o, S136_7x7_o;
    wire [7:0] S137_7x7_o, S138_7x7_o, S139_7x7_o, S140_7x7_o, S141_7x7_o, S142_7x7_o, S143_7x7_o, S144_7x7_o;
    wire [7:0] S145_7x7_o, S146_7x7_o, S147_7x7_o, S148_7x7_o, S149_7x7_o, S150_7x7_o, S151_7x7_o, S152_7x7_o;
    wire [7:0] S153_7x7_o, S154_7x7_o, S155_7x7_o, S156_7x7_o, S157_7x7_o, S158_7x7_o, S159_7x7_o, S160_7x7_o;
    wire [7:0] S161_7x7_o, S162_7x7_o, S163_7x7_o, S164_7x7_o, S165_7x7_o, S166_7x7_o, S167_7x7_o, S168_7x7_o;
    wire [7:0] S169_7x7_o, S170_7x7_o, S171_7x7_o, S172_7x7_o, S173_7x7_o, S174_7x7_o, S175_7x7_o, S176_7x7_o;
    wire [7:0] S177_7x7_o, S178_7x7_o, S179_7x7_o, S180_7x7_o, S181_7x7_o, S182_7x7_o, S183_7x7_o, S184_7x7_o;
    wire [7:0] S185_7x7_o, S186_7x7_o, S187_7x7_o, S188_7x7_o, S189_7x7_o, S190_7x7_o, S191_7x7_o, S192_7x7_o;
    wire [7:0] S193_7x7_o, S194_7x7_o, S195_7x7_o, S196_7x7_o, S197_7x7_o, S198_7x7_o, S199_7x7_o, S200_7x7_o;
    wire [7:0] S201_7x7_o, S202_7x7_o, S203_7x7_o, S204_7x7_o, S205_7x7_o, S206_7x7_o, S207_7x7_o, S208_7x7_o;
    wire [7:0] S209_7x7_o, S210_7x7_o, S211_7x7_o, S212_7x7_o, S213_7x7_o, S214_7x7_o, S215_7x7_o, S216_7x7_o;
    wire [7:0] S217_7x7_o, S218_7x7_o, S219_7x7_o, S220_7x7_o, S221_7x7_o, S222_7x7_o, S223_7x7_o, S224_7x7_o;
    wire [7:0] S225_7x7_o;
    
    wire wdbf_15x15_done;
    wire wdbf_15x15_progress_done;
    Window_buffer_15x15 #(
    .COLS(COLS),
    .ROWS(ROWS)
    ) inst_Window_buffer_15x15_7x7 (
    .clk             (clk),
    .rst             (rst),
    .done_i          (done_buffer_7x7_delay),
    .S1_i            (data15_7x7_delay),
    .S2_i            (data14_7x7_delay),
    .S3_i            (data13_7x7_delay),
    .S4_i            (data12_7x7_delay),
    .S5_i            (data11_7x7_delay),
    .S6_i            (data10_7x7_delay),
    .S7_i            (data9_7x7_delay),
    .S8_i            (data8_7x7_delay),
    .S9_i            (data7_7x7_delay),
    .S10_i           (data6_7x7_delay),
    .S11_i           (data5_7x7_delay),
    .S12_i           (data4_7x7_delay),
    .S13_i           (data3_7x7_delay),
    .S14_i           (data2_7x7_delay),
    .S15_i           (data1_7x7_delay),
    .S1_o            (S1_7x7_o),
    .S2_o            (S2_7x7_o),
    .S3_o            (S3_7x7_o),
    .S4_o            (S4_7x7_o),
    .S5_o            (S5_7x7_o),
    .S6_o            (S6_7x7_o),
    .S7_o            (S7_7x7_o),
    .S8_o            (S8_7x7_o),
    .S9_o            (S9_7x7_o),
    .S10_o           (S10_7x7_o),
    .S11_o           (S11_7x7_o),
    .S12_o           (S12_7x7_o),
    .S13_o           (S13_7x7_o),
    .S14_o           (S14_7x7_o),
    .S15_o           (S15_7x7_o),
    .S16_o           (S16_7x7_o),
    .S17_o           (S17_7x7_o),
    .S18_o           (S18_7x7_o),
    .S19_o           (S19_7x7_o),
    .S20_o           (S20_7x7_o),
    .S21_o           (S21_7x7_o),
    .S22_o           (S22_7x7_o),
    .S23_o           (S23_7x7_o),
    .S24_o           (S24_7x7_o),
    .S25_o           (S25_7x7_o),
    .S26_o           (S26_7x7_o),
    .S27_o           (S27_7x7_o),
    .S28_o           (S28_7x7_o),
    .S29_o           (S29_7x7_o),
    .S30_o           (S30_7x7_o),
    .S31_o           (S31_7x7_o),
    .S32_o           (S32_7x7_o),
    .S33_o           (S33_7x7_o),
    .S34_o           (S34_7x7_o),
    .S35_o           (S35_7x7_o),
    .S36_o           (S36_7x7_o),
    .S37_o           (S37_7x7_o),
    .S38_o           (S38_7x7_o),
    .S39_o           (S39_7x7_o),
    .S40_o           (S40_7x7_o),
    .S41_o           (S41_7x7_o),
    .S42_o           (S42_7x7_o),
    .S43_o           (S43_7x7_o),
    .S44_o           (S44_7x7_o),
    .S45_o           (S45_7x7_o),
    .S46_o           (S46_7x7_o),
    .S47_o           (S47_7x7_o),
    .S48_o           (S48_7x7_o),
    .S49_o           (S49_7x7_o),
    .S50_o           (S50_7x7_o),
    .S51_o           (S51_7x7_o),
    .S52_o           (S52_7x7_o),
    .S53_o           (S53_7x7_o),
    .S54_o           (S54_7x7_o),
    .S55_o           (S55_7x7_o),
    .S56_o           (S56_7x7_o),
    .S57_o           (S57_7x7_o),
    .S58_o           (S58_7x7_o),
    .S59_o           (S59_7x7_o),
    .S60_o           (S60_7x7_o),
    .S61_o           (S61_7x7_o),
    .S62_o           (S62_7x7_o),
    .S63_o           (S63_7x7_o),
    .S64_o           (S64_7x7_o),
    .S65_o           (S65_7x7_o),
    .S66_o           (S66_7x7_o),
    .S67_o           (S67_7x7_o),
    .S68_o           (S68_7x7_o),
    .S69_o           (S69_7x7_o),
    .S70_o           (S70_7x7_o),
    .S71_o           (S71_7x7_o),
    .S72_o           (S72_7x7_o),
    .S73_o           (S73_7x7_o),
    .S74_o           (S74_7x7_o),
    .S75_o           (S75_7x7_o),
    .S76_o           (S76_7x7_o),
    .S77_o           (S77_7x7_o),
    .S78_o           (S78_7x7_o),
    .S79_o           (S79_7x7_o),
    .S80_o           (S80_7x7_o),
    .S81_o           (S81_7x7_o),
    .S82_o           (S82_7x7_o),
    .S83_o           (S83_7x7_o),
    .S84_o           (S84_7x7_o),
    .S85_o           (S85_7x7_o),
    .S86_o           (S86_7x7_o),
    .S87_o           (S87_7x7_o),
    .S88_o           (S88_7x7_o),
    .S89_o           (S89_7x7_o),
    .S90_o           (S90_7x7_o),
    .S91_o           (S91_7x7_o),
    .S92_o           (S92_7x7_o),
    .S93_o           (S93_7x7_o),
    .S94_o           (S94_7x7_o),
    .S95_o           (S95_7x7_o),
    .S96_o           (S96_7x7_o),
    .S97_o           (S97_7x7_o),
    .S98_o           (S98_7x7_o),
    .S99_o           (S99_7x7_o),
    .S100_o          (S100_7x7_o),
    .S101_o          (S101_7x7_o),
    .S102_o          (S102_7x7_o),
    .S103_o          (S103_7x7_o),
    .S104_o          (S104_7x7_o),
    .S105_o          (S105_7x7_o),
    .S106_o          (S106_7x7_o),
    .S107_o          (S107_7x7_o),
    .S108_o          (S108_7x7_o),
    .S109_o          (S109_7x7_o),
    .S110_o          (S110_7x7_o),
    .S111_o          (S111_7x7_o),
    .S112_o          (S112_7x7_o),
    .S113_o          (S113_7x7_o),
    .S114_o          (S114_7x7_o),
    .S115_o          (S115_7x7_o),
    .S116_o          (S116_7x7_o),
    .S117_o          (S117_7x7_o),
    .S118_o          (S118_7x7_o),
    .S119_o          (S119_7x7_o),
    .S120_o          (S120_7x7_o),
    .S121_o          (S121_7x7_o),
    .S122_o          (S122_7x7_o),
    .S123_o          (S123_7x7_o),
    .S124_o          (S124_7x7_o),
    .S125_o          (S125_7x7_o),
    .S126_o          (S126_7x7_o),
    .S127_o          (S127_7x7_o),
    .S128_o          (S128_7x7_o),
    .S129_o          (S129_7x7_o),
    .S130_o          (S130_7x7_o),
    .S131_o          (S131_7x7_o),
    .S132_o          (S132_7x7_o),
    .S133_o          (S133_7x7_o),
    .S134_o          (S134_7x7_o),
    .S135_o          (S135_7x7_o),
    .S136_o          (S136_7x7_o),
    .S137_o          (S137_7x7_o),
    .S138_o          (S138_7x7_o),
    .S139_o          (S139_7x7_o),
    .S140_o          (S140_7x7_o),
    .S141_o          (S141_7x7_o),
    .S142_o          (S142_7x7_o),
    .S143_o          (S143_7x7_o),
    .S144_o          (S144_7x7_o),
    .S145_o          (S145_7x7_o),
    .S146_o          (S146_7x7_o),
    .S147_o          (S147_7x7_o),
    .S148_o          (S148_7x7_o),
    .S149_o          (S149_7x7_o),
    .S150_o          (S150_7x7_o),
    .S151_o          (S151_7x7_o),
    .S152_o          (S152_7x7_o),
    .S153_o          (S153_7x7_o),
    .S154_o          (S154_7x7_o),
    .S155_o          (S155_7x7_o),
    .S156_o          (S156_7x7_o),
    .S157_o          (S157_7x7_o),
    .S158_o          (S158_7x7_o),
    .S159_o          (S159_7x7_o),
    .S160_o          (S160_7x7_o),
    .S161_o          (S161_7x7_o),
    .S162_o          (S162_7x7_o),
    .S163_o          (S163_7x7_o),
    .S164_o          (S164_7x7_o),
    .S165_o          (S165_7x7_o),
    .S166_o          (S166_7x7_o),
    .S167_o          (S167_7x7_o),
    .S168_o          (S168_7x7_o),
    .S169_o          (S169_7x7_o),
    .S170_o          (S170_7x7_o),
    .S171_o          (S171_7x7_o),
    .S172_o          (S172_7x7_o),
    .S173_o          (S173_7x7_o),
    .S174_o          (S174_7x7_o),
    .S175_o          (S175_7x7_o),
    .S176_o          (S176_7x7_o),
    .S177_o          (S177_7x7_o),
    .S178_o          (S178_7x7_o),
    .S179_o          (S179_7x7_o),
    .S180_o          (S180_7x7_o),
    .S181_o          (S181_7x7_o),
    .S182_o          (S182_7x7_o),
    .S183_o          (S183_7x7_o),
    .S184_o          (S184_7x7_o),
    .S185_o          (S185_7x7_o),
    .S186_o          (S186_7x7_o),
    .S187_o          (S187_7x7_o),
    .S188_o          (S188_7x7_o),
    .S189_o          (S189_7x7_o),
    .S190_o          (S190_7x7_o),
    .S191_o          (S191_7x7_o),
    .S192_o          (S192_7x7_o),
    .S193_o          (S193_7x7_o),
    .S194_o          (S194_7x7_o),
    .S195_o          (S195_7x7_o),
    .S196_o          (S196_7x7_o),
    .S197_o          (S197_7x7_o),
    .S198_o          (S198_7x7_o),
    .S199_o          (S199_7x7_o),
    .S200_o          (S200_7x7_o),
    .S201_o          (S201_7x7_o),
    .S202_o          (S202_7x7_o),
    .S203_o          (S203_7x7_o),
    .S204_o          (S204_7x7_o),
    .S205_o          (S205_7x7_o),
    .S206_o          (S206_7x7_o),
    .S207_o          (S207_7x7_o),
    .S208_o          (S208_7x7_o),
    .S209_o          (S209_7x7_o),
    .S210_o          (S210_7x7_o),
    .S211_o          (S211_7x7_o),
    .S212_o          (S212_7x7_o),
    .S213_o          (S213_7x7_o),
    .S214_o          (S214_7x7_o),
    .S215_o          (S215_7x7_o),
    .S216_o          (S216_7x7_o),
    .S217_o          (S217_7x7_o),
    .S218_o          (S218_7x7_o),
    .S219_o          (S219_7x7_o),
    .S220_o          (S220_7x7_o),
    .S221_o          (S221_7x7_o),
    .S222_o          (S222_7x7_o),
    .S223_o          (S223_7x7_o),
    .S224_o          (S224_7x7_o),
    .S225_o          (S225_7x7_o),
    .done_o          (wdbf_15x15_done),
    .progress_done_o (wdbf_15x15_progress_done)
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
    wire [7:0] S170_9x9_o, S171_9x9_o, S172_9x9_o, S173_9x9_o, S174_9x9_o, S175_9x9_o, S176_9x9_o, S177_9x9_o;
    wire [7:0] S178_9x9_o, S179_9x9_o, S180_9x9_o, S181_9x9_o, S182_9x9_o, S183_9x9_o, S184_9x9_o, S185_9x9_o;
    wire [7:0] S186_9x9_o, S187_9x9_o, S188_9x9_o, S189_9x9_o, S190_9x9_o, S191_9x9_o, S192_9x9_o, S193_9x9_o;
    wire [7:0] S194_9x9_o, S195_9x9_o, S196_9x9_o, S197_9x9_o, S198_9x9_o, S199_9x9_o, S200_9x9_o, S201_9x9_o;
    wire [7:0] S202_9x9_o, S203_9x9_o, S204_9x9_o, S205_9x9_o, S206_9x9_o, S207_9x9_o, S208_9x9_o, S209_9x9_o;
    wire [7:0] S210_9x9_o, S211_9x9_o, S212_9x9_o, S213_9x9_o, S214_9x9_o, S215_9x9_o, S216_9x9_o, S217_9x9_o;
    wire [7:0] S218_9x9_o, S219_9x9_o, S220_9x9_o, S221_9x9_o, S222_9x9_o, S223_9x9_o, S224_9x9_o, S225_9x9_o;
    wire [7:0] S226_9x9_o, S227_9x9_o, S228_9x9_o, S229_9x9_o, S230_9x9_o, S231_9x9_o, S232_9x9_o, S233_9x9_o;
    wire [7:0] S234_9x9_o, S235_9x9_o, S236_9x9_o, S237_9x9_o, S238_9x9_o, S239_9x9_o, S240_9x9_o, S241_9x9_o;
    wire [7:0] S242_9x9_o, S243_9x9_o, S244_9x9_o, S245_9x9_o, S246_9x9_o, S247_9x9_o, S248_9x9_o, S249_9x9_o;
    wire [7:0] S250_9x9_o, S251_9x9_o, S252_9x9_o, S253_9x9_o, S254_9x9_o, S255_9x9_o, S256_9x9_o, S257_9x9_o;
    wire [7:0] S258_9x9_o, S259_9x9_o, S260_9x9_o, S261_9x9_o, S262_9x9_o, S263_9x9_o, S264_9x9_o, S265_9x9_o;
    wire [7:0] S266_9x9_o, S267_9x9_o, S268_9x9_o, S269_9x9_o, S270_9x9_o, S271_9x9_o, S272_9x9_o, S273_9x9_o;
    wire [7:0] S274_9x9_o, S275_9x9_o, S276_9x9_o, S277_9x9_o, S278_9x9_o, S279_9x9_o, S280_9x9_o, S281_9x9_o;
    wire [7:0] S282_9x9_o, S283_9x9_o, S284_9x9_o, S285_9x9_o, S286_9x9_o, S287_9x9_o, S288_9x9_o, S289_9x9_o;
    wire wdbf_17x17_done;
    wire wdbf_17x17_progress_done;
    
    Window_buffer_17x17 #(
    .COLS(COLS),
    .ROWS(ROWS)
    ) inst_Window_buffer_17x17 (
    .clk             (clk),
    .rst             (rst),
    .done_i          (done_buffer_9x9_o),
    .S1_i            (data16_9x9_o),
    .S2_i            (data15_9x9_o),
    .S3_i            (data14_9x9_o),
    .S4_i            (data13_9x9_o),
    .S5_i            (data12_9x9_o),
    .S6_i            (data11_9x9_o),
    .S7_i            (data10_9x9_o),
    .S8_i            (data9_9x9_o),
    .S9_i            (data8_9x9_o),
    .S10_i           (data7_9x9_o),
    .S11_i           (data6_9x9_o),
    .S12_i           (data5_9x9_o),
    .S13_i           (data4_9x9_o),
    .S14_i           (data3_9x9_o),
    .S15_i           (data2_9x9_o),
    .S16_i           (data1_9x9_o),
    .S17_i           (data0_9x9_o),
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
    .S170_o          (S170_9x9_o),
    .S171_o          (S171_9x9_o),
    .S172_o          (S172_9x9_o),
    .S173_o          (S173_9x9_o),
    .S174_o          (S174_9x9_o),
    .S175_o          (S175_9x9_o),
    .S176_o          (S176_9x9_o),
    .S177_o          (S177_9x9_o),
    .S178_o          (S178_9x9_o),
    .S179_o          (S179_9x9_o),
    .S180_o          (S180_9x9_o),
    .S181_o          (S181_9x9_o),
    .S182_o          (S182_9x9_o),
    .S183_o          (S183_9x9_o),
    .S184_o          (S184_9x9_o),
    .S185_o          (S185_9x9_o),
    .S186_o          (S186_9x9_o),
    .S187_o          (S187_9x9_o),
    .S188_o          (S188_9x9_o),
    .S189_o          (S189_9x9_o),
    .S190_o          (S190_9x9_o),
    .S191_o          (S191_9x9_o),
    .S192_o          (S192_9x9_o),
    .S193_o          (S193_9x9_o),
    .S194_o          (S194_9x9_o),
    .S195_o          (S195_9x9_o),
    .S196_o          (S196_9x9_o),
    .S197_o          (S197_9x9_o),
    .S198_o          (S198_9x9_o),
    .S199_o          (S199_9x9_o),
    .S200_o          (S200_9x9_o),
    .S201_o          (S201_9x9_o),
    .S202_o          (S202_9x9_o),
    .S203_o          (S203_9x9_o),
    .S204_o          (S204_9x9_o),
    .S205_o          (S205_9x9_o),
    .S206_o          (S206_9x9_o),
    .S207_o          (S207_9x9_o),
    .S208_o          (S208_9x9_o),
    .S209_o          (S209_9x9_o),
    .S210_o          (S210_9x9_o),
    .S211_o          (S211_9x9_o),
    .S212_o          (S212_9x9_o),
    .S213_o          (S213_9x9_o),
    .S214_o          (S214_9x9_o),
    .S215_o          (S215_9x9_o),
    .S216_o          (S216_9x9_o),
    .S217_o          (S217_9x9_o),
    .S218_o          (S218_9x9_o),
    .S219_o          (S219_9x9_o),
    .S220_o          (S220_9x9_o),
    .S221_o          (S221_9x9_o),
    .S222_o          (S222_9x9_o),
    .S223_o          (S223_9x9_o),
    .S224_o          (S224_9x9_o),
    .S225_o          (S225_9x9_o),
    .S226_o          (S226_9x9_o),
    .S227_o          (S227_9x9_o),
    .S228_o          (S228_9x9_o),
    .S229_o          (S229_9x9_o),
    .S230_o          (S230_9x9_o),
    .S231_o          (S231_9x9_o),
    .S232_o          (S232_9x9_o),
    .S233_o          (S233_9x9_o),
    .S234_o          (S234_9x9_o),
    .S235_o          (S235_9x9_o),
    .S236_o          (S236_9x9_o),
    .S237_o          (S237_9x9_o),
    .S238_o          (S238_9x9_o),
    .S239_o          (S239_9x9_o),
    .S240_o          (S240_9x9_o),
    .S241_o          (S241_9x9_o),
    .S242_o          (S242_9x9_o),
    .S243_o          (S243_9x9_o),
    .S244_o          (S244_9x9_o),
    .S245_o          (S245_9x9_o),
    .S246_o          (S246_9x9_o),
    .S247_o          (S247_9x9_o),
    .S248_o          (S248_9x9_o),
    .S249_o          (S249_9x9_o),
    .S250_o          (S250_9x9_o),
    .S251_o          (S251_9x9_o),
    .S252_o          (S252_9x9_o),
    .S253_o          (S253_9x9_o),
    .S254_o          (S254_9x9_o),
    .S255_o          (S255_9x9_o),
    .S256_o          (S256_9x9_o),
    .S257_o          (S257_9x9_o),
    .S258_o          (S258_9x9_o),
    .S259_o          (S259_9x9_o),
    .S260_o          (S260_9x9_o),
    .S261_o          (S261_9x9_o),
    .S262_o          (S262_9x9_o),
    .S263_o          (S263_9x9_o),
    .S264_o          (S264_9x9_o),
    .S265_o          (S265_9x9_o),
    .S266_o          (S266_9x9_o),
    .S267_o          (S267_9x9_o),
    .S268_o          (S268_9x9_o),
    .S269_o          (S269_9x9_o),
    .S270_o          (S270_9x9_o),
    .S271_o          (S271_9x9_o),
    .S272_o          (S272_9x9_o),
    .S273_o          (S273_9x9_o),
    .S274_o          (S274_9x9_o),
    .S275_o          (S275_9x9_o),
    .S276_o          (S276_9x9_o),
    .S277_o          (S277_9x9_o),
    .S278_o          (S278_9x9_o),
    .S279_o          (S279_9x9_o),
    .S280_o          (S280_9x9_o),
    .S281_o          (S281_9x9_o),
    .S282_o          (S282_9x9_o),
    .S283_o          (S283_9x9_o),
    .S284_o          (S284_9x9_o),
    .S285_o          (S285_9x9_o),
    .S286_o          (S286_9x9_o),
    .S287_o          (S287_9x9_o),
    .S288_o          (S288_9x9_o),
    .S289_o          (S289_9x9_o),
    .done_o          (wdbf_17x17_done),
    .progress_done_o (wdbf_17x17_progress_done)
    );
    
    
    wire [23:0] S1_r3, S2_r3, S3_r3, S4_r3, S5_r3, S6_r3, S7_r3, S8_r3;
    wire done_o_r3;
    
    Interpolation_R_x #(.R(7)) INTERPOLATION_R_7 (
    .clk(clk),
    .rst(rst),
    .progress_done_i(wdbf_17x17_progress_done),
    .done_i(wdbf_17x17_done),
    .S_0_i(S120_7x7_o),
    .S_90_i(S8_7x7_o),
    .S_180_i(S106_7x7_o),
    .S_270_i(S218_7x7_o),
    .S_45_i_1(S42_7x7_o),
    .S_45_i_2(S43_7x7_o),
    .S_45_i_3(S57_7x7_o),
    .S_45_i_4(S58_7x7_o),
    .S_135_i_1(S33_7x7_o),
    .S_135_i_2(S34_7x7_o),
    .S_135_i_3(S48_7x7_o),
    .S_135_i_4(S49_7x7_o),
    .S_225_i_1(S168_7x7_o),
    .S_225_i_2(S169_7x7_o),
    .S_225_i_3(S183_7x7_o),
    .S_225_i_4(S184_7x7_o),
    .S_315_i_1(S177_7x7_o),
    .S_315_i_2(S178_7x7_o),
    .S_315_i_3(S192_7x7_o),
    .S_315_i_4(S193_7x7_o),
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
    Interpolation_R_x #(.R(8)) INTERPOLATION_R_8 (
    .clk(clk),
    .rst(rst),
    .progress_done_i(wdbf_17x17_progress_done),
    .done_i(wdbf_17x17_done),
    .S_0_i(S153_9x9_o),
    .S_90_i(S9_9x9_o),
    .S_180_i(S137_9x9_o),
    .S_270_i(S281_9x9_o),
    .S_45_i_1(S48_9x9_o),
    .S_45_i_2(S49_9x9_o),
    .S_45_i_3(S66_9x9_o),
    .S_45_i_4(S67_9x9_o),
    .S_135_i_1(S37_9x9_o),
    .S_135_i_2(S38_9x9_o),
    .S_135_i_3(S54_9x9_o),
    .S_135_i_4(S55_9x9_o),
    .S_225_i_1(S224_9x9_o),
    .S_225_i_2(S225_9x9_o),
    .S_225_i_3(S241_9x9_o),
    .S_225_i_4(S242_9x9_o),
    .S_315_i_1(S235_9x9_o),
    .S_315_i_2(S236_9x9_o),
    .S_315_i_3(S252_9x9_o),
    .S_315_i_4(S253_9x9_o),
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
    
    
    
    
    wire [16:0] r8_patch_sum;
    wire patch_sum_done_o;
    wire patch_progress_done;
    R8_patch_sum #(.COLS(COLS),
    .ROWS(ROWS)) R8_PATCH_SUM
    (
    .clk(clk),
    .rst(rst),
    .done_i(done_buffer_9x9_o),
    .S1(data0_9x9_o),
    .S2(data1_9x9_o),
    .S3(data2_9x9_o),
    .S4(data3_9x9_o),
    .S5(data4_9x9_o),
    .S6(data5_9x9_o),
    .S7(data6_9x9_o),
    .S8(data7_9x9_o),
    .S9(data8_9x9_o),
    .S10(data9_9x9_o),
    .S11(data10_9x9_o),
    .S12(data11_9x9_o),
    .S13(data12_9x9_o),
    .S14(data13_9x9_o),
    .S15(data14_9x9_o),
    .S16(data15_9x9_o),
    .S17(data16_9x9_o),
    .sum_o(r8_patch_sum),
    .done_o(patch_sum_done_o),
    .progress_done_o(patch_progress_done));
    
    `define CYCLE_DELAY_MATCH_PATCH_SUM 1
    wire [23:0] S1_r4_delay, S2_r4_delay, S3_r4_delay, S4_r4_delay, S5_r4_delay, S6_r4_delay, S7_r4_delay, S8_r4_delay;
    wire done_o_r4_delay;
    wire finish_interpolation_delay;
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_MATCH_PATCH_SUM)) SHIFT_S1_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S1_r4),
    .data_o(S1_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_MATCH_PATCH_SUM)) SHIFT_S2_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S2_r4),
    .data_o(S2_r4_delay)
    );
    
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_MATCH_PATCH_SUM)) SHIFT_S3_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S3_r4),
    .data_o(S3_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_MATCH_PATCH_SUM)) SHIFT_S4_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S4_r4),
    .data_o(S4_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_MATCH_PATCH_SUM)) SHIFT_S5_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S5_r4),
    .data_o(S5_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_MATCH_PATCH_SUM)) SHIFT_S6_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S6_r4),
    .data_o(S6_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_MATCH_PATCH_SUM)) SHIFT_S7_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S7_r4),
    .data_o(S7_r4_delay)
    );
    shift_registers #(.WIDTH(24), .CYCLE(`CYCLE_DELAY_MATCH_PATCH_SUM)) SHIFT_S8_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(S8_r4),
    .data_o(S8_r4_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_MATCH_PATCH_SUM)) SHIFT_DONE_R4 (
    .clk(clk),
    .rst(rst),
    .data_i(done_o_r4),
    .data_o(done_o_r4_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY_MATCH_PATCH_SUM)) SHIFT_FINISH_INTERPOLATION (
    .clk(clk),
    .rst(rst),
    .data_i(finish_interpolation),
    .data_o(finish_interpolation_delay)
    );
    
    
    
    
    
    
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
    
    
    
    // wire [7:0] o_test_rd;
    // assign o_test_rd = {bit8_delay, bit7_delay, bit6_delay, bit5_delay, bit4_delay, bit3_delay, bit2_delay, bit1_delay};
    
    
    wire ni_r4_done, ni_r4_progress_done, bit1_o_ni, bit2_o_ni, bit3_o_ni,
    bit4_o_ni, bit5_o_ni, bit6_o_ni, bit7_o_ni, bit8_o_ni;
    NI #(.WIDTH(15), .GAIN(81)) NI_CALC_R4 (
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
    // wire [7:0] o_test_ni;
    // assign o_test_ni = {bit8_o_ni, bit7_o_ni, bit6_o_ni, bit5_o_ni, bit4_o_ni, bit3_o_ni, bit2_o_ni, bit1_o_ni};
    
    
    // // wire [3:0] data_o_riu;
    // // wire riu_done_o, riu_progress_done;
    // // riu2_mapping RIU2(
    // // .clk(clk),
    // // .rst(rst),
    // // .done_i(rd_r2_done),
    // // .progress_done_i(rd_r2_progress_done),
    // // .bit1_i(bit1_o),
    // // .bit2_i(bit2_o),
    // // .bit3_i(bit3_o),
    // // .bit4_i(bit4_o),
    // // .bit5_i(bit5_o),
    // // .bit6_i(bit6_o),
    // // .bit7_i(bit7_o),
    // // .bit8_i(bit8_o),
    // // .data_o(data_o_riu),
    // // .done_o(riu_done_o),
    // // .progress_done_o(riu_progress_done));
    
    // // wire [3:0] data_o_riu_ni;
    // // wire riu_done_o_ni, riu_progress_done_ni;
    // // riu2_mapping RIU2_NI(
    // // .clk(clk),
    // // .rst(rst),
    // // .done_i(ni_r2_done),
    // // .progress_done_i(ni_r2_progress_done),
    // // .bit1_i(bit1_o_ni),
    // // .bit2_i(bit2_o_ni),
    // // .bit3_i(bit3_o_ni),
    // // .bit4_i(bit4_o_ni),
    // // .bit5_i(bit5_o_ni),
    // // .bit6_i(bit6_o_ni),
    // // .bit7_i(bit7_o_ni),
    // // .bit8_i(bit8_o_ni),
    // // .data_o(data_o_riu_ni),
    // // .done_o(riu_done_o_ni),
    // // .progress_done_o(riu_progress_done_ni));
endmodule
