module ni #(
    parameter WIDTH = 10,
    parameter GAIN  = 25
) (
    input clk,
    input rst_n,
    input done_i,
    input progress_done_i,
    input [23:0] S1_r2,
    S2_r2,
    S3_r2,
    S4_r2,
    S5_r2,
    S6_r2,
    S7_r2,
    S8_r2,
    input [WIDTH - 1:0] sum_i,
    output done_o,
    output progress_done_o,
    output bit1_o,
    bit2_o,
    bit3_o,
    bit4_o,
    bit5_o,
    bit6_o,
    bit7_o,
    bit8_o
);

  shift_registers #(
      .WIDTH(1),
      .CYCLE(4)
  ) shift_registers_pd_o (
      .clk(clk),
      .rst_n(rst_n),
      .data_i(progress_done_i),
      .data_o(progress_done_o)
  );
  ni_calc #(
      .WIDTH(WIDTH),
      .GAIN (GAIN)
  ) ni1 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .S(S1_r2),
      .sum_i(sum_i),
      .done_o(done_o),
      .bit_o(bit1_o)
  );
  ni_calc #(
      .WIDTH(WIDTH),
      .GAIN (GAIN)
  ) ni2 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .S(S2_r2),
      .sum_i(sum_i),
      .done_o(),
      .bit_o(bit2_o)
  );
  ni_calc #(
      .WIDTH(WIDTH),
      .GAIN (GAIN)
  ) ni3 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .S(S3_r2),
      .sum_i(sum_i),
      .done_o(),
      .bit_o(bit3_o)
  );
  ni_calc #(
      .WIDTH(WIDTH),
      .GAIN (GAIN)
  ) ni4 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .S(S4_r2),
      .sum_i(sum_i),
      .done_o(),
      .bit_o(bit4_o)
  );
  ni_calc #(
      .WIDTH(WIDTH),
      .GAIN (GAIN)
  ) ni5 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .S(S5_r2),
      .sum_i(sum_i),
      .done_o(),
      .bit_o(bit5_o)
  );
  ni_calc #(
      .WIDTH(WIDTH),
      .GAIN (GAIN)
  ) ni6 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .S(S6_r2),
      .sum_i(sum_i),
      .done_o(),
      .bit_o(bit6_o)
  );
  ni_calc #(
      .WIDTH(WIDTH),
      .GAIN (GAIN)
  ) ni7 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .S(S7_r2),
      .sum_i(sum_i),
      .done_o(),
      .bit_o(bit7_o)
  );
  ni_calc #(
      .WIDTH(WIDTH),
      .GAIN (GAIN)
  ) ni8 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .S(S8_r2),
      .sum_i(sum_i),
      .done_o(),
      .bit_o(bit8_o)
  );


endmodule
