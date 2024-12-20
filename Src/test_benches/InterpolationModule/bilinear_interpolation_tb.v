`timescale 1ns / 1ps
`define clk_period 10
module bilinear_interpolation_tb;

  // Testbench signals
  reg clk;
  reg rst;
  reg [1:0] r;
  reg [1:0] angle;
  reg [7:0] A, B, C, D;
  wire [7:0] I;
  wire z;

  // Instantiate the DUT (Device Under Test)
  bilinear_interpolation uut (
      .clk(clk),
      .rst(rst),
      .angle(angle),
      .r(r),
      .A(A),
      .B(B),
      .C(C),
      .D(D),
      .I(I),
      .z(z)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10 ns clock period
  end

  // Testbench logic
  initial begin
    // Initialize inputs
    rst = 1;
    A = 8'd0;
    B = 8'd0;
    C = 8'd0;
    D = 8'd0;
    r = 2'b00;
    angle = 2'b00;


    // Apply reset
    #(`clk_period) rst = 0;
    // Test case 1: r = 0
    A = 8'd94;
    B = 8'd18;
    C = 8'd0;
    D = 8'd50;
    r = 2'b11;
    angle = 2'b00;
    #(`clk_period) A = 8'd4;
    B = 8'd22;
    C = 8'd20;
    D = 8'd93;
    r = 2'b11;
    angle = 2'b01;
    #(`clk_period) A = 8'd71;
    B = 8'd6;
    C = 8'd4;
    D = 8'd83;
    r = 2'b11;
    angle = 2'b10;
    #(`clk_period) A = 8'd99;
    B = 8'd6;
    C = 8'd46;
    D = 8'd56;
    r = 2'b11;
    angle = 2'b11;
    #1000 $stop;
  end

endmodule
