module line_buffer_controller #(
    parameter DEPTH = 1024
) (
    input        clk,        // Clock input
    input        rst_n,      // Reset input
    input        done_i,     // Done signal when operation is complete
    input  [9:0] i_counter,
    output       wr_en,      // Write enable signal
    output       rd_en,      // Read enable signal
    output       done_o
);  // Done output signal


  wire done_i_eq_1 = (done_i == 1) ? 1 : 0;
  wire i_counter_eq_max = (i_counter == DEPTH - 1) ? 1 : 0;
  wire done_and_i_counter = done_i_eq_1 & i_counter_eq_max;

  mux_2_1 #(
      .WIDTH(1)
  ) WR_EN_MUX (
      .a  (1'b1),
      .b  (1'b0),
      .sel(done_i_eq_1),
      .y  (wr_en)
  );

  mux_2_1 #(
      .WIDTH(1)
  ) rd_EN_MUX (
      .a  (1'b1),
      .b  (1'b0),
      .sel(done_and_i_counter),
      .y  (rd_en)
  );
  wire done_o_mux;
  mux_2_1 #(
      .WIDTH(1)
  ) DONE_O_MUX (
      .a  (1'b1),
      .b  (1'b0),
      .sel(i_counter_eq_max),
      .y  (done_o_mux)
  );

  dff #(
      .WIDTH(1)
  ) SHIFT_DONE (
      .clk(clk),
      .rst_n(rst_n),
      .D(done_o_mux),
      .Q(done_o)
  );



endmodule
