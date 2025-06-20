`timescale 1ns / 1ps

module ni_calc_tb;
  parameter WIDTH = 10;
  parameter GAIN = 25;

  reg clk;
  reg rst_n;
  reg [23:0] S;
  reg [WIDTH-1:0] sum_i;
  reg i_valid;
  wire ;
  wire bit_o;

  // Instantiate DUT
  ni_calc #(
      .WIDTH(WIDTH),
      .GAIN (GAIN)
  ) dut (
      .clk(clk),
      .rst_n(rst_n),
      .S(S),
      .sum_i(sum_i),
      .i_valid(i_valid),
      .(),
      .bit_o(bit_o)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Testbench sequence
  initial begin
    // Initialize signals
    clk = 0;
    rst_n = 0;
    S = 0;
    sum_i = 0;
    i_valid = 0;

    // Reset sequence
    #10 rst_n = 1;

    // Apply test vectors
    #10 S = 24'h010000;
    sum_i   = 10'd50;
    i_valid = 1;
    #10 S = 24'h100000;
    sum_i = 1000;
    #10 S = 24'hAA0000;
    sum_i   = 10000;
    i_valid = 1;
    #10 i_valid = 0;

    #1000 $stop;
  end
endmodule
