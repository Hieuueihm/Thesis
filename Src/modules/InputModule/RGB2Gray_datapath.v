module RGB2Gray_datapath (input clk,
                          input rst,
                          input [7:0] red_i,
                          input [7:0] green_i,
                          input [7:0] blue_i,
                          input done_i,
                          output [7:0] grayscale_o);
    
    wire [7:0] red_shift_2, red_shift_5, green_shift_1, green_shift_4, blue_shift_4, blue_shift_5;
    wire [7:0] grayscale;
    
    
    assign grayscale_o = grayscale;
    shift_right RED_SHIFT_2
    (
    .data_i(red_i),
    .shift_bit(2),
    .data_o(red_shift_2)
    );
    
    shift_right RED_SHIFT_5
    (
    .data_i(red_i),
    .shift_bit(5),
    .data_o(red_shift_5)
    );
    
    shift_right GREEN_SHIFT_1
    (
    .data_i(green_i),
    .shift_bit(1),
    .data_o(green_shift_1)
    );
    shift_right GREEN_SHIFT_4
    (
    .data_i(green_i),
    .shift_bit(4),
    .data_o(green_shift_4)
    );
    
    shift_right BLUE_SHIFT_4
    (
    .data_i(blue_i),
    .shift_bit(4),
    .data_o(blue_shift_4)
    );
    shift_right BLUE_SHIFT_5
    (
    .data_i(blue_i),
    .shift_bit(5),
    .data_o(blue_shift_5)
    );
    
    
    wire [7:0] grayscale;
    wire [8:0] sum_red, sum_green, sum_blue;
    sum #(.WIDTH(8)) SUM_RED (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .a(red_shift_2),
    .b(red_shift_5),
    .result(sum_red)
    
    );
    sum #(.WIDTH(8)) SUM_GREEN (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .a(green_shift_1),
    .b(green_shift_4),
    .result(sum_green)
    
    );
    sum #(.WIDTH(8)) SUM_BLUE (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .a(blue_shift_4),
    .b(blue_shift_5),
    .result(sum_blue)
    
    );
    
    wire [8:0] sum_red_green;
    sum #(.WIDTH(8)) SUM_RED_GREEN (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .a(sum_red[7:0]),
    .b(sum_green[7:0]),
    .result(sum_red_green)
    );
    wire [7:0] sum_blue_delay;
    dff #(.WIDTH(8)) SUM_BLUE_DELAY (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .D(sum_blue[7:0]),
    .Q(sum_blue_delay)
    );
    
    wire [8:0] gray_sum;
    sum #(.WIDTH(8)) GRAY_SUM (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .a(sum_red_green[7:0]),
    .b(sum_blue_delay),
    .result(gray_sum)
    );
    
    
    
    dff #(.WIDTH(8)) GRAY_DFF(
    .clk(clk),
    .rst(rst),
    .en(done_i),
    .D(gray_sum[7:0]),
    .Q(grayscale_o)
    );
    
    
endmodule
