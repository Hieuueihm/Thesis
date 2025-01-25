module Window_buffer_17x17_datapath #(parameter COLS = 9,
                                      parameter ROWS = 9)
                                     (input clk,
                                      input rst,
                                      input count_en,
                                      input [7:0] S1_i,
                                      S2_i,
                                      S3_i,
                                      S4_i,
                                      S5_i,
                                      S6_i,
                                      S7_i,
                                      S8_i,
                                      S9_i,
                                      S10_i,
                                      S11_i,
                                      S12_i,
                                      S13_i,
                                      S14_i,
                                      S15_i,
                                      S16_i,
                                      S17_i,
                                      output i_row_eq_max,
                                      output [7:0] S1_o,
                                      S2_o,
                                      S3_o,
                                      S4_o,
                                      S5_o,
                                      S6_o,
                                      S7_o,
                                      S8_o,
                                      S9_o,
                                      S10_o,
                                      S11_o,
                                      S12_o,
                                      S13_o,
                                      S14_o,
                                      S15_o,
                                      S16_o,
                                      S17_o,
                                      S18_o,
                                      S19_o,
                                      S20_o,
                                      S21_o,
                                      S22_o,
                                      S23_o,
                                      S24_o,
                                      S25_o,
                                      S26_o,
                                      S27_o,
                                      S28_o,
                                      S29_o,
                                      S30_o,
                                      S31_o,
                                      S32_o,
                                      S33_o,
                                      S34_o,
                                      S35_o,
                                      S36_o,
                                      S37_o,
                                      S38_o,
                                      S39_o,
                                      S40_o,
                                      S41_o,
                                      S42_o,
                                      S43_o,
                                      S44_o,
                                      S45_o,
                                      S46_o,
                                      S47_o,
                                      S48_o,
                                      S49_o,
                                      S50_o,
                                      S51_o,
                                      S52_o,
                                      S53_o,
                                      S54_o,
                                      S55_o,
                                      S56_o,
                                      S57_o,
                                      S58_o,
                                      S59_o,
                                      S60_o,
                                      S61_o,
                                      S62_o,
                                      S63_o,
                                      S64_o,
                                      S65_o,
                                      S66_o,
                                      S67_o,
                                      S68_o,
                                      S69_o,
                                      S70_o,
                                      S71_o,
                                      S72_o,
                                      S73_o,
                                      S74_o,
                                      S75_o,
                                      S76_o,
                                      S77_o,
                                      S78_o,
                                      S79_o,
                                      S80_o,
                                      S81_o,
                                      S82_o,
                                      S83_o,
                                      S84_o,
                                      S85_o,
                                      S86_o,
                                      S87_o,
                                      S88_o,
                                      S89_o,
                                      S90_o,
                                      S91_o,
                                      S92_o,
                                      S93_o,
                                      S94_o,
                                      S95_o,
                                      S96_o,
                                      S97_o,
                                      S98_o,
                                      S99_o,
                                      S100_o,
                                      S101_o,
                                      S102_o,
                                      S103_o,
                                      S104_o,
                                      S105_o,
                                      S106_o,
                                      S107_o,
                                      S108_o,
                                      S109_o,
                                      S110_o,
                                      S111_o,
                                      S112_o,
                                      S113_o,
                                      S114_o,
                                      S115_o,
                                      S116_o,
                                      S117_o,
                                      S118_o,
                                      S119_o,
                                      S120_o,
                                      S121_o,
                                      S122_o,
                                      S123_o,
                                      S124_o,
                                      S125_o,
                                      S126_o,
                                      S127_o,
                                      S128_o,
                                      S129_o,
                                      S130_o,
                                      S131_o,
                                      S132_o,
                                      S133_o,
                                      S134_o,
                                      S135_o,
                                      S136_o,
                                      S137_o,
                                      S138_o,
                                      S139_o,
                                      S140_o,
                                      S141_o,
                                      S142_o,
                                      S143_o,
                                      S144_o,
                                      S145_o,
                                      S146_o,
                                      S147_o,
                                      S148_o,
                                      S149_o,
                                      S150_o,
                                      S151_o,
                                      S152_o,
                                      S153_o,
                                      S154_o,
                                      S155_o,
                                      S156_o,
                                      S157_o,
                                      S158_o,
                                      S159_o,
                                      S160_o,
                                      S161_o,
                                      S162_o,
                                      S163_o,
                                      S164_o,
                                      S165_o,
                                      S166_o,
                                      S167_o,
                                      S168_o,
                                      S169_o,
                                      S170_o,
                                      S171_o,
                                      S172_o,
                                      S173_o,
                                      S174_o,
                                      S175_o,
                                      S176_o,
                                      S177_o,
                                      S178_o,
                                      S179_o,
                                      S180_o,
                                      S181_o,
                                      S182_o,
                                      S183_o,
                                      S184_o,
                                      S185_o,
                                      S186_o,
                                      S187_o,
                                      S188_o,
                                      S189_o,
                                      S190_o,
                                      S191_o,
                                      S192_o,
                                      S193_o,
                                      S194_o,
                                      S195_o,
                                      S196_o,
                                      S197_o,
                                      S198_o,
                                      S199_o,
                                      S200_o,
                                      S201_o,
                                      S202_o,
                                      S203_o,
                                      S204_o,
                                      S205_o,
                                      S206_o,
                                      S207_o,
                                      S208_o,
                                      S209_o,
                                      S210_o,
                                      S211_o,
                                      S212_o,
                                      S213_o,
                                      S214_o,
                                      S215_o,
                                      S216_o,
                                      S217_o,
                                      S218_o,
                                      S219_o,
                                      S220_o,
                                      S221_o,
                                      S222_o,
                                      S223_o,
                                      S224_o,
                                      S225_o,
                                      S226_o,
                                      S227_o,
                                      S228_o,
                                      S229_o,
                                      S230_o,
                                      S231_o,
                                      S232_o,
                                      S233_o,
                                      S234_o,
                                      S235_o,
                                      S236_o,
                                      S237_o,
                                      S238_o,
                                      S239_o,
                                      S240_o,
                                      S241_o,
                                      S242_o,
                                      S243_o,
                                      S244_o,
                                      S245_o,
                                      S246_o,
                                      S247_o,
                                      S248_o,
                                      S249_o,
                                      S250_o,
                                      S251_o,
                                      S252_o,
                                      S253_o,
                                      S254_o,
                                      S255_o,
                                      S256_o,
                                      S257_o,
                                      S258_o,
                                      S259_o,
                                      S260_o,
                                      S261_o,
                                      S262_o,
                                      S263_o,
                                      S264_o,
                                      S265_o,
                                      S266_o,
                                      S267_o,
                                      S268_o,
                                      S269_o,
                                      S270_o,
                                      S271_o,
                                      S272_o,
                                      S273_o,
                                      S274_o,
                                      S275_o,
                                      S276_o,
                                      S277_o,
                                      S278_o,
                                      S279_o,
                                      S280_o,
                                      S281_o,
                                      S282_o,
                                      S283_o,
                                      S284_o,
                                      S285_o,
                                      S286_o,
                                      S287_o,
                                      S288_o,
                                      S289_o,
                                      output i_col_eq_max,
                                      output i_col_ge_threshold);
    
    wire [9:0] i_counter_plus_1;
    
    wire [9:0] i_row_plus_1;
    wire [9:0] i_row, i_counter;
    plus_1 #(.WIDTH(10))
    COUNTER_PLUS
    (
    .rst(rst),
    .clk(clk),
    .en(count_en),
    .D(i_counter),
    .Q(i_counter_plus_1)
    );
    plus_1 #(.WIDTH(10))
    ROW_PLUS
    (
    .rst(rst),
    .clk(clk),
    .en(i_col_eq_max),
    .D(i_row),
    .Q(i_row_plus_1)
    );
    
    assign i_col_ge_threshold = (i_counter_plus_1 > 14) ? 1'b1 : 1'b0;
    assign i_col_eq_max       = (i_counter_plus_1 == COLS - 2) ? 1'b1 : 1'b0;
    assign i_counter          = (i_col_eq_max == 1'b1) ? 0: i_counter_plus_1;
    
    assign i_row        = (i_col_eq_max) ? i_row : i_row_plus_1;
    assign i_row_eq_max = (i_row_plus_1 == ROWS - 16) ? 1'b1 : 1'b0;
    
    
    reg [7:0] S1_delay;
    reg [7:0] S2_delay;
    reg [7:0] S3_delay;
    reg [7:0] S4_delay;
    reg [7:0] S5_delay;
    reg [7:0] S6_delay;
    reg [7:0] S7_delay;
    reg [7:0] S8_delay;
    reg [7:0] S9_delay;
    reg [7:0] S10_delay;
    reg [7:0] S11_delay;
    reg [7:0] S12_delay;
    reg [7:0] S13_delay;
    reg [7:0] S14_delay;
    reg [7:0] S15_delay;
    reg [7:0] S16_delay;
    reg [7:0] S17_delay;
    
    always @(posedge clk) begin
        if (rst) begin
            S1_delay  <= 0;
            S2_delay  <= 0;
            S3_delay  <= 0;
            S4_delay  <= 0;
            S5_delay  <= 0;
            S6_delay  <= 0;
            S7_delay  <= 0;
            S8_delay  <= 0;
            S9_delay  <= 0;
            S10_delay <= 0;
            S11_delay <= 0;
            S12_delay <= 0;
            S13_delay <= 0;
            S14_delay <= 0;
            S15_delay <= 0;
            S16_delay <= 0;
            S17_delay <= 0;
            end else begin
            S1_delay  <= S1_i;
            S2_delay  <= S2_i;
            S3_delay  <= S3_i;
            S4_delay  <= S4_i;
            S5_delay  <= S5_i;
            S6_delay  <= S6_i;
            S7_delay  <= S7_i;
            S8_delay  <= S8_i;
            S9_delay  <= S9_i;
            S10_delay <= S10_i;
            S11_delay <= S11_i;
            S12_delay <= S12_i;
            S13_delay <= S13_i;
            S14_delay <= S14_i;
            S15_delay <= S15_i;
            S16_delay <= S16_i;
            S17_delay <= S17_i;
        end
    end
    
    reg [7:0] S1_window [16:0];
    reg [7:0] S2_window [16:0];
    reg [7:0] S3_window [16:0];
    reg [7:0] S4_window [16:0];
    reg [7:0] S5_window [16:0];
    reg [7:0] S6_window [16:0];
    reg [7:0] S7_window [16:0];
    reg [7:0] S8_window [16:0];
    reg [7:0] S9_window [16:0];
    reg [7:0] S10_window[16:0];
    reg [7:0] S11_window[16:0];
    reg [7:0] S12_window[16:0];
    reg [7:0] S13_window[16:0];
    reg [7:0] S14_window[16:0];
    reg [7:0] S15_window[16:0];
    reg [7:0] S16_window[16:0];
    reg [7:0] S17_window[16:0];
    integer i;
    always @(posedge clk) begin
        if (rst) begin
            for(i = 0;i < 17; i = i + 1) begin
                S1_window[i]  <= 0;
                S2_window[i]  <= 0;
                S3_window[i]  <= 0;
                S4_window[i]  <= 0;
                S5_window[i]  <= 0;
                S6_window[i]  <= 0;
                S7_window[i]  <= 0;
                S8_window[i]  <= 0;
                S9_window[i]  <= 0;
                S10_window[i] <= 0;
                S11_window[i] <= 0;
                S12_window[i] <= 0;
                S13_window[i] <= 0;
                S14_window[i] <= 0;
                S15_window[i] <= 0;
                S16_window[i] <= 0;
                S17_window[i] <= 0;
            end
            end else begin
            S1_window[0]  <= S1_delay;
            S2_window[0]  <= S2_delay;
            S3_window[0]  <= S3_delay;
            S4_window[0]  <= S4_delay;
            S5_window[0]  <= S5_delay;
            S6_window[0]  <= S6_delay;
            S7_window[0]  <= S7_delay;
            S8_window[0]  <= S8_delay;
            S9_window[0]  <= S9_delay;
            S10_window[0] <= S10_delay;
            S11_window[0] <= S11_delay;
            S12_window[0] <= S12_delay;
            S13_window[0] <= S13_delay;
            S14_window[0] <= S14_delay;
            S15_window[0] <= S15_delay;
            S16_window[0] <= S16_delay;
            S17_window[0] <= S17_delay;
            
            for(i = 1; i < 17; i = i + 1) begin
                S1_window[i]  <= S1_window[i - 1];
                S2_window[i]  <= S2_window[i - 1];
                S3_window[i]  <= S3_window[i - 1];
                S4_window[i]  <= S4_window[i - 1];
                S5_window[i]  <= S5_window[i - 1];
                S6_window[i]  <= S6_window[i - 1];
                S7_window[i]  <= S7_window[i - 1];
                S8_window[i]  <= S8_window[i - 1];
                S9_window[i]  <= S9_window[i - 1];
                S10_window[i] <= S10_window[i - 1];
                S11_window[i] <= S11_window[i - 1];
                S12_window[i] <= S12_window[i - 1];
                S13_window[i] <= S13_window[i - 1];
                S14_window[i] <= S14_window[i - 1];
                S15_window[i] <= S15_window[i - 1];
                S16_window[i] <= S16_window[i - 1];
                S17_window[i] <= S17_window[i - 1];
                
            end
        end
    end
    
    assign S1_o = S1_window[16];
    assign S2_o = S1_window[15];
    assign S3_o = S1_window[14];
    assign S4_o = S1_window[13];
    assign S5_o = S1_window[12];
    assign S6_o = S1_window[11];
    assign S7_o = S1_window[10];
    assign S8_o = S1_window[9];
    assign S9_o = S1_window[8];
    assign S10_o = S1_window[7];
    assign S11_o = S1_window[6];
    assign S12_o = S1_window[5];
    assign S13_o = S1_window[4];
    assign S14_o = S1_window[3];
    assign S15_o = S1_window[2];
    assign S16_o = S1_window[1];
    assign S17_o = S1_window[0];
    
    
    assign S18_o = S2_window[16];
    assign S19_o = S2_window[15];
    assign S20_o = S2_window[14];
    assign S21_o = S2_window[13];
    assign S22_o = S2_window[12];
    assign S23_o = S2_window[11];
    assign S24_o = S2_window[10];
    assign S25_o = S2_window[9];
    assign S26_o = S2_window[8];
    assign S27_o = S2_window[7];
    assign S28_o = S2_window[6];
    assign S29_o = S2_window[5];
    assign S30_o = S2_window[4];
    assign S31_o = S2_window[3];
    assign S32_o = S2_window[2];
    assign S33_o = S2_window[1];
    assign S34_o = S2_window[0];
    
    
    assign S35_o = S3_window[16];
    assign S36_o = S3_window[15];
    assign S37_o = S3_window[14];
    assign S38_o = S3_window[13];
    assign S39_o = S3_window[12];
    assign S40_o = S3_window[11];
    assign S41_o = S3_window[10];
    assign S42_o = S3_window[9];
    assign S43_o = S3_window[8];
    assign S44_o = S3_window[7];
    assign S45_o = S3_window[6];
    assign S46_o = S3_window[5];
    assign S47_o = S3_window[4];
    assign S48_o = S3_window[3];
    assign S49_o = S3_window[2];
    assign S50_o = S3_window[1];
    assign S51_o = S3_window[0];
    
    
    assign S52_o = S4_window[16];
    assign S53_o = S4_window[15];
    assign S54_o = S4_window[14];
    assign S55_o = S4_window[13];
    assign S56_o = S4_window[12];
    assign S57_o = S4_window[11];
    assign S58_o = S4_window[10];
    assign S59_o = S4_window[9];
    assign S60_o = S4_window[8];
    assign S61_o = S4_window[7];
    assign S62_o = S4_window[6];
    assign S63_o = S4_window[5];
    assign S64_o = S4_window[4];
    assign S65_o = S4_window[3];
    assign S66_o = S4_window[2];
    assign S67_o = S4_window[1];
    assign S68_o = S4_window[0];
    
    
    assign S69_o = S5_window[16];
    assign S70_o = S5_window[15];
    assign S71_o = S5_window[14];
    assign S72_o = S5_window[13];
    assign S73_o = S5_window[12];
    assign S74_o = S5_window[11];
    assign S75_o = S5_window[10];
    assign S76_o = S5_window[9];
    assign S77_o = S5_window[8];
    assign S78_o = S5_window[7];
    assign S79_o = S5_window[6];
    assign S80_o = S5_window[5];
    assign S81_o = S5_window[4];
    assign S82_o = S5_window[3];
    assign S83_o = S5_window[2];
    assign S84_o = S5_window[1];
    assign S85_o = S5_window[0];
    
    
    assign S86_o = S6_window[16];
    assign S87_o = S6_window[15];
    assign S88_o = S6_window[14];
    assign S89_o = S6_window[13];
    assign S90_o = S6_window[12];
    assign S91_o = S6_window[11];
    assign S92_o = S6_window[10];
    assign S93_o = S6_window[9];
    assign S94_o = S6_window[8];
    assign S95_o = S6_window[7];
    assign S96_o = S6_window[6];
    assign S97_o = S6_window[5];
    assign S98_o = S6_window[4];
    assign S99_o = S6_window[3];
    assign S100_o = S6_window[2];
    assign S101_o = S6_window[1];
    assign S102_o = S6_window[0];
    
    
    assign S103_o = S7_window[16];
    assign S104_o = S7_window[15];
    assign S105_o = S7_window[14];
    assign S106_o = S7_window[13];
    assign S107_o = S7_window[12];
    assign S108_o = S7_window[11];
    assign S109_o = S7_window[10];
    assign S110_o = S7_window[9];
    assign S111_o = S7_window[8];
    assign S112_o = S7_window[7];
    assign S113_o = S7_window[6];
    assign S114_o = S7_window[5];
    assign S115_o = S7_window[4];
    assign S116_o = S7_window[3];
    assign S117_o = S7_window[2];
    assign S118_o = S7_window[1];
    assign S119_o = S7_window[0];
    
    
    assign S120_o = S8_window[16];
    assign S121_o = S8_window[15];
    assign S122_o = S8_window[14];
    assign S123_o = S8_window[13];
    assign S124_o = S8_window[12];
    assign S125_o = S8_window[11];
    assign S126_o = S8_window[10];
    assign S127_o = S8_window[9];
    assign S128_o = S8_window[8];
    assign S129_o = S8_window[7];
    assign S130_o = S8_window[6];
    assign S131_o = S8_window[5];
    assign S132_o = S8_window[4];
    assign S133_o = S8_window[3];
    assign S134_o = S8_window[2];
    assign S135_o = S8_window[1];
    assign S136_o = S8_window[0];
    
    
    assign S137_o = S9_window[16];
    assign S138_o = S9_window[15];
    assign S139_o = S9_window[14];
    assign S140_o = S9_window[13];
    assign S141_o = S9_window[12];
    assign S142_o = S9_window[11];
    assign S143_o = S9_window[10];
    assign S144_o = S9_window[9];
    assign S145_o = S9_window[8];
    assign S146_o = S9_window[7];
    assign S147_o = S9_window[6];
    assign S148_o = S9_window[5];
    assign S149_o = S9_window[4];
    assign S150_o = S9_window[3];
    assign S151_o = S9_window[2];
    assign S152_o = S9_window[1];
    assign S153_o = S9_window[0];
    
    
    assign S154_o = S10_window[16];
    assign S155_o = S10_window[15];
    assign S156_o = S10_window[14];
    assign S157_o = S10_window[13];
    assign S158_o = S10_window[12];
    assign S159_o = S10_window[11];
    assign S160_o = S10_window[10];
    assign S161_o = S10_window[9];
    assign S162_o = S10_window[8];
    assign S163_o = S10_window[7];
    assign S164_o = S10_window[6];
    assign S165_o = S10_window[5];
    assign S166_o = S10_window[4];
    assign S167_o = S10_window[3];
    assign S168_o = S10_window[2];
    assign S169_o = S10_window[1];
    assign S170_o = S10_window[0];
    
    
    assign S171_o = S11_window[16];
    assign S172_o = S11_window[15];
    assign S173_o = S11_window[14];
    assign S174_o = S11_window[13];
    assign S175_o = S11_window[12];
    assign S176_o = S11_window[11];
    assign S177_o = S11_window[10];
    assign S178_o = S11_window[9];
    assign S179_o = S11_window[8];
    assign S180_o = S11_window[7];
    assign S181_o = S11_window[6];
    assign S182_o = S11_window[5];
    assign S183_o = S11_window[4];
    assign S184_o = S11_window[3];
    assign S185_o = S11_window[2];
    assign S186_o = S11_window[1];
    assign S187_o = S11_window[0];
    
    
    assign S188_o = S12_window[16];
    assign S189_o = S12_window[15];
    assign S190_o = S12_window[14];
    assign S191_o = S12_window[13];
    assign S192_o = S12_window[12];
    assign S193_o = S12_window[11];
    assign S194_o = S12_window[10];
    assign S195_o = S12_window[9];
    assign S196_o = S12_window[8];
    assign S197_o = S12_window[7];
    assign S198_o = S12_window[6];
    assign S199_o = S12_window[5];
    assign S200_o = S12_window[4];
    assign S201_o = S12_window[3];
    assign S202_o = S12_window[2];
    assign S203_o = S12_window[1];
    assign S204_o = S12_window[0];
    
    
    assign S205_o = S13_window[16];
    assign S206_o = S13_window[15];
    assign S207_o = S13_window[14];
    assign S208_o = S13_window[13];
    assign S209_o = S13_window[12];
    assign S210_o = S13_window[11];
    assign S211_o = S13_window[10];
    assign S212_o = S13_window[9];
    assign S213_o = S13_window[8];
    assign S214_o = S13_window[7];
    assign S215_o = S13_window[6];
    assign S216_o = S13_window[5];
    assign S217_o = S13_window[4];
    assign S218_o = S13_window[3];
    assign S219_o = S13_window[2];
    assign S220_o = S13_window[1];
    assign S221_o = S13_window[0];
    
    
    assign S222_o = S14_window[16];
    assign S223_o = S14_window[15];
    assign S224_o = S14_window[14];
    assign S225_o = S14_window[13];
    assign S226_o = S14_window[12];
    assign S227_o = S14_window[11];
    assign S228_o = S14_window[10];
    assign S229_o = S14_window[9];
    assign S230_o = S14_window[8];
    assign S231_o = S14_window[7];
    assign S232_o = S14_window[6];
    assign S233_o = S14_window[5];
    assign S234_o = S14_window[4];
    assign S235_o = S14_window[3];
    assign S236_o = S14_window[2];
    assign S237_o = S14_window[1];
    assign S238_o = S14_window[0];
    
    
    assign S239_o = S15_window[16];
    assign S240_o = S15_window[15];
    assign S241_o = S15_window[14];
    assign S242_o = S15_window[13];
    assign S243_o = S15_window[12];
    assign S244_o = S15_window[11];
    assign S245_o = S15_window[10];
    assign S246_o = S15_window[9];
    assign S247_o = S15_window[8];
    assign S248_o = S15_window[7];
    assign S249_o = S15_window[6];
    assign S250_o = S15_window[5];
    assign S251_o = S15_window[4];
    assign S252_o = S15_window[3];
    assign S253_o = S15_window[2];
    assign S254_o = S15_window[1];
    assign S255_o = S15_window[0];
    
    
    assign S256_o = S16_window[16];
    assign S257_o = S16_window[15];
    assign S258_o = S16_window[14];
    assign S259_o = S16_window[13];
    assign S260_o = S16_window[12];
    assign S261_o = S16_window[11];
    assign S262_o = S16_window[10];
    assign S263_o = S16_window[9];
    assign S264_o = S16_window[8];
    assign S265_o = S16_window[7];
    assign S266_o = S16_window[6];
    assign S267_o = S16_window[5];
    assign S268_o = S16_window[4];
    assign S269_o = S16_window[3];
    assign S270_o = S16_window[2];
    assign S271_o = S16_window[1];
    assign S272_o = S16_window[0];
    
    
    assign S273_o = S17_window[16];
    assign S274_o = S17_window[15];
    assign S275_o = S17_window[14];
    assign S276_o = S17_window[13];
    assign S277_o = S17_window[12];
    assign S278_o = S17_window[11];
    assign S279_o = S17_window[10];
    assign S280_o = S17_window[9];
    assign S281_o = S17_window[8];
    assign S282_o = S17_window[7];
    assign S283_o = S17_window[6];
    assign S284_o = S17_window[5];
    assign S285_o = S17_window[4];
    assign S286_o = S17_window[3];
    assign S287_o = S17_window[2];
    assign S288_o = S17_window[1];
    assign S289_o = S17_window[0];
    
    
endmodule
