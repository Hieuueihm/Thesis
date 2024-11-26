`timescale 1ns / 1ps

module Sorting_network_tb;

  // Testbench signals


  reg [7:0] S1, S2, S3;
  wire [7:0] max, med, min;

  // Instantiate the SortingNetwork module
  Sorting_network uut (
      .S1 (S1),
      .S2 (S2),
      .S3 (S3),
      .max(max),
      .med(med),
      .min(min)
  );

  // Clock generation


  // Testbench procedure
  initial begin
    // Initialize inputs
    S1 = 0;
    S2 = 0;
    S3 = 0;

    // Apply reset

    #10;  // Test case 1

    S1 = 8'd10;
    S2 = 8'd20;
    S3 = 8'd15;
    #50;  // Wait for done signal
    $display("Test Case 1: S1=%d, S2=%d, S3=%d -> min=%d, med=%d, max=%d", S1, S2, S3, min, med,
             max,);


    // Test case 2
    S1 = 8'd50;
    S2 = 8'd30;
    S3 = 8'd40;
    #50;  // Wait for done signal

    $display("Test Case 2: S1=%d, S2=%d, S3=%d -> min=%d, med=%d, max=%d", S1, S2, S3, min, med,
             max);


    // Test case 3
    S1 = 8'd5;
    S2 = 8'd25;
    S3 = 8'd15;
    #50;  // Wait for done signal

    $display("Test Case 3: S1=%d, S2=%d, S3=%d -> min=%d, med=%d, max=%d, ", S1, S2, S3, min, med,
             max);

    // End simulation
    $stop;
  end
endmodule
