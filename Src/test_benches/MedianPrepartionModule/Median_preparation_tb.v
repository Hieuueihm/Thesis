`timescale 1ns / 1ps

module Median_preparation_tb ();

  // Parameters
  parameter DEPTH = 2;  // Set the DEPTH parameter

  // Inputs to the Median_preparation module
  reg clk;
  reg rst;
  reg done_i;
  reg [7:0] grayscale_i;

  // Outputs from the Median_preparation module
  wire [7:0] data0_o;
  wire [7:0] data1_o;
  wire [7:0] data2_o;
  wire [7:0] data3_o;
  wire [7:0] data4_o;
  wire [7:0] data5_o;
  wire [7:0] data6_o;
  wire [7:0] data7_o;
  wire [7:0] data8_o;
  wire done_o;

  // Instantiate the Median_preparation module
  Preparation #(
      .DEPTH(DEPTH)
  ) uut (
      .clk(clk),
      .rst(rst),
      .done_i(done_i),
      .data_i(grayscale_i),
      .data0_o(data0_o),
      .data1_o(data1_o),
      .data2_o(data2_o),
      .data3_o(data3_o),
      .data4_o(data4_o),
      .data5_o(data5_o),
      .data6_o(data6_o),
      .data7_o(data7_o),
      .data8_o(data8_o),
      .done_o(done_o)
  );

  // Clock generation (50 MHz clock)
  always begin
    #5 clk = ~clk;  // Toggle clock every 5ns to get a 100 MHz clock
  end

  // Stimulus process
  initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    done_i = 0;
    grayscale_i = 0;

    // Apply reset
    rst = 1;
    #10;
    rst = 0;
    #10;

    // Generate grayscale values from 0 to 255 using a for loop
    for (grayscale_i = 0; grayscale_i < 256; grayscale_i = grayscale_i + 1) begin
      done_i = 1;  // Signal done_i to simulate input data availability
      #10;  // Wait for 10ns for each value
      done_i = 0;  // Reset done_i
      #10;  // Wait for 10ns before moving to the next value
    end

    // Test Case: Reset the system and test again
    rst = 1;  // Apply reset again
    #10;
    rst = 0;
    #10;

    // Send another round of grayscale values after reset
    for (grayscale_i = 0; grayscale_i < 256; grayscale_i = grayscale_i + 1) begin
      done_i = 1;  // Signal done_i to simulate input data availability
      #10;
      done_i = 0;  // Reset done_i
      #10;
    end

    // Finish simulation
    $stop;
  end

  // Monitor the outputs
  // initial begin
  //   $monitor(
  //       "Time = %0t, grayscale_i = %h, data0_o = %h, data1_o = %h, data2_o = %h, data3_o = %h, data4_o = %h, data5_o = %h, data6_o = %h, data7_o = %h, data8_o = %h, done_o = %b",
  //       $time, grayscale_i, data0_o, data1_o, data2_o, data3_o, data4_o, data5_o, data6_o, data7_o,
  //       data8_o, done_o);
  // end

endmodule
