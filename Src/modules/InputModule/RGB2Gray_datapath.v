module RGB2Gray_datapath (input clk,
                          input rst,
                          input [7:0] red_i,
                          input [7:0] green_i,
                          input [7:0] blue_i,
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
    
    always @(posedge clk) begin
        if (rst) begin
            grayscale <= 0;
            end else begin
            grayscale <= (red_shift_2 + red_shift_5 + green_shift_1 + green_shift_4 + blue_shift_4 + blue_shift_5);
        end
    end
    
endmodule
