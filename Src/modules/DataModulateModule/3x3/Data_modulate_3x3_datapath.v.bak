module Data_modulate_3x3_datapath #(parameter ROWS,
                                    parameter COLS)
                                   (input clk,
                                    input rst,
                                    input [7:0] d0_i,        // 99
                                    input [7:0] d1_i,        // 8
                                    input [7:0] d2_i,        // 7
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
                                    output reg done_reg,
                                    output [2:0] i_counter);
    
    wire [9:0] i_row, i_col;
    wire [9:0] i_col_plus_1, i_row_plus_1;
    wire [2:0] i_counter_plus_1;
    reg [7:0] data0, data1, data2, data3, data4, data5, data6, data7, data8;
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
    assign i_counter = (i_counter_plus_1 == 3) ? i_counter : i_counter_plus_1;
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
            d0_o <= 0;
            d1_o <= 0;
            d2_o <= 0;
            d3_o <= 0;
            d4_o <= 0;
            d5_o <= 0;
            d6_o <= 0;
            d7_o <= 0;
            d8_o <= 0;
            
            end else begin
            if (done_o) begin
                d0_o <= (i_row < 1 || i_col < 1)    ? 0 : data0;
                d1_o <= (i_row < 1)    ? 0 : data1;
                d2_o < = (i_row < 1 || i_col == COLS - 1) ? 0 : data2;
                d3_o <= (i_col < 1)    ? 0 : data3;
                d4_o <= data4;
                d5_o < = (i_col == COLS - 1) ? 0 : data5;
                d6_o < = (i_row == ROWS - 1 || i_col < 1) ? 0 : data6;
                d7_o < = (i_row == ROWS - 1) ? 0 : data7;
                d8_o < = (i_row == ROWS - 1 || i_col == COLS - 1) ? 0 : data8;
            end
        end
        
    end
    
    
    
    
    
    
    always @(posedge clk) begin
        if (rst) begin
            data0 <= 0;
            data1 <= 0;
            data2 <= 0;
            data3 <= 0;
            data4 <= 0;
            data5 <= 0;
            data6 <= 0;
            data7 <= 0;
            data8 <= 0;
            
            
            end else begin
            if (start) begin
                data0 <= data1;
                data1 <= data2;
                data2 <= d5_i;
                
                
                data3 <= data4;
                data4 <= data5;
                data5 <= d4_i;
                
                
                data6 <= data7;
                data7 <= data8;
                data8 <= d3_i;
                
            end
            
        end
        
        
    end
endmodule
