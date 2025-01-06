module R6_sum #(parameter COLS = 11,
                parameter ROWS = 11)
               (input clk,
                input rst,
                input cum_en,
                input sum_en,
                input count_en,
                input start_en,
                input ld_en,
                input [7:0] S1,
                S2,
                S3,
                S4,
                S5,
                S6,
                S7,
                S8,
                S9,
                S10,
                S11,
                S12,
                S13,
                output [15:0] sum_o,
                output [9:0] i_counter,
                output [7:0] central_value,
                output i_row_eq_max,
                output i_start_gt_2);
    
    
    
    wire [9:0] i_counter_plus_1;
    wire [2:0] i_start;
    wire [2:0] i_start_plus_1;
    wire [9:0] i_row_plus_1;
    wire [9:0] i_row;
    wire i_counter_eq_max;
    
    
    plus_1 #(.WIDTH(3))
    I_START_PLUS
    (
    .rst(rst),
    .clk(clk),
    .en(start_en),
    .D(i_start),
    .Q(i_start_plus_1)
    );
    assign i_start_gt_2 = (i_start_plus_1 > 2) ? 1'b1 : 1'b0;
    assign i_start      = (i_start_plus_1 == 4) ? 0 : i_start_plus_1;
    
    
    
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
    .en(i_counter_eq_max),
    .D(i_row),
    .Q(i_row_plus_1)
    );
    assign i_counter_eq_max = (i_counter_plus_1 == COLS) ? 1'b1 : 1'b0;
    
    assign i_counter    = (i_counter_eq_max == 1'b1) ? 0: i_counter_plus_1;
    assign i_row        = (i_counter_eq_max) ? i_row : i_row_plus_1;
    assign i_row_eq_max = (i_row_plus_1 == ROWS - 12) ? 1'b1 : 1'b0;
    
    
    
    
    reg [7:0] st1_S1, st1_S2, st1_S3, st1_S4, st1_S5, st1_S6, st1_S7, st1_S8, st1_S9, st1_S10, st1_S11, st1_S12, st1_S13;
    always @(posedge clk) begin
        if (rst) begin
            st1_S1  <= 0;
            st1_S2  <= 0;
            st1_S3  <= 0;
            st1_S4  <= 0;
            st1_S5  <= 0;
            st1_S6  <= 0;
            st1_S7  <= 0;
            st1_S8  <= 0;
            st1_S9  <= 0;
            st1_S10 <= 0;
            st1_S11 <= 0;
            st1_S12 <= 0;
            st1_S13 <= 0;
            end else  begin
            st1_S1  <= S1;
            st1_S2  <= S2;
            st1_S3  <= S3;
            st1_S4  <= S4;
            st1_S5  <= S5;
            st1_S6  <= S6;
            st1_S7  <= S7;
            st1_S8  <= S8;
            st1_S9  <= S9;
            st1_S10 <= S10;
            st1_S11 <= S11;
            st1_S12 <= S12;
            st1_S13 <= S13;
        end
    end
    
    wire [8:0] sum12, sum34, sum56, sum78, sum910, sum1112;
    
    sum #(.WIDTH(8)) SUM12 (
    .clk(clk),
    .rst(rst),
    .a(st1_S1),
    .b(st1_S2),
    .en(1'b1),
    .result(sum12)
    );
    
    sum #(.WIDTH(8)) SUM34 (
    .clk(clk),
    .rst(rst),
    .a(st1_S3),
    .b(st1_S4),
    .en(1'b1),
    .result(sum34)
    );
    sum #(.WIDTH(8)) SUM56 (
    .clk(clk),
    .rst(rst),
    .a(st1_S5),
    .b(st1_S6),
    .en(1'b1),
    .result(sum56)
    );
    sum #(.WIDTH(8)) SUM78 (
    .clk(clk),
    .rst(rst),
    .a(st1_S7),
    .b(st1_S8),
    .en(1'b1),
    .result(sum78)
    );
    
    sum #(.WIDTH(8)) SUM910 (
    .clk(clk),
    .rst(rst),
    .a(st1_S9),
    .b(st1_S10),
    .en(1'b1),
    .result(sum910)
    );
    sum #(.WIDTH(8)) SUM1112 (
    .clk(clk),
    .rst(rst),
    .a(st1_S11),
    .b(st1_S12),
    .en(1'b1),
    .result(sum1112)
    );
    
    wire [9:0] sum1234, sum5678, sum9_to_12;
    
    sum #(.WIDTH(9)) SUM1234 (
    .clk(clk),
    .rst(rst),
    .a(sum12),
    .b(sum34),
    .en(1'b1),
    
    .result(sum1234)
    );
    sum #(.WIDTH(9)) SUM5678 (
    .clk(clk),
    .rst(rst),
    .a(sum56),
    .b(sum78),
    .en(1'b1),
    .result(sum5678)
    );
    sum #(.WIDTH(9)) SUM9_TO_12 (
    .clk(clk),
    .rst(rst),
    .a(sum910),
    .b(sum1112),
    .en(1'b1),
    .result(sum9_to_12)
    );
    reg [7:0] st2_S13, st3_S13;
    always @(posedge clk) begin
        if (rst) begin
            st2_S13 <= 0;
            st3_S13 <= 0;
            end else  begin
            st2_S13 <= st1_S13;
            st3_S13 <= st2_S13;
            
        end
    end
    
    wire [10:0] sum1_to_8, sum9_to_13;
    sum #(.WIDTH(10)) SUM1_TO_8 (
    .clk(clk),
    .rst(rst),
    .a(sum1234),
    .b(sum5678),
    .en(1'b1),
    .result(sum1_to_8)
    );
    sum #(.WIDTH(10)) SUM9_TO_13 (
    .clk(clk),
    .rst(rst),
    .a(sum9_to_12),
    .b({2'b00, st3_S13}),
    .en(1'b1),
    
    .result(sum9_to_13)
    );
    
    wire [11:0] sum1;
    sum #(.WIDTH(11)) SUM1 (
    .clk(clk),
    .rst(rst),
    .a(sum1_to_8),
    .b(sum9_to_13),
    .en(1'b1),
    .result(sum1)
    );
    
    reg [11:0] sum2;
    reg [11:0] st_sum2 [0:11];
    integer i;
    
    always @(posedge clk) begin
        if (rst) begin
            sum2 <= 0;
            for(i = 0; i < 12; i = i + 1) begin
                st_sum2[i] <= 0;
            end
            end else  begin
            st_sum2[0] <= sum1;
            for(i = 0 ;i < 11; i = i + 1) begin
                st_sum2[i + 1] <= st_sum2[i];
            end
            sum2 <= st_sum2[11];
        end
    end
    
    
    
    wire [15:0] sum2_extended;
    assign sum2_extended = ({4'b0000, sum2});
    wire [15:0] mux_1;
    assign mux_1 = (cum_en == 0) ? 16'b0 : ((~sum2_extended) + 1);
    
    sum_cumulative #(.WIDTH1(16), .WIDTH2(16)) SUMO (
    .clk(clk),
    .rst(rst),
    .en(sum_en),
    .ld(ld_en),
    .data_in1({4'b0000, sum1}),
    .data_in2(mux_1),
    .sum_out(sum_o)
    );
    
    // central value
    reg [7:0] central[0:10];
    always @(posedge clk) begin
        if (rst) begin
            for(i = 0; i < 11; i = i + 1) begin
                central[i] <= 0;
            end
            
            end else  begin
            central[0] <= st1_S7;
            for(i = 0; i < 10; i = i + 1) begin
                central[i + 1] <= central[i];
            end
        end
    end
    assign central_value = central[10];
    
    
endmodule
