module Line_buffer_controller #(parameter DEPTH = 1024)
                               (input clk,              // Clock input
                                input rst,              // Reset input
                                input done_i,           // Done signal when operation is complete
                                input [9:0] i_counter,
                                output wr_en,           // Write enable signal
                                output rd_en,           // Read enable signal
                                output done_o);         // Done output signal
    
    
    mux_2_1 #(.WIDTH(1)) WR_EN_MUX(
    .a(1'b1),
    .b(1'b0),
    .sel(done_i == 1),
    .y(wr_en)
    );
    mux_2_1  #(.WIDTH(1)) RD_EN_MUX(
    .a(1'b1),
    .b(1'b0),
    .sel(done_i && i_counter == DEPTH),
    .y(rd_en)
    );
    
    mux_2_1  #(.WIDTH(1)) DONE_O_MUX(
    .a(1'b1),
    .b(1'b0),
    .sel(i_counter == DEPTH),
    .y(done_o)
    );
    
endmodule
