`timescale 1ns / 1ps  // Define the simulation time resolution

module Median_filter_3x3_tb ();

  // Testbench signals
  reg clk;
  reg rst;
  reg [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9;
  wire [7:0] median_o;  // Output from Median filter

  // Instantiate the Median_filter_3x3 module
  Median_filter_3x3 uut (
      .clk(clk),
      .rst(rst),
      .S1(S1),
      .S2(S2),
      .S3(S3),
      .S4(S4),
      .S5(S5),
      .S6(S6),
      .S7(S7),
      .S8(S8),
      .S9(S9),
      .median_o(median_o)
  );

  // Clock generation: 10 ns period (100 MHz clock)
  always begin
    #5 clk = ~clk;  // Toggle clock every 5 ns (50% duty cycle)
  end

integer start_time, end_time;

  // Test procedure
  initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    S1  = 8'd0;
    S2  = 8'd0;
    S3  = 8'd0;
    S4  = 8'd0;
    S5  = 8'd0;
    S6  = 8'd0;
    S7  = 8'd0;
    S8  = 8'd0;
    S9  = 8'd0;

    // Apply reset
    rst = 1;
    #10 rst = 0;  // Deassert reset after 10 ns

    start_time = $time;  // Capture the start time

    // Apply test values to inputs
    S1 = 8'd10;
    S2 = 8'd20;
    S3 = 8'd30;
    S4 = 8'd40;
    S5 = 8'd50;
    S6 = 8'd60;
    S7 = 8'd70;
    S8 = 8'd80;
    S9 = 8'd90;

    end_time = $time;  // Capture the end time
    $display("Execution Time: %0d ns", end_time - start_time);
    // Wait for the median calculation to complete and observe the output
    #100;  // Delay for some time to simulate the process of calculating the median

    // Display the results
    $display("Time: %0t, Median Output: %d", $time, median_o);
    $stop;
  end

endmodule
