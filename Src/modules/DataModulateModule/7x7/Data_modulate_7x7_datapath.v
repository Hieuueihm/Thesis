module Data_modulate_7x7_datapath #(parameter ROWS = 7,
                                    parameter COLS = 7)
                                   (input clk,
                                    input rst,
                                    input [7:0] d0_i,
                                    input [7:0] d1_i,
                                    input [7:0] d2_i,
                                    input [7:0] d3_i,
                                    input [7:0] d4_i,
                                    input [7:0] d5_i,
                                    input [7:0] d6_i,
                                    input [7:0] d7_i,
                                    input [7:0] d8_i,
                                    input start,
                                    input done_o,
                                    output reg [7:0] d0_o,
                                    output reg [7:0] d1_o,
                                    output reg [7:0] d2_o,
                                    output reg [7:0] d3_o,
                                    output reg [7:0] d4_o,
                                    output reg [7:0] d5_o,
                                    output reg [7:0] d6_o,
                                    output reg [7:0] d7_o,
                                    output reg [7:0] d8_o,
                                    output reg [7:0] d9_o,
                                    output reg [7:0] d10_o,
                                    output reg [7:0] d11_o,
                                    output reg [7:0] d12_o,
                                    output reg [7:0] d13_o,
                                    output reg [7:0] d14_o,
                                    output reg [7:0] d15_o,
                                    output reg [7:0] d16_o,
                                    output reg [7:0] d17_o,
                                    output reg [7:0] d18_o,
                                    output reg [7:0] d19_o,
                                    output reg [7:0] d20_o,
                                    output reg [7:0] d21_o,
                                    output reg [7:0] d22_o,
                                    output reg [7:0] d23_o,
                                    output reg [7:0] d24_o,
                                    output reg [7:0] d25_o,
                                    output reg [7:0] d26_o,
                                    output reg [7:0] d27_o,
                                    output reg [7:0] d28_o,
                                    output reg [7:0] d29_o,
                                    output reg [7:0] d30_o,
                                    output reg [7:0] d31_o,
                                    output reg [7:0] d32_o,
                                    output reg [7:0] d33_o,
                                    output reg [7:0] d34_o,
                                    output reg [7:0] d35_o,
                                    output reg [7:0] d36_o,
                                    output reg [7:0] d37_o,
                                    output reg [7:0] d38_o,
                                    output reg [7:0] d39_o,
                                    output reg [7:0] d40_o,
                                    output reg [7:0] d41_o,
                                    output reg [7:0] d42_o,
                                    output reg [7:0] d43_o,
                                    output reg [7:0] d44_o,
                                    output reg [7:0] d45_o,
                                    output reg [7:0] d46_o,
                                    output reg [7:0] d47_o,
                                    output reg [7:0] d48_o,
                                    output reg done_reg,
                                    output [2:0] i_counter);
    // ----- d0 d1 d2 d3 d4 -----
    // ----- d5 d6 d7 d8 d9 -----
    // ----- d10 d11 d12 d13 d13 -----;
    // ----- d15 d16 d17 d18 d19 -----;
    // ----- d20 d21 d22 d23 d24 -----;
    wire [9:0] i_row, i_col;
    wire [9:0] i_col_plus_1, i_row_plus_1;
    wire [2:0] i_counter_plus_1;
    
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
    data48;
    
    
    plus_1 #(.WIDTH(10))
    COL_PLUS
    (
    .rst(rst),
    .clk(clk),
    .en(done_o),
    .D(i_col),
    .Q(i_col_plus_1)
    );
    
    plus_1 #(.WIDTH(10))
    
    ROW_PLUS (
    .rst(rst),
    .clk(clk),
    .en(done_o && (i_col == COLS - 1)),
    .D(i_row),
    .Q(i_row_plus_1)
    );
    
    plus_1 #(.WIDTH(3))
    COUNTER_I
    (
    .rst(rst),
    .clk(clk),
    .en(start),
    .D(i_counter),
    .Q(i_counter_plus_1)
    );
    assign i_col     = (i_col_plus_1 == COLS) ? 0 : i_col_plus_1;
    assign i_row     = (i_row_plus_1 == ROWS) ? 0: i_row_plus_1;
    assign i_counter = (i_counter_plus_1 == 5) ? i_counter : i_counter_plus_1;
    // handle with i rows and i cols
    
    always @(posedge clk) begin
        if (rst) begin
            done_reg <= 0;
            end else begin
            if (done_o) begin
                if (i_col == COLS - 1) begin
                    if (i_row == ROWS - 1) begin
                        done_reg <= 1;
                    end
                    
                end
            end
        end
    end
    
    
    
    always @(*) begin
        if (rst) begin
            d0_o  <= 0;
            d1_o  <= 0;
            d2_o  <= 0;
            d3_o  <= 0;
            d4_o  <= 0;
            d5_o  <= 0;
            d6_o  <= 0;
            d7_o  <= 0;
            d8_o  <= 0;
            d9_o  <= 0;
            d10_o <= 0;
            d11_o <= 0;
            d12_o <= 0;
            d13_o <= 0;
            d14_o <= 0;
            d15_o <= 0;
            d16_o <= 0;
            d17_o <= 0;
            d18_o <= 0;
            d19_o <= 0;
            d20_o <= 0;
            d21_o <= 0;
            d22_o <= 0;
            d23_o <= 0;
            d24_o <= 0;
            d25_o <= 0;
            d26_o <= 0;
            d27_o <= 0;
            d28_o <= 0;
            d29_o <= 0;
            d30_o <= 0;
            d31_o <= 0;
            d32_o <= 0;
            d33_o <= 0;
            d34_o <= 0;
            d35_o <= 0;
            d36_o <= 0;
            d37_o <= 0;
            d38_o <= 0;
            d39_o <= 0;
            d40_o <= 0;
            d41_o <= 0;
            d42_o <= 0;
            d43_o <= 0;
            d44_o <= 0;
            d45_o <= 0;
            d46_o <= 0;
            d47_o <= 0;
            d48_o <= 0;
            
            end else begin
            // zero padding
            if (done_o) begin
                d0_o <= (i_row < 3 || i_col < 3) ?  0: data0;
                d1_o <= (i_row < 3 || i_col < 2) ? 0 : data1;
                d2_o <= (i_row < 3 || i_col < 1) ? 0 : data2;
                d3_o <= (i_row < 3) ? 0 : data3;
                d4_o <= (i_row < 3 || i_col > COLS - 2) ? 0 : data4;
                d5_o <= (i_row < 3 || i_col > COLS - 3) ? 0 : data5;
                d6_o <= (i_row < 3 || i_col > COLS - 4) ? 0 : data6;
                
                d7_o  <= (i_row < 2 || i_col < 3) ?  0: data7;
                d8_o  <= (i_row < 2 || i_col < 2) ? 0 : data8;
                d9_o  <= (i_row < 2 || i_col < 1) ? 0 : data9;
                d10_o <= (i_row < 2) ? 0 : data10;
                d11_o <= (i_row < 2 || i_col > COLS - 2) ? 0 : data11;
                d12_o <= (i_row < 2 || i_col > COLS - 3) ? 0 : data12;
                d13_o <= (i_row < 2 || i_col > COLS - 4) ? 0 : data13;
                
                d14_o <= (i_row < 1 || i_col < 3) ?  0: data14;
                d15_o <= (i_row < 1 || i_col < 2) ? 0 : data15;
                d16_o <= (i_row < 1 || i_col < 1) ? 0 : data16;
                d17_o <= (i_row < 1) ? 0 : data17;
                d18_o <= (i_row < 1 || i_col > COLS - 2) ? 0 : data18;
                d19_o <= (i_row < 1 || i_col > COLS - 3) ? 0 : data19;
                d20_o <= (i_row < 1 || i_col > COLS - 4) ? 0 : data20;
                
                d21_o <= (i_col < 3) ?  0: data21;
                d22_o <= (i_col < 2) ? 0 : data22;
                d23_o <= (i_col < 1) ? 0 : data23;
                d24_o <= data24;
                d25_o <= (i_col > COLS - 2) ? 0 : data25;
                d26_o <= (i_col > COLS - 3) ? 0 : data26;
                d27_o <= (i_col > COLS - 4) ? 0 : data27;
                
                
                d28_o <= (i_row > ROWS - 2 || i_col < 3) ?  0: data28;
                d29_o <= (i_row > ROWS - 2 || i_col < 2) ? 0 : data29;
                d30_o <= (i_row > ROWS - 2 || i_col < 1) ? 0 : data30;
                d31_o <= (i_row > ROWS - 2)  ?0 : data31;
                d32_o <= (i_row > ROWS - 2 || i_col > COLS - 2) ? 0 : data32;
                d33_o <= (i_row > ROWS - 2 || i_col > COLS - 3) ? 0 : data33;
                d34_o <= (i_row > ROWS - 2 ||i_col > COLS - 4) ? 0 : data34;
                
                d35_o <= (i_row > ROWS - 3 || i_col < 3) ?  0: data35;
                d36_o <= (i_row > ROWS - 3 || i_col < 2) ? 0 : data36;
                d37_o <= (i_row > ROWS - 3 || i_col < 1) ? 0 : data37;
                d38_o <= (i_row > ROWS - 3)  ?0 : data38;
                d39_o <= (i_row > ROWS - 3 || i_col > COLS - 2) ? 0 : data39;
                d40_o <= (i_row > ROWS - 3 || i_col > COLS - 3) ? 0 : data40;
                d41_o <= (i_row > ROWS - 3 ||i_col > COLS - 4) ? 0 : data41;
                
                d42_o <= (i_row > ROWS - 4 || i_col < 3) ?  0: data42;
                d43_o <= (i_row > ROWS - 4 || i_col < 2) ? 0 : data43;
                d44_o <= (i_row > ROWS - 4 || i_col < 1) ? 0 : data44;
                d45_o <= (i_row > ROWS - 4)  ?0 : data45;
                d46_o <= (i_row > ROWS - 4 || i_col > COLS - 2) ? 0 : data46;
                d47_o <= (i_row > ROWS - 4 || i_col > COLS - 3) ? 0 : data47;
                d48_o <= (i_row > ROWS - 4 ||i_col > COLS - 4) ? 0 : data48;
                
                
            end
        end
        
    end
    
    
    
    
    always @(posedge clk) begin
        if (rst) begin
            data0  <= 0;
            data1  <= 0;
            data2  <= 0;
            data3  <= 0;
            data4  <= 0;
            data5  <= 0;
            data6  <= 0;
            data7  <= 0;
            data8  <= 0;
            data9  <= 0;
            data10 <= 0;
            data11 <= 0;
            data12 <= 0;
            data13 <= 0;
            data14 <= 0;
            data15 <= 0;
            data16 <= 0;
            data17 <= 0;
            data18 <= 0;
            data19 <= 0;
            data20 <= 0;
            data21 <= 0;
            data22 <= 0;
            data23 <= 0;
            data24 <= 0;
            data25 <= 0;
            data26 <= 0;
            data27 <= 0;
            data28 <= 0;
            data29 <= 0;
            data30 <= 0;
            data31 <= 0;
            data32 <= 0;
            data33 <= 0;
            data34 <= 0;
            data35 <= 0;
            data36 <= 0;
            data37 <= 0;
            data38 <= 0;
            data39 <= 0;
            data40 <= 0;
            data41 <= 0;
            data42 <= 0;
            data43 <= 0;
            data44 <= 0;
            data45 <= 0;
            data46 <= 0;
            data47 <= 0;
            data48 <= 0;
            
            end else begin
            // d7 d6 d5 d4 d3 d2 d1
            if (start) begin
                data0 <= data1;
                data1 <= data2;
                data2 <= data3;
                data3 <= data4;
                data4 <= data5;
                data5 <= data6;
                data6 <= d7_i;
                
                
                data7  <= data8;
                data8  <= data9;
                data9  <= data10;
                data10 <= data11;
                data11 <= data12;
                data12 <= data13;
                data13 <= d6_i;
                
                data14 <= data15;
                data15 <= data16;
                data16 <= data17;
                data17 <= data18;
                data18 <= data19;
                data19 <= data20;
                data20 <= d5_i;
                
                data21 <= data22;
                data22 <= data23;
                data23 <= data24;
                data24 <= data25;
                data25 <= data26;
                data26 <= data27;
                data27 <= d4_i;
                
                
                data28 <= data29;
                data29 <= data30;
                data30 <= data31;
                data31 <= data32;
                data32 <= data33;
                data33 <= data34;
                data34 <= d3_i;
                
                
                data35 <= data36;
                data36 <= data37;
                data37 <= data38;
                data38 <= data39;
                data39 <= data40;
                data40 <= data41;
                data41 <= d2_i;
                
                data42 <= data43;
                data43 <= data44;
                data44 <= data45;
                data45 <= data46;
                data46 <= data47;
                data47 <= data48;
                data48 <= d1_i;
            end
            
        end
    end
    
endmodule
