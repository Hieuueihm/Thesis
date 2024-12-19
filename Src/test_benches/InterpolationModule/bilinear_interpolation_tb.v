`timescale 1ns / 1ps

module bilinear_interpolation_tb;

  // Testbench signals
  reg clk;
  reg rst;
  reg [1:0] r;
  reg [7:0] A, B, C, D;
  wire [15:0] I;

  // Instantiate the DUT (Device Under Test)
  bilinear_interpolation uut (
      .clk(clk),
      .rst(rst),
      .r  (r),
      .A  (A),
      .B  (B),
      .C  (C),
      .D  (D),
      .I  (I)
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
    r   = 2'b00;
    A   = 8'd4;
    B   = 8'd5;
    C   = 8'd17;
    D   = 8'd18;

    // Apply reset
    #10 rst = 0;

    // Test case 1: r = 0
    #10 r = 2'b00;
    #20 $display("r = %b, I = %d", r, I);
    #100;

    #10 $stop;
  end

endmodule
