module Window_buffer_5x5_datapath #(parameter COLS = 5,
                                    parameter ROWS = 5)
                                   (input clk,
                                    input rst,
                                    input count_en,
                                    input [7:0] S1_i,
                                    S2_i,
                                    S3_i,
                                    S4_i,
                                    S5_i,
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
    
    assign i_col_ge_threshold = (i_counter_plus_1 > 2) ? 1'b1 : 1'b0;
    assign i_col_eq_max       = (i_counter_plus_1 == COLS - 2) ? 1'b1 : 1'b0;
    assign i_counter          = (i_col_eq_max == 1'b1) ? 0: i_counter_plus_1;
    
    assign i_row        = (i_col_eq_max) ? i_row : i_row_plus_1;
    assign i_row_eq_max = (i_row_plus_1 == ROWS - 4) ? 1'b1 : 1'b0;
    
    
    reg [7:0] S1_delay;
    reg [7:0] S2_delay;
    reg [7:0] S3_delay;
    reg [7:0] S4_delay;
    reg [7:0] S5_delay;
    
    always @(posedge clk) begin
        if (rst) begin
            S1_delay <= 0;
            S2_delay <= 0;
            S3_delay <= 0;
            S4_delay <= 0;
            S5_delay <= 0;
            end else begin
            S1_delay <= S1_i;
            S2_delay <= S2_i;
            S3_delay <= S3_i;
            S4_delay <= S4_i;
            S5_delay <= S5_i;
        end
    end
    
    reg [7:0] S1_window [4:0];
    reg [7:0] S2_window [4:0];
    reg [7:0] S3_window [4:0];
    reg [7:0] S4_window [4:0];
    reg [7:0] S5_window [4:0];
    integer i;
    always @(posedge clk) begin
        if (rst) begin
            for(i = 0;i < 5; i = i + 1) begin
                S1_window[i] <= 0;
                S2_window[i] <= 0;
                S3_window[i] <= 0;
                S4_window[i] <= 0;
                S5_window[i] <= 0;
            end
            end else begin
            S1_window[0] <= S1_delay;
            S2_window[0] <= S2_delay;
            S3_window[0] <= S3_delay;
            S4_window[0] <= S4_delay;
            S5_window[0] <= S5_delay;
            
            for(i = 1; i < 5; i = i + 1) begin
                S1_window[i] <= S1_window[i - 1];
                S2_window[i] <= S2_window[i - 1];
                S3_window[i] <= S3_window[i - 1];
                S4_window[i] <= S4_window[i - 1];
                S5_window[i] <= S5_window[i - 1];
            end
        end
    end
    
    assign S1_o = S1_window[4];
    assign S2_o = S1_window[3];
    assign S3_o = S1_window[2];
    assign S4_o = S1_window[1];
    assign S5_o = S1_window[0];
    
    assign S6_o  = S2_window[4];
    assign S7_o  = S2_window[3];
    assign S8_o  = S2_window[2];
    assign S9_o  = S2_window[1];
    assign S10_o = S2_window[0];
    
    assign S11_o = S3_window[4];
    assign S12_o = S3_window[3];
    assign S13_o = S3_window[2];
    assign S14_o = S3_window[1];
    assign S15_o = S3_window[0];
    
    assign S16_o = S4_window[4];
    assign S17_o = S4_window[3];
    assign S18_o = S4_window[2];
    assign S19_o = S4_window[1];
    assign S20_o = S4_window[0];
    
    
    assign S21_o = S5_window[4];
    assign S22_o = S5_window[3];
    assign S23_o = S5_window[2];
    assign S24_o = S5_window[1];
    assign S25_o = S5_window[0];
    
    
endmodule
