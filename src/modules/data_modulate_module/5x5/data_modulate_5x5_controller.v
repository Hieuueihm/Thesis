module data_modulate_5x5_controller (
    input rst_n,
    input clk,
    input done_i,
    input [2:0] i_counter,
    output done_o,
    output o_en,
    output start
);
  wire o_en_r = (i_counter == 3) ? 1 : 0;
  assign o_en = o_en_r;
  dff #(
      .WIDTH(1)
  ) DFF_DONE (
      .clk(clk),
      .rst_n(rst_n),
      .D(o_en_r),
      .Q(done_o)
  );
  assign start = done_i;


endmodule
