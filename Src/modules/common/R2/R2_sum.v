module R2_sum #(parameter COLS = 7,
                parameter ROWS = 7)
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
                output [12:0] sum_o,
                output i_row_eq_max,
                output [9:0] i_counter,
                output [7:0] central_value,
                output i_start_gt_1);
    
    
    
    wire [9:0] i_counter_plus_1;
    wire [1:0] i_start;
    wire [1:0] i_start_plus_1;
    wire [9:0] i_row_plus_1;
    wire [9:0] i_row;
    wire i_counter_eq_max;
    
    plus_1 #(.WIDTH(2))
    I_START_PLUS
    (
    .rst(rst),
    .clk(clk),
    .en(start_en),
    .D(i_start),
    .Q(i_start_plus_1)
    );
    assign i_start_gt_1 = (i_start_plus_1 > 1) ? 1'b1 : 1'b0;
    assign i_start      = (i_start_plus_1 == 3) ? 0 : i_start_plus_1;
    
    
    
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
    
    assign i_counter = (i_counter_eq_max == 1'b1) ? 0: i_counter_plus_1;
    
    assign i_row        = (i_counter_eq_max) ? i_row : i_row_plus_1;
    assign i_row_eq_max = (i_row_plus_1 == ROWS - 4) ? 1'b1 : 1'b0;
    
    
    
    reg [7:0] st1_S1, st1_S2, st1_S3, st1_S4, st1_S5;
    always @(posedge clk) begin
        if (rst) begin
            st1_S1 <= 0;
            st1_S2 <= 0;
            st1_S3 <= 0;
            st1_S4 <= 0;
            st1_S5 <= 0;
            end else  begin
            st1_S1 <= S1;
            st1_S2 <= S2;
            st1_S3 <= S3;
            st1_S4 <= S4;
            st1_S5 <= S5;
        end
    end
    
    wire [8:0] sum12, sum34;
    reg [7:0] st2_S5;
    always @(posedge clk) begin
        if (rst) begin
            st2_S5 <= 0;
            end else  begin
            st2_S5 <= st1_S5;
            
        end
    end
    sum #(.WIDTH(8)) SUM12 (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .a(st1_S1),
    .b(st1_S2),
    .result(sum12)
    );
    
    sum #(.WIDTH(8)) SUM34 (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .a(st1_S3),
    .b(st1_S4),
    .result(sum34)
    );
    
    wire [9:0] sum1234;
    
    sum #(.WIDTH(9)) SUM1234 (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .a(sum12),
    .b(sum34),
    .result(sum1234)
    );
    reg [7:0] st3_S5;
    always @(posedge clk) begin
        if (rst) begin
            st3_S5 <= 0;
            end else  begin
            st3_S5 <= st2_S5;
            
        end
    end
    
    wire [10:0] sum1;
    sum #(.WIDTH(10)) SUM12345 (
    .clk(clk),
    .rst(rst),
    .a(sum1234),
    .en(1'b1),
    .b({2'b00, st3_S5}),
    .result(sum1)
    );
    
    reg [10:0] sum2, st1_sum2, st2_sum2, st3_sum2, st4_sum2;
    
    always @(posedge clk) begin
        if (rst) begin
            sum2     <= 0;
            st1_sum2 <= 0;
            st2_sum2 <= 0;
            st3_sum2 <= 0;
            st4_sum2 <= 0;
            end else  begin
            st1_sum2 <= sum1;
            st2_sum2 <= st1_sum2;
            st3_sum2 <= st2_sum2;
            st4_sum2 <= st3_sum2;
            sum2     <= st4_sum2;
        end
    end
    
    
    
    
    
    
    wire [12:0] sum2_extended;
    assign sum2_extended = {2'b00, sum2};
    wire [12:0] mux_1;
    assign mux_1 = (cum_en == 0) ? 13'b0 : ((~sum2_extended) + 1);
    sum_cumulative #(.WIDTH1(13), .WIDTH2(13)) SUMO (
    .clk(clk),
    .rst(rst),
    .en(sum_en),
    .ld(ld_en),
    .data_in1({2'b00, sum1}),
    .data_in2(mux_1),
    .sum_out(sum_o)
    );
    
    // central value
    reg [7:0] central_1, central_2, central_3, central_4, central_5, central_6;
    always @(posedge clk) begin
        if (rst) begin
            central_1 <= 0;
            central_2 <= 0;
            central_3 <= 0;
            central_4 <= 0;
            central_5 <= 0;
            central_6 <= 0;
            
            end else  begin
            central_1 <= st1_S3;
            central_2 <= central_1;
            central_3 <= central_2;
            central_4 <= central_3;
            central_5 <= central_4;
            central_6 <= central_5;
        end
    end
    assign central_value = central_6;
    
    
endmodule
