module Window_buffer_3x3_datapath #(parameter COLS = 5,
                                    parameter ROWS = 5)
                                   (input clk,
                                    input rst,
                                    input count_en,
                                    input [7:0] S1_i,
                                    S2_i,
                                    S3_i,
                                    output [9:0] i_counter,
                                    output i_row_eq_max,
                                    output [7:0] S1_o,
                                    S2_o,
                                    S3_o,
                                    S4_o,
                                    S5_o,
                                    S6_o,
                                    S7_o,
                                    S8_o,
                                    S9_o);
    
    wire [9:0] i_counter_plus_1;
    plus_1 #(.WIDTH(10))
    COUNTER_PLUS
    (
    .rst(rst),
    .clk(clk),
    .en(count_en),
    .D(i_counter),
    .Q(i_counter_plus_1)
    );
    
endmodule
