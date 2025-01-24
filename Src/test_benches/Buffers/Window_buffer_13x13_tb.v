`timescale 1ns / 1ps

module Window_buffer_13x13_tb();
    
    // Parameters
    parameter COLS = 15;
    parameter ROWS = 15;
    
    // Inputs
    reg clk;
    reg rst;
    reg done_i;
    reg [7:0] S1_i, S2_i, S3_i, S4_i, S5_i, S6_i, S7_i, S8_i, S9_i, S10_i, S11_i, S12_i, S13_i;
    
    // Outputs
    wire [7:0] S1_o, S2_o, S3_o, S4_o, S5_o, S6_o, S7_o, S8_o, S9_o, S10_o, S11_o, S12_o, S13_o;
    wire [7:0] S14_o, S15_o, S16_o, S17_o, S18_o, S19_o, S20_o, S21_o, S22_o, S23_o, S24_o, S25_o;
    wire [7:0] S26_o, S27_o, S28_o, S29_o, S30_o, S31_o, S32_o, S33_o, S34_o, S35_o, S36_o, S37_o, S38_o, S39_o;
    wire [7:0] S40_o, S41_o, S42_o, S43_o, S44_o, S45_o, S46_o, S47_o, S48_o, S49_o;
    wire [7:0] S50_o, S51_o, S52_o, S53_o, S54_o, S55_o, S56_o, S57_o, S58_o, S59_o, S60_o;
    wire [7:0] S61_o, S62_o, S63_o, S64_o, S65_o, S66_o, S67_o, S68_o, S69_o, S70_o;
    wire [7:0] S71_o, S72_o, S73_o, S74_o, S75_o, S76_o, S77_o, S78_o, S79_o, S80_o, S81_o;
    wire [7:0] S82_o, S83_o, S84_o, S85_o, S86_o, S87_o, S88_o, S89_o, S90_o, S91_o, S92_o, S93_o, S94_o, S95_o;
    wire [7:0] S96_o, S97_o, S98_o, S99_o, S100_o, S101_o, S102_o, S103_o, S104_o, S105_o, S106_o, S107_o, S108_o, S109_o;
    wire [7:0] S110_o, S111_o, S112_o, S113_o, S114_o, S115_o, S116_o, S117_o, S118_o, S119_o, S120_o, S121_o;
    wire [7:0] S122_o, S123_o, S124_o, S125_o, S126_o, S127_o, S128_o, S129_o, S130_o, S131_o, S132_o, S133_o, S134_o, S135_o;
    wire [7:0] S136_o, S137_o, S138_o, S139_o, S140_o, S141_o, S142_o, S143_o, S144_o, S145_o, S146_o, S147_o, S148_o, S149_o;
    wire [7:0] S150_o, S151_o, S152_o, S153_o, S154_o, S155_o, S156_o, S157_o, S158_o, S159_o, S160_o, S161_o, S162_o, S163_o;
    wire [7:0] S164_o, S165_o, S166_o, S167_o, S168_o, S169_o;
    wire done_o;
    wire progress_done_o;
    
    // Instantiate the Unit Under Test (UUT)
    Window_buffer_13x13 #(
    .COLS(COLS),
    .ROWS(ROWS)
    ) inst_Window_buffer_13x13 (
    .clk             (clk),
    .rst             (rst),
    .done_i          (done_i),
    .S1_i            (S1_i),
    .S2_i            (S2_i),
    .S3_i            (S3_i),
    .S4_i            (S4_i),
    .S5_i            (S5_i),
    .S6_i            (S6_i),
    .S7_i            (S7_i),
    .S8_i            (S8_i),
    .S9_i            (S9_i),
    .S10_i           (S10_i),
    .S11_i           (S11_i),
    .S12_i           (S12_i),
    .S13_i           (S13_i),
    .S1_o            (S1_o),
    .S2_o            (S2_o),
    .S3_o            (S3_o),
    .S4_o            (S4_o),
    .S5_o            (S5_o),
    .S6_o            (S6_o),
    .S7_o            (S7_o),
    .S8_o            (S8_o),
    .S9_o            (S9_o),
    .S10_o           (S10_o),
    .S11_o           (S11_o),
    .S12_o           (S12_o),
    .S13_o           (S13_o),
    .S14_o           (S14_o),
    .S15_o           (S15_o),
    .S16_o           (S16_o),
    .S17_o           (S17_o),
    .S18_o           (S18_o),
    .S19_o           (S19_o),
    .S20_o           (S20_o),
    .S21_o           (S21_o),
    .S22_o           (S22_o),
    .S23_o           (S23_o),
    .S24_o           (S24_o),
    .S25_o           (S25_o),
    .S26_o           (S26_o),
    .S27_o           (S27_o),
    .S28_o           (S28_o),
    .S29_o           (S29_o),
    .S30_o           (S30_o),
    .S31_o           (S31_o),
    .S32_o           (S32_o),
    .S33_o           (S33_o),
    .S34_o           (S34_o),
    .S35_o           (S35_o),
    .S36_o           (S36_o),
    .S37_o           (S37_o),
    .S38_o           (S38_o),
    .S39_o           (S39_o),
    .S40_o           (S40_o),
    .S41_o           (S41_o),
    .S42_o           (S42_o),
    .S43_o           (S43_o),
    .S44_o           (S44_o),
    .S45_o           (S45_o),
    .S46_o           (S46_o),
    .S47_o           (S47_o),
    .S48_o           (S48_o),
    .S49_o           (S49_o),
    .S50_o           (S50_o),
    .S51_o           (S51_o),
    .S52_o           (S52_o),
    .S53_o           (S53_o),
    .S54_o           (S54_o),
    .S55_o           (S55_o),
    .S56_o           (S56_o),
    .S57_o           (S57_o),
    .S58_o           (S58_o),
    .S59_o           (S59_o),
    .S60_o           (S60_o),
    .S61_o           (S61_o),
    .S62_o           (S62_o),
    .S63_o           (S63_o),
    .S64_o           (S64_o),
    .S65_o           (S65_o),
    .S66_o           (S66_o),
    .S67_o           (S67_o),
    .S68_o           (S68_o),
    .S69_o           (S69_o),
    .S70_o           (S70_o),
    .S71_o           (S71_o),
    .S72_o           (S72_o),
    .S73_o           (S73_o),
    .S74_o           (S74_o),
    .S75_o           (S75_o),
    .S76_o           (S76_o),
    .S77_o           (S77_o),
    .S78_o           (S78_o),
    .S79_o           (S79_o),
    .S80_o           (S80_o),
    .S81_o           (S81_o),
    .S82_o           (S82_o),
    .S83_o           (S83_o),
    .S84_o           (S84_o),
    .S85_o           (S85_o),
    .S86_o           (S86_o),
    .S87_o           (S87_o),
    .S88_o           (S88_o),
    .S89_o           (S89_o),
    .S90_o           (S90_o),
    .S91_o           (S91_o),
    .S92_o           (S92_o),
    .S93_o           (S93_o),
    .S94_o           (S94_o),
    .S95_o           (S95_o),
    .S96_o           (S96_o),
    .S97_o           (S97_o),
    .S98_o           (S98_o),
    .S99_o           (S99_o),
    .S100_o          (S100_o),
    .S101_o          (S101_o),
    .S102_o          (S102_o),
    .S103_o          (S103_o),
    .S104_o          (S104_o),
    .S105_o          (S105_o),
    .S106_o          (S106_o),
    .S107_o          (S107_o),
    .S108_o          (S108_o),
    .S109_o          (S109_o),
    .S110_o          (S110_o),
    .S111_o          (S111_o),
    .S112_o          (S112_o),
    .S113_o          (S113_o),
    .S114_o          (S114_o),
    .S115_o          (S115_o),
    .S116_o          (S116_o),
    .S117_o          (S117_o),
    .S118_o          (S118_o),
    .S119_o          (S119_o),
    .S120_o          (S120_o),
    .S121_o          (S121_o),
    .S122_o          (S122_o),
    .S123_o          (S123_o),
    .S124_o          (S124_o),
    .S125_o          (S125_o),
    .S126_o          (S126_o),
    .S127_o          (S127_o),
    .S128_o          (S128_o),
    .S129_o          (S129_o),
    .S130_o          (S130_o),
    .S131_o          (S131_o),
    .S132_o          (S132_o),
    .S133_o          (S133_o),
    .S134_o          (S134_o),
    .S135_o          (S135_o),
    .S136_o          (S136_o),
    .S137_o          (S137_o),
    .S138_o          (S138_o),
    .S139_o          (S139_o),
    .S140_o          (S140_o),
    .S141_o          (S141_o),
    .S142_o          (S142_o),
    .S143_o          (S143_o),
    .S144_o          (S144_o),
    .S145_o          (S145_o),
    .S146_o          (S146_o),
    .S147_o          (S147_o),
    .S148_o          (S148_o),
    .S149_o          (S149_o),
    .S150_o          (S150_o),
    .S151_o          (S151_o),
    .S152_o          (S152_o),
    .S153_o          (S153_o),
    .S154_o          (S154_o),
    .S155_o          (S155_o),
    .S156_o          (S156_o),
    .S157_o          (S157_o),
    .S158_o          (S158_o),
    .S159_o          (S159_o),
    .S160_o          (S160_o),
    .S161_o          (S161_o),
    .S162_o          (S162_o),
    .S163_o          (S163_o),
    .S164_o          (S164_o),
    .S165_o          (S165_o),
    .S166_o          (S166_o),
    .S167_o          (S167_o),
    .S168_o          (S168_o),
    .S169_o          (S169_o),
    .done_o          (done_o),
    .progress_done_o (progress_done_o)
    );
    
    
    
    
    // Clock generation
    always #5 clk = ~clk;
    
    integer i;
    // Test stimulus
    initial begin
        // Initialize Inputs
        clk    = 0;
        rst    = 1;
        done_i = 0;
        S1_i   = 0;
        S2_i   = 0;
        S3_i   = 0;
        S4_i   = 0;
        S5_i   = 0; S6_i   = 0;
        S7_i   = 0;
        S8_i   = 0;
        S9_i   = 0;
        S10_i  = 0;
        S11_i  = 0;
        S12_i  = 0;
        S13_i  = 0;
        
        // Reset pulse
        #10;
        rst    = 0;
        done_i = 1;
        
        // 1 2 3 4 5 6 7 8 9 10 11
        // 1 2 3 4 5 6 7 8 9 10 11
        // 12 13 14 15 16 17 18 19 20 21 22
        // 1 2 3 4 5 6 7 8 9
        // 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
        // 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30
        for(i = 1; i < 100; i = i + 1) begin
            S1_i  = i;
            S2_i  = i;
            S3_i  = i;
            S4_i  = i;
            S5_i  = i;
            S6_i  = i;
            S7_i  = i;
            S8_i  = i;
            S9_i  = i;
            S10_i = i;
            S11_i = i;
            S12_i = i;
            S13_i = i;
            #10;
        end
        done_i = 0;
        
        
        #50;
        #2000;
        $stop;
    end
    
endmodule
