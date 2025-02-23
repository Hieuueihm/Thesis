`timescale 1ns / 1ps

module interpolation_calc_tb ();
  reg clk;
  reg rst_n;
  reg [7:0] A;
  reg [7:0] B;
  reg [7:0] C;
  reg [7:0] D;
  wire [23:0] data_o;
  interpolation_calc #(
      .R(4),
      .RADIUS(45)
  ) uut (
      .clk(clk),
      .rst_n(rst_n),
      .A(A),
      .B(B),
      .C(C),
      .D(D),
      .data_o(data_o)
  );

  // Clock generation
  always #5 clk = ~clk;

  initial begin
    // Initialize Inputs
    clk = 0;
    rst_n = 1;
    A = 0;
    B = 0;
    C = 0;
    D = 0;

    #20;
    rst_n = 0;

    #10;
    A = 8'd74;  // 16
    B = 8'd74;  // 32
    C = 8'd119;  // 48
    D = 8'd116;  // 64

    #10;



    #50;
    $stop;
  end

endmodule
