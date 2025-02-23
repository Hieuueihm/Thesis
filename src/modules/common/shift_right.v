module shift_right (input [7:0] data_i,
                    input [2:0] shift_bit,
                    output [7:0] data_o);
assign data_o = data_i >> shift_bit;

endmodule
