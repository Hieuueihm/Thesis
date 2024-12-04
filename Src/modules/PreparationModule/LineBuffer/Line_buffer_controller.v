module Line_buffer_controller #(
    parameter DEPTH = 1024
) (
    input  clk,     // Clock input
    input  rst,     // Reset input
    input  done_i,  // Done signal when operation is complete
    input [9:0] i_counter,
    output wr_en,   // Write enable signal
    output rd_en,   // Read enable signal
    output done_o  // Done output signal
);

  assign wr_en  = (done_i == 1) ? 1 : 0;
  assign rd_en  = (done_i && i_counter == DEPTH);
  assign done_o = (i_counter == DEPTH);

endmodule
