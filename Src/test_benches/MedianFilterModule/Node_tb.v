`timescale 1ns / 1ps

module Node_tb;


  reg  [7:0] in1;
  reg  [7:0] in2;

  // Outputs
  wire [7:0] out1;
  wire [7:0] out2;

  // Instantiate the module under test
  Node uut (
      .A(in1),
      .B(in2),
      .min_o(out1),
      .max_o(out2)
  );

  // Clock generation

  // Testbench procedure
  initial begin
    in1 = 0;
    in2 = 0;

    // Wait for global reset
    #10;

    // Apply test vectors
    in1 = 8'd50;
    in2 = 8'd30;
    #10;  // Test case 1
    in1 = 8'd10;
    in2 = 8'd100;
    #10;  // Test case 2
    in1 = 8'd70;
    in2 = 8'd70;
    #10;  // Test case 3
    in1 = 8'd255;
    in2 = 8'd0;
    #10;  // Test case 4
    in1 = 8'd128;
    in2 = 8'd64;
    #10;  // Test case 5

    // Finish simulation
    #10 $stop;
  end

  // Monitor signals
  initial begin
    $monitor("Time = %0t | in1 = %d | in2 = %d | out1 = %d | out2 = %d", $time, in1, in2, out1,
             out2);
  end

endmodule
