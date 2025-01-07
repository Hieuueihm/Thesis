module Data_modulate_5x5_datapath #(parameter ROWS = 7,
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
    data24;
    
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
    assign i_counter = (i_counter_plus_1 == 4) ? i_counter : i_counter_plus_1;
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
            end else begin
            // zero padding
            if (done_o) begin
                d0_o <= (i_row < 2 || i_col < 2) ? 0 : data0;
                d1_o <= (i_row < 2 || i_col < 1) ? 0 : data1;
                d2_o <= (i_row < 2) ? 0 : data2;
                d3_o <= (i_row < 2 || i_col > COLS - 2) ? 0 : data3;
                d4_o <= (i_row < 2 || i_col > COLS - 3) ? 0 : data4;
                
                d5_o <= (i_row < 1 || i_col < 2) ? 0 : data5;
                d6_o <= (i_row < 1 || i_col < 1) ? 0 : data6;
                d7_o <= (i_row < 1) ? 0 : data7;
                d8_o <= (i_row < 1 || i_col > COLS - 2) ? 0 : data8;
                d9_o <= (i_row < 1 || i_col > COLS - 3) ? 0 : data9;
                
                d10_o <= (i_col < 2) ? 0 : data10;
                d11_o <= (i_col < 1) ? 0 : data11;
                d12_o <= data12;
                d13_o <= (i_col > COLS - 2) ? 0 : data13;
                d14_o <= (i_col > COLS - 3) ? 0 : data14;
                
                d15_o <= (i_row > ROWS - 2 || i_col < 2) ? 0 : data15;
                d16_o <= (i_row > ROWS - 2 || i_col < 1) ? 0 : data16;
                d17_o <= (i_row > ROWS - 2) ? 0 : data17;
                d18_o <= (i_row > ROWS - 2 || i_col > COLS - 2) ? 0 : data18;
                d19_o <= (i_row > ROWS - 2 || i_col > COLS - 3) ? 0 : data19;
                
                d20_o <= (i_row > ROWS - 3 || i_col < 2) ? 0 : data20;
                d21_o <= (i_row > ROWS - 3 || i_col < 1) ? 0 : data21;
                d22_o <= (i_row > ROWS - 3) ? 0 : data22;
                d23_o <= (i_row > ROWS - 3 || i_col > COLS - 2) ? 0 : data23;
                d24_o <= (i_row > ROWS - 3 || i_col > COLS - 3) ? 0 : data24;
                
                
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
            end else begin
            // d6 d5 d4 d3 d2
            if (start) begin
                data0  <= data1;
                data1  <= data2;
                data2  <= data3;
                data3  <= data4;
                data4  <= d6_i;
                data5  <= data6;
                data6  <= data7;
                data7  <= data8;
                data8  <= data9;
                data9  <= d5_i;
                data10 <= data11;
                data11 <= data12;
                data12 <= data13;
                data13 <= data14;
                data14 <= d4_i;
                data15 <= data16;
                data16 <= data17;
                data17 <= data18;
                data18 <= data19;
                data19 <= d3_i;
                data20 <= data21;
                data21 <= data22;
                data22 <= data23;
                data23 <= data24;
                data24 <= d2_i;
                
            end
            
        end
        
        
    end
    
endmodule
