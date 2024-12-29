module Data_modulate_13x13 #(parameter ROWS,
                             parameter COLS)
                            (input clk,
                             input rst,
                             input done_i,
                             input [7:0] data0_i,
                             data1_i,
                             data2_i,
                             data3_i,
                             data4_i,
                             data5_i,
                             data6_i,
                             data7_i,
                             data8_i,
                             data9_i,
                             data10_i,
                             data11_i,
                             data12_i,
                             output reg [7:0] data0_o,
                             data1_o,
                             data2_o,
                             data3_o,
                             data4_o,
                             data5_o,
                             data6_o,
                             data7_o,
                             data8_o,
                             data9_o,
                             data10_o,
                             data11_o,
                             data12_o,
                             data13_o,
                             data14_o,
                             data15_o,
                             data16_o,
                             data17_o,
                             data18_o,
                             data19_o,
                             data20_o,
                             data21_o,
                             data22_o,
                             data23_o,
                             data24_o,
                             data25_o,
                             data26_o,
                             data27_o,
                             data28_o,
                             data29_o,
                             data30_o,
                             data31_o,
                             data32_o,
                             data33_o,
                             data34_o,
                             data35_o,
                             data36_o,
                             data37_o,
                             data38_o,
                             data39_o,
                             data40_o,
                             data41_o,
                             data42_o,
                             data43_o,
                             data44_o,
                             data45_o,
                             data46_o,
                             data47_o,
                             data48_o,
                             data49_o,
                             data50_o,
                             data51_o,
                             data52_o,
                             data53_o,
                             data54_o,
                             data55_o,
                             data56_o,
                             data57_o,
                             data58_o,
                             data59_o,
                             data60_o,
                             data61_o,
                             data62_o,
                             data63_o,
                             data64_o,
                             data65_o,
                             data66_o,
                             data67_o,
                             data68_o,
                             data69_o,
                             data70_o,
                             data71_o,
                             data72_o,
                             data73_o,
                             data74_o,
                             data75_o,
                             data76_o,
                             data77_o,
                             data78_o,
                             data79_o,
                             data80_o,
                             data81_o,
                             data82_o,
                             data83_o,
                             data84_o,
                             data85_o,
                             data86_o,
                             data87_o,
                             data88_o,
                             data89_o,
                             data90_o,
                             data91_o,
                             data92_o,
                             data93_o,
                             data94_o,
                             data95_o,
                             data96_o,
                             data97_o,
                             data98_o,
                             data99_o,
                             data100_o,
                             data101_o,
                             data102_o,
                             data103_o,
                             data104_o,
                             data105_o,
                             data106_o,
                             data107_o,
                             data108_o,
                             data109_o,
                             data110_o,
                             data111_o,
                             data112_o,
                             data113_o,
                             data114_o,
                             data115_o,
                             data116_o,
                             data117_o,
                             data118_o,
                             data119_o,
                             data120_o,
                             data121_o,
                             data122_o,
                             data123_o,
                             data124_o,
                             data125_o,
                             data126_o,
                             data127_o,
                             data128_o,
                             data129_o,
                             data130_o,
                             data131_o,
                             data132_o,
                             data133_o,
                             data134_o,
                             data135_o,
                             data136_o,
                             data137_o,
                             data138_o,
                             data139_o,
                             data140_o,
                             data141_o,
                             data142_o,
                             data143_o,
                             data144_o,
                             data145_o,
                             data146_o,
                             data147_o,
                             data148_o,
                             data149_o,
                             data150_o,
                             data151_o,
                             data152_o,
                             data153_o,
                             data154_o,
                             data155_o,
                             data156_o,
                             data157_o,
                             data158_o,
                             data159_o,
                             data160_o,
                             data161_o,
                             data162_o,
                             data163_o,
                             data164_o,
                             data165_o,
                             data166_o,
                             data167_o,
                             data168_o,
                             output reg done_o);
    
    reg [9:0] i_row, i_col;
    
    reg [7:0] i_counter;
    
    reg [7:0]
    data0,
    data1,
    data2,
    data3,
    data4,
    data5,
    data6,
    data7,
    data8,
    data9,
    data10,
    data11,
    data12,
    data13,
    data14,
    data15,
    data16,
    data17,
    data18,
    data19,
    data20,
    data21,
    data22,
    data23,
    data24,
    data25,
    data26,
    data27,
    data28,
    data29,
    data30,
    data31,
    data32,
    data33,
    data34,
    data35,
    data36,
    data37,
    data38,
    data39,
    data40,
    data41,
    data42,
    data43,
    data44,
    data45,
    data46,
    data47,
    data48,
    data49,
    data50,
    data51,
    data52,
    data53,
    data54,
    data55,
    data56,
    data57,
    data58,
    data59,
    data60,
    data61,
    data62,
    data63,
    data64,
    data65,
    data66,
    data67,
    data68,
    data69,
    data70,
    data71,
    data72,
    data73,
    data74,
    data75,
    data76,
    data77,
    data78,
    data79,
    data80,
    data81,
    data82,
    data83,
    data84,
    data85,
    data86,
    data87,
    data88,
    data89,
    data90,
    data91,
    data92,
    data93,
    data94,
    data95,
    data96,
    data97,
    data98,
    data99,
    data100,
    data101,
    data102,
    data103,
    data104,
    data105,
    data106,
    data107,
    data108,
    data109,
    data110,
    data111,
    data112,
    data113,
    data114,
    data115,
    data116,
    data117,
    data118,
    data119,
    data120,
    data121,
    data122,
    data123,
    data124,
    data125,
    data126,
    data127,
    data128,
    data129,
    data130,
    data131,
    data132,
    data133,
    data134,
    data135,
    data136,
    data137,
    data138,
    data139,
    data140,
    data141,
    data142,
    data143,
    data144,
    data145,
    data146,
    data147,
    data148,
    data149,
    data150,
    data151,
    data152,
    data153,
    data154,
    data155,
    data156,
    data157,
    data158,
    data159,
    data160,
    data161,
    data162,
    data163,
    data164,
    data165,
    data166,
    data167,
    data168;
    
    
    reg done_reg;
    assign done_o = (i_counter == 7 && done_reg == 0) ? 1 : 0;
    
    // handle with i rows and i cols
    
    always @(posedge clk) begin
        if (rst) begin
            i_row    <= 0;
            i_col    <= 0;
            done_reg <= 0;
            end else begin
            if (done_o) begin
                i_col < = (i_col == COLS - 1) ? 0 : i_col + 1;
                
                if (i_col == COLS - 1) begin
                    if (i_row == ROWS - 1) begin
                        done_reg <= 1;
                    end
                    i_row < = (i_row == ROWS - 1) ? 0 : i_row + 1;
                end
            end
        end
    end
    
    
    always @(posedge clk) begin
        if (rst) begin
            
            i_counter <= 0;
            end else begin
            if (done_i) begin
                i_counter < = (i_counter == 7) ? i_counter : i_counter + 1;
            end
            
            
        end
        
    end
    
    
    always @(*) begin
        if (rst) begin
            data0_o   <= 0;
            data1_o   <= 0;
            data2_o   <= 0;
            data3_o   <= 0;
            data4_o   <= 0;
            data5_o   <= 0;
            data6_o   <= 0;
            data7_o   <= 0;
            data8_o   <= 0;
            data9_o   <= 0;
            data10_o  <= 0;
            data11_o  <= 0;
            data12_o  <= 0;
            data13_o  <= 0;
            data14_o  <= 0;
            data15_o  <= 0;
            data16_o  <= 0;
            data17_o  <= 0;
            data18_o  <= 0;
            data19_o  <= 0;
            data20_o  <= 0;
            data21_o  <= 0;
            data22_o  <= 0;
            data23_o  <= 0;
            data24_o  <= 0;
            data25_o  <= 0;
            data26_o  <= 0;
            data27_o  <= 0;
            data28_o  <= 0;
            data29_o  <= 0;
            data30_o  <= 0;
            data31_o  <= 0;
            data32_o  <= 0;
            data33_o  <= 0;
            data34_o  <= 0;
            data35_o  <= 0;
            data36_o  <= 0;
            data37_o  <= 0;
            data38_o  <= 0;
            data39_o  <= 0;
            data40_o  <= 0;
            data41_o  <= 0;
            data42_o  <= 0;
            data43_o  <= 0;
            data44_o  <= 0;
            data45_o  <= 0;
            data46_o  <= 0;
            data47_o  <= 0;
            data48_o  <= 0;
            data49_o  <= 0;
            data50_o  <= 0;
            data51_o  <= 0;
            data52_o  <= 0;
            data53_o  <= 0;
            data54_o  <= 0;
            data55_o  <= 0;
            data56_o  <= 0;
            data57_o  <= 0;
            data58_o  <= 0;
            data59_o  <= 0;
            data60_o  <= 0;
            data61_o  <= 0;
            data62_o  <= 0;
            data63_o  <= 0;
            data64_o  <= 0;
            data65_o  <= 0;
            data66_o  <= 0;
            data67_o  <= 0;
            data68_o  <= 0;
            data69_o  <= 0;
            data70_o  <= 0;
            data71_o  <= 0;
            data72_o  <= 0;
            data73_o  <= 0;
            data74_o  <= 0;
            data75_o  <= 0;
            data76_o  <= 0;
            data77_o  <= 0;
            data78_o  <= 0;
            data79_o  <= 0;
            data80_o  <= 0;
            data81_o  <= 0;
            data82_o  <= 0;
            data83_o  <= 0;
            data84_o  <= 0;
            data85_o  <= 0;
            data86_o  <= 0;
            data87_o  <= 0;
            data88_o  <= 0;
            data89_o  <= 0;
            data90_o  <= 0;
            data91_o  <= 0;
            data92_o  <= 0;
            data93_o  <= 0;
            data94_o  <= 0;
            data95_o  <= 0;
            data96_o  <= 0;
            data97_o  <= 0;
            data98_o  <= 0;
            data99_o  <= 0;
            data100_o <= 0;
            data101_o <= 0;
            data102_o <= 0;
            data103_o <= 0;
            data104_o <= 0;
            data105_o <= 0;
            data106_o <= 0;
            data107_o <= 0;
            data108_o <= 0;
            data109_o <= 0;
            data110_o <= 0;
            data111_o <= 0;
            data112_o <= 0;
            data113_o <= 0;
            data114_o <= 0;
            data115_o <= 0;
            data116_o <= 0;
            data117_o <= 0;
            data118_o <= 0;
            data119_o <= 0;
            data120_o <= 0;
            data121_o <= 0;
            data122_o <= 0;
            data123_o <= 0;
            data124_o <= 0;
            data125_o <= 0;
            data126_o <= 0;
            data127_o <= 0;
            data128_o <= 0;
            data129_o <= 0;
            data130_o <= 0;
            data131_o <= 0;
            data132_o <= 0;
            data133_o <= 0;
            data134_o <= 0;
            data135_o <= 0;
            data136_o <= 0;
            data137_o <= 0;
            data138_o <= 0;
            data139_o <= 0;
            data140_o <= 0;
            data141_o <= 0;
            data142_o <= 0;
            data143_o <= 0;
            data144_o <= 0;
            data145_o <= 0;
            data146_o <= 0;
            data147_o <= 0;
            data148_o <= 0;
            data149_o <= 0;
            data150_o <= 0;
            data151_o <= 0;
            data152_o <= 0;
            data153_o <= 0;
            data154_o <= 0;
            data155_o <= 0;
            data156_o <= 0;
            data157_o <= 0;
            data158_o <= 0;
            data159_o <= 0;
            data160_o <= 0;
            data161_o <= 0;
            data162_o <= 0;
            data163_o <= 0;
            data164_o <= 0;
            data165_o <= 0;
            data166_o <= 0;
            data167_o <= 0;
            data168_o <= 0;
            end else begin
            // zero padding
            if (done_o) begin
                data0_o  <= (i_row < 6 || i_col < 6) ? 0 : data0;
                data1_o  <= (i_row < 6 || i_col < 5) ? 0 : data1;
                data2_o  <= (i_row < 6 || i_col < 4) ? 0 : data2;
                data3_o  <= (i_row < 6 || i_col < 3) ? 0 : data3;
                data4_o  <= (i_row < 6 || i_col < 2) ? 0 : data4;
                data5_o  <= (i_row < 6 || i_col < 1) ? 0 : data5;
                data6_o  <= (i_row < 6) ? 0 : data6;
                data7_o  <= (i_row < 6 || i_col > COLS - 2) ? 0 : data7;
                data8_o  <= (i_row < 6 || i_col > COLS - 3) ? 0 : data8;
                data9_o  <= (i_row < 6 || i_col > COLS - 4) ? 0 : data9;
                data10_o <= (i_row < 6 || i_col > COLS - 5) ? 0 : data10;
                data11_o <= (i_row < 6 || i_col > COLS - 6) ? 0 : data11;
                data12_o <= (i_row < 6 || i_col > COLS - 7) ? 0 : data12;
                
                data13_o <= (i_row < 5 || i_col < 6) ? 0 : data13;
                data14_o <= (i_row < 5 || i_col < 5) ? 0 : data14;
                data15_o <= (i_row < 5 || i_col < 4) ? 0 : data15;
                data16_o <= (i_row < 5 || i_col < 3) ? 0 : data16;
                data17_o <= (i_row < 5 || i_col < 2) ? 0 : data17;
                data18_o <= (i_row < 5 || i_col < 1) ? 0 : data18;
                data19_o <= (i_row < 5) ? 0 : data19;
                data20_o <= (i_row < 5 || i_col > COLS - 2) ? 0 : data20;
                data21_o <= (i_row < 5 || i_col > COLS - 3) ? 0 : data21;
                data22_o <= (i_row < 5 || i_col > COLS - 4) ? 0 : data22;
                data23_o <= (i_row < 5 || i_col > COLS - 5) ? 0 : data23;
                data24_o <= (i_row < 5 || i_col > COLS - 6) ? 0 : data24;
                data25_o <= (i_row < 5 || i_col > COLS - 7) ? 0 : data25;
                
                
                data26_o <= (i_row < 4 || i_col < 6) ? 0 : data26;
                data27_o <= (i_row < 4 || i_col < 5) ? 0 : data27;
                data28_o <= (i_row < 4 || i_col < 4) ? 0 : data28;
                data29_o <= (i_row < 4 || i_col < 3) ? 0 : data29;
                data30_o <= (i_row < 4 || i_col < 2) ? 0 : data30;
                data31_o <= (i_row < 4 || i_col < 1) ? 0 : data31;
                data32_o <= (i_row < 4) ? 0 : data32;
                data33_o <= (i_row < 4 || i_col > COLS - 2) ? 0 : data33;
                data34_o <= (i_row < 4 || i_col > COLS - 3) ? 0 : data34;
                data35_o <= (i_row < 4 || i_col > COLS - 4) ? 0 : data35;
                data36_o <= (i_row < 4 || i_col > COLS - 5) ? 0 : data36;
                data37_o <= (i_row < 4 || i_col > COLS - 6) ? 0 : data37;
                data38_o <= (i_row < 4 || i_col > COLS - 7) ? 0 : data38;
                
                data39_o <= (i_row < 3 || i_col < 6) ? 0 : data39;
                data40_o <= (i_row < 3 || i_col < 5) ? 0 : data40;
                data41_o <= (i_row < 3 || i_col < 4) ? 0 : data41;
                data42_o <= (i_row < 3 || i_col < 3) ? 0 : data42;
                data43_o <= (i_row < 3 || i_col < 2) ? 0 : data43;
                data44_o <= (i_row < 3 || i_col < 1) ? 0 : data44;
                data45_o <= (i_row < 3) ? 0 : data45;
                data46_o <= (i_row < 3 || i_col > COLS - 2) ? 0 : data46;
                data47_o <= (i_row < 3 || i_col > COLS - 3) ? 0 : data47;
                data48_o <= (i_row < 3 || i_col > COLS - 4) ? 0 : data48;
                data49_o <= (i_row < 3 || i_col > COLS - 5) ? 0 : data49;
                data50_o <= (i_row < 3 || i_col > COLS - 6) ? 0 : data50;
                data51_o <= (i_row < 3 || i_col > COLS - 7) ? 0 : data51;
                
                
                data52_o <= (i_row < 2 || i_col < 6) ? 0 : data52;
                data53_o <= (i_row < 2 || i_col < 5) ? 0 : data53;
                data54_o <= (i_row < 2 || i_col < 4) ? 0 : data54;
                data55_o <= (i_row < 2 || i_col < 3) ? 0 : data55;
                data56_o <= (i_row < 2 || i_col < 2) ? 0 : data56;
                data57_o <= (i_row < 2 || i_col < 1) ? 0 : data57;
                data58_o <= (i_row < 2) ? 0 : data58;
                data59_o <= (i_row < 2 || i_col > COLS - 2) ? 0 : data59;
                data60_o <= (i_row < 2 || i_col > COLS - 3) ? 0 : data60;
                data61_o <= (i_row < 2 || i_col > COLS - 4) ? 0 : data61;
                data62_o <= (i_row < 2 || i_col > COLS - 5) ? 0 : data62;
                data63_o <= (i_row < 2 || i_col > COLS - 6) ? 0 : data63;
                data64_o <= (i_row < 2 || i_col > COLS - 7) ? 0 : data64;
                
                data65_o <= (i_row < 1 || i_col < 6) ? 0 : data65;
                data66_o <= (i_row < 1 || i_col < 5) ? 0 : data66;
                data67_o <= (i_row < 1 || i_col < 4) ? 0 : data67;
                data68_o <= (i_row < 1 || i_col < 3) ? 0 : data68;
                data69_o <= (i_row < 1 || i_col < 2) ? 0 : data69;
                data70_o <= (i_row < 1 || i_col < 1) ? 0 : data70;
                data71_o <= (i_row < 1) ? 0 : data71;
                data72_o <= (i_row < 1 || i_col > COLS - 2) ? 0 : data72;
                data73_o <= (i_row < 1 || i_col > COLS - 3) ? 0 : data73;
                data74_o <= (i_row < 1 || i_col > COLS - 4) ? 0 : data74;
                data75_o <= (i_row < 1 || i_col > COLS - 5) ? 0 : data75;
                data76_o <= (i_row < 1 || i_col > COLS - 6) ? 0 : data76;
                data77_o <= (i_row < 1 || i_col > COLS - 7) ? 0 : data77;
                
                
                data78_o <= (i_col < 6) ? 0 : data78;
                data79_o <= (i_col < 5) ? 0 : data79;
                data80_o <= (i_col < 4) ? 0 : data80;
                data81_o <= (i_col < 3) ? 0 : data81;
                data82_o <= (i_col < 2) ? 0 : data82;
                data83_o <= (i_col < 1) ? 0 : data83;
                data84_o <= data84;
                data85_o <= (i_col > COLS - 2) ? 0 : data85;
                data86_o <= (i_col > COLS - 3) ? 0 : data86;
                data87_o <= (i_col > COLS - 4) ? 0 : data87;
                data88_o <= (i_col > COLS - 5) ? 0 : data88;
                data89_o <= (i_col > COLS - 6) ? 0 : data89;
                data90_o <= (i_col > COLS - 7) ? 0 : data90;
                
                
                data91_o  <= (i_row > ROWS - 2 || i_col < 6) ? 0 : data91;
                data92_o  <= (i_row > ROWS - 2 || i_col < 5) ? 0 : data92;
                data93_o  <= (i_row > ROWS - 2 || i_col < 4) ? 0 : data93;
                data94_o  <= (i_row > ROWS - 2 || i_col < 3) ? 0 : data94;
                data95_o  <= (i_row > ROWS - 2 || i_col < 2) ? 0 : data95;
                data96_o  <= (i_row > ROWS - 2 || i_col < 1) ? 0 : data96;
                data97_o  <= (i_row > ROWS - 2) ? 0 : data97;
                data98_o  <= (i_row > ROWS - 2 || i_col > COLS - 2) ? 0 : data98;
                data99_o  <= (i_row > ROWS - 2 || i_col > COLS - 3) ? 0 : data99;
                data100_o <= (i_row > ROWS - 2 || i_col > COLS - 4) ? 0 : data100;
                data101_o <= (i_row > ROWS - 2 || i_col > COLS - 5) ? 0 : data101;
                data102_o <= (i_row > ROWS - 2 || i_col > COLS - 6) ? 0 : data102;
                data103_o <= (i_row > ROWS - 2 || i_col > COLS - 7) ? 0 : data103;
                
                data104_o <= (i_row > ROWS - 3 || i_col < 6) ? 0 : data104;
                data105_o <= (i_row > ROWS - 3 || i_col < 5) ? 0 : data105;
                data106_o <= (i_row > ROWS - 3 || i_col < 4) ? 0 : data106;
                data107_o <= (i_row > ROWS - 3 || i_col < 3) ? 0 : data107;
                data108_o <= (i_row > ROWS - 3 || i_col < 2) ? 0 : data108;
                data109_o <= (i_row > ROWS - 3 || i_col < 1) ? 0 : data109;
                data110_o <= (i_row > ROWS - 3) ? 0 : data110;
                data111_o <= (i_row > ROWS - 3 || i_col > COLS - 2) ? 0 : data111;
                data112_o <= (i_row > ROWS - 3 || i_col > COLS - 3) ? 0 : data112;
                data113_o <= (i_row > ROWS - 3 || i_col > COLS - 4) ? 0 : data113;
                data114_o <= (i_row > ROWS - 3 || i_col > COLS - 5) ? 0 : data114;
                data115_o <= (i_row > ROWS - 3 || i_col > COLS - 6) ? 0 : data115;
                data116_o <= (i_row > ROWS - 3 || i_col > COLS - 7) ? 0 : data116;
                
                
                data117_o <= (i_row > ROWS - 4 || i_col < 6) ? 0 : data117;
                data118_o <= (i_row > ROWS - 4 || i_col < 5) ? 0 : data118;
                data119_o <= (i_row > ROWS - 4 || i_col < 4) ? 0 : data119;
                data120_o <= (i_row > ROWS - 4 || i_col < 3) ? 0 : data120;
                data121_o <= (i_row > ROWS - 4 || i_col < 2) ? 0 : data121;
                data122_o <= (i_row > ROWS - 4 || i_col < 1) ? 0 : data122;
                data123_o <= (i_row > ROWS - 4) ? 0 : data123;
                data124_o <= (i_row > ROWS - 4 || i_col > COLS - 2) ? 0 : data124;
                data125_o <= (i_row > ROWS - 4 || i_col > COLS - 3) ? 0 : data125;
                data126_o <= (i_row > ROWS - 4 || i_col > COLS - 4) ? 0 : data126;
                data127_o <= (i_row > ROWS - 4 || i_col > COLS - 5) ? 0 : data127;
                data128_o <= (i_row > ROWS - 4 || i_col > COLS - 6) ? 0 : data128;
                data129_o <= (i_row > ROWS - 4 || i_col > COLS - 7) ? 0 : data129;
                
                
                data130_o <= (i_row > ROWS - 5 || i_col < 6) ? 0 : data130;
                data131_o <= (i_row > ROWS - 5 || i_col < 5) ? 0 : data131;
                data132_o <= (i_row > ROWS - 5 || i_col < 4) ? 0 : data132;
                data133_o <= (i_row > ROWS - 5 || i_col < 3) ? 0 : data133;
                data134_o <= (i_row > ROWS - 5 || i_col < 2) ? 0 : data134;
                data135_o <= (i_row > ROWS - 5 || i_col < 1) ? 0 : data135;
                data136_o <= (i_row > ROWS - 5) ? 0 : data136;
                data137_o <= (i_row > ROWS - 5 || i_col > COLS - 2) ? 0 : data137;
                data138_o <= (i_row > ROWS - 5 || i_col > COLS - 3) ? 0 : data138;
                data139_o <= (i_row > ROWS - 5 || i_col > COLS - 4) ? 0 : data139;
                data140_o <= (i_row > ROWS - 5 || i_col > COLS - 5) ? 0 : data140;
                data141_o <= (i_row > ROWS - 5 || i_col > COLS - 6) ? 0 : data141;
                data142_o <= (i_row > ROWS - 5 || i_col > COLS - 7) ? 0 : data142;
                
                data143_o <= (i_row > ROWS - 6 || i_col < 6) ? 0 : data143;
                data144_o <= (i_row > ROWS - 6 || i_col < 5) ? 0 : data144;
                data145_o <= (i_row > ROWS - 6 || i_col < 4) ? 0 : data145;
                data146_o <= (i_row > ROWS - 6 || i_col < 3) ? 0 : data146;
                data147_o <= (i_row > ROWS - 6 || i_col < 2) ? 0 : data147;
                data148_o <= (i_row > ROWS - 6 || i_col < 1) ? 0 : data148;
                data149_o <= (i_row > ROWS - 6) ? 0 : data149;
                data150_o <= (i_row > ROWS - 6 || i_col > COLS - 2) ? 0 : data150;
                data151_o <= (i_row > ROWS - 6 || i_col > COLS - 3) ? 0 : data151;
                data152_o <= (i_row > ROWS - 6 || i_col > COLS - 4) ? 0 : data152;
                data153_o <= (i_row > ROWS - 6 || i_col > COLS - 5) ? 0 : data153;
                data154_o <= (i_row > ROWS - 6 || i_col > COLS - 6) ? 0 : data154;
                data155_o <= (i_row > ROWS - 6 || i_col > COLS - 7) ? 0 : data155;
                
                data156_o <= (i_row > ROWS - 7 || i_col < 6) ? 0 : data156;
                data157_o <= (i_row > ROWS - 7 || i_col < 5) ? 0 : data157;
                data158_o <= (i_row > ROWS - 7 || i_col < 4) ? 0 : data158;
                data159_o <= (i_row > ROWS - 7 || i_col < 3) ? 0 : data159;
                data160_o <= (i_row > ROWS - 7 || i_col < 2) ? 0 : data160;
                data161_o <= (i_row > ROWS - 7 || i_col < 1) ? 0 : data161;
                data162_o <= (i_row > ROWS - 7) ? 0 : data162;
                data163_o <= (i_row > ROWS - 7 || i_col > COLS - 2) ? 0 : data163;
                data164_o <= (i_row > ROWS - 7 || i_col > COLS - 3) ? 0 : data164;
                data165_o <= (i_row > ROWS - 7 || i_col > COLS - 4) ? 0 : data165;
                data166_o <= (i_row > ROWS - 7 || i_col > COLS - 5) ? 0 : data166;
                data167_o <= (i_row > ROWS - 7 || i_col > COLS - 6) ? 0 : data167;
                data168_o <= (i_row > ROWS - 7 || i_col > COLS - 7) ? 0 : data168;
                
            end
        end
    end
    
    always @(posedge clk) begin
        if (rst) begin
            data0   <= 0;
            data1   <= 0;
            data2   <= 0;
            data3   <= 0;
            data4   <= 0;
            data5   <= 0;
            data6   <= 0;
            data7   <= 0;
            data8   <= 0;
            data9   <= 0;
            data10  <= 0;
            data11  <= 0;
            data12  <= 0;
            data13  <= 0;
            data14  <= 0;
            data15  <= 0;
            data16  <= 0;
            data17  <= 0;
            data18  <= 0;
            data19  <= 0;
            data20  <= 0;
            data21  <= 0;
            data22  <= 0;
            data23  <= 0;
            data24  <= 0;
            data25  <= 0;
            data26  <= 0;
            data27  <= 0;
            data28  <= 0;
            data29  <= 0;
            data30  <= 0;
            data31  <= 0;
            data32  <= 0;
            data33  <= 0;
            data34  <= 0;
            data35  <= 0;
            data36  <= 0;
            data37  <= 0;
            data38  <= 0;
            data39  <= 0;
            data40  <= 0;
            data41  <= 0;
            data42  <= 0;
            data43  <= 0;
            data44  <= 0;
            data45  <= 0;
            data46  <= 0;
            data47  <= 0;
            data48  <= 0;
            data49  <= 0;
            data50  <= 0;
            data51  <= 0;
            data52  <= 0;
            data53  <= 0;
            data54  <= 0;
            data55  <= 0;
            data56  <= 0;
            data57  <= 0;
            data58  <= 0;
            data59  <= 0;
            data60  <= 0;
            data61  <= 0;
            data62  <= 0;
            data63  <= 0;
            data64  <= 0;
            data65  <= 0;
            data66  <= 0;
            data67  <= 0;
            data68  <= 0;
            data69  <= 0;
            data70  <= 0;
            data71  <= 0;
            data72  <= 0;
            data73  <= 0;
            data74  <= 0;
            data75  <= 0;
            data76  <= 0;
            data77  <= 0;
            data78  <= 0;
            data79  <= 0;
            data80  <= 0;
            data81  <= 0;
            data82  <= 0;
            data83  <= 0;
            data84  <= 0;
            data85  <= 0;
            data86  <= 0;
            data87  <= 0;
            data88  <= 0;
            data89  <= 0;
            data90  <= 0;
            data91  <= 0;
            data92  <= 0;
            data93  <= 0;
            data94  <= 0;
            data95  <= 0;
            data96  <= 0;
            data97  <= 0;
            data98  <= 0;
            data99  <= 0;
            data100 <= 0;
            data101 <= 0;
            data102 <= 0;
            data103 <= 0;
            data104 <= 0;
            data105 <= 0;
            data106 <= 0;
            data107 <= 0;
            data108 <= 0;
            data109 <= 0;
            data110 <= 0;
            data111 <= 0;
            data112 <= 0;
            data113 <= 0;
            data114 <= 0;
            data115 <= 0;
            data116 <= 0;
            data117 <= 0;
            data118 <= 0;
            data119 <= 0;
            data120 <= 0;
            data121 <= 0;
            data122 <= 0;
            data123 <= 0;
            data124 <= 0;
            data125 <= 0;
            data126 <= 0;
            data127 <= 0;
            data128 <= 0;
            data129 <= 0;
            data130 <= 0;
            data131 <= 0;
            data132 <= 0;
            data133 <= 0;
            data134 <= 0;
            data135 <= 0;
            data136 <= 0;
            data137 <= 0;
            data138 <= 0;
            data139 <= 0;
            data140 <= 0;
            data141 <= 0;
            data142 <= 0;
            data143 <= 0;
            data144 <= 0;
            data145 <= 0;
            data146 <= 0;
            data147 <= 0;
            data148 <= 0;
            data149 <= 0;
            data150 <= 0;
            data151 <= 0;
            data152 <= 0;
            data153 <= 0;
            data154 <= 0;
            data155 <= 0;
            data156 <= 0;
            data157 <= 0;
            data158 <= 0;
            data159 <= 0;
            data160 <= 0;
            data161 <= 0;
            data162 <= 0;
            data163 <= 0;
            data164 <= 0;
            data165 <= 0;
            data166 <= 0;
            data167 <= 0;
            data168 <= 0;
            
            end else begin
            // d7 d6 d5 d4 d3 d2 d1
            if (done_i) begin
                data0  <= data1;
                data1  <= data2;
                data2  <= data3;
                data3  <= data4;
                data4  <= data5;
                data5  <= data6;
                data6  <= data7;
                data7  <= data8;
                data8  <= data9;
                data9  <= data10;
                data10 <= data11;
                data11 <= data12;
                data12 <= data12_i;
                
                data13 <= data14;
                data14 <= data15;
                data15 <= data16;
                data16 <= data17;
                data17 <= data18;
                data18 <= data19;
                data19 <= data20;
                data20 <= data21;
                data21 <= data22;
                data22 <= data23;
                data23 <= data24;
                data24 <= data25;
                data25 <= data11_i;
                
                data26 <= data27;
                data27 <= data28;
                data28 <= data29;
                data29 <= data30;
                data30 <= data31;
                data31 <= data32;
                data32 <= data33;
                data33 <= data34;
                data34 <= data35;
                data35 <= data36;
                data36 <= data37;
                data37 <= data38;
                data38 <= data10_i;  // Assign data10_i to data38
                
                data39 <= data40;
                data40 <= data41;
                data41 <= data42;
                data42 <= data43;
                data43 <= data44;
                data44 <= data45;
                data45 <= data46;
                data46 <= data47;
                data47 <= data48;
                data48 <= data49;
                data49 <= data50;
                data50 <= data51;
                data51 <= data9_i;  // Assign data9_i to data51
                
                data52 <= data53;
                data53 <= data54;
                data54 <= data55;
                data55 <= data56;
                data56 <= data57;
                data57 <= data58;
                data58 <= data59;
                data59 <= data60;
                data60 <= data61;
                data61 <= data62;
                data62 <= data63;
                data63 <= data64;
                data64 <= data8_i;  // Assign data8_i to data64
                
                data65 <= data66;
                data66 <= data67;
                data67 <= data68;
                data68 <= data69;
                data69 <= data70;
                data70 <= data71;
                data71 <= data72;
                data72 <= data73;
                data73 <= data74;
                data74 <= data75;
                data75 <= data76;
                data76 <= data77;
                data77 <= data7_i;  // Assign data7_i to data77
                
                data78 <= data79;
                data79 <= data80;
                data80 <= data81;
                data81 <= data82;
                data82 <= data83;
                data83 <= data84;
                data84 <= data85;
                data85 <= data86;
                data86 <= data87;
                data87 <= data88;
                data88 <= data89;
                data89 <= data90;
                data90 <= data6_i;  // Assign data6_i to data90
                
                // Eighth set of 13 registers: Shift and assign input data
                data91  <= data92;
                data92  <= data93;
                data93  <= data94;
                data94  <= data95;
                data95  <= data96;
                data96  <= data97;
                data97  <= data98;
                data98  <= data99;
                data99  <= data100;
                data100 <= data101;
                data101 <= data102;
                data102 <= data102;
                data103 <= data5_i;
                
                
                data104 <= data105;
                data105 <= data106;
                data106 <= data107;
                data107 <= data108;
                data108 <= data109;
                data109 <= data110;
                data110 <= data111;
                data111 <= data112;
                data112 <= data113;
                data113 <= data114;
                data114 <= data115;
                data115 <= data116;
                data116 <= data4_i;  // Assign data4_i to data116
                
                data117 <= data118;
                data118 <= data119;
                data119 <= data120;
                data120 <= data121;
                data121 <= data122;
                data122 <= data123;
                data123 <= data124;
                data124 <= data125;
                data125 <= data126;
                data126 <= data127;
                data127 <= data128;
                data128 <= data129;
                data129 <= data3_i;  // Assign data3_i to data129
                
                data130 <= data131;
                data131 <= data132;
                data132 <= data133;
                data133 <= data134;
                data134 <= data135;
                data135 <= data136;
                data136 <= data137;
                data137 <= data138;
                data138 <= data139;
                data139 <= data140;
                data140 <= data141;
                data141 <= data142;
                data142 <= data2_i;  // Assign data2_i to data142
                
                
                data143 <= data144;
                data144 <= data145;
                data145 <= data146;
                data146 <= data147;
                data147 <= data148;
                data148 <= data149;
                data149 <= data150;
                data150 <= data151;
                data151 <= data152;
                data152 <= data153;
                data153 <= data154;
                data154 <= data155;
                data155 <= data1_i;  // Assign data1_i to data155
                
                
                data156 <= data157;
                data157 <= data158;
                data158 <= data159;
                data159 <= data160;
                data160 <= data161;
                data161 <= data162;
                data162 <= data163;
                data163 <= data164;
                data164 <= data165;
                data165 <= data166;
                data166 <= data167;
                data167 <= data168;
                data168 <= data0_i;  // Assign data0_i to data168
            end
            
        end
    end
    
endmodule
