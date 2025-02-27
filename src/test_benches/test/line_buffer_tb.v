`timescale 1ns / 1ps

module line_buffer_tb;
  parameter DEPTH = 20;

  // Testbench signals
  reg clk;
  reg rst_n;
  reg done_i;
  reg [7:0] data_i;
  wire [7:0] data_o;
  wire done_o;

  // Instantiate the DUT (Device Under Test)
  line_buffer #(
      .DEPTH(14)
  ) dut (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .data_i(data_i),
      .data_o(data_o),
      .done_o(done_o)
  );

  // Clock generation
  always #5 clk = ~clk;  // 10ns clock period
  integer i;
  initial begin
    // Initialize signals
    clk = 0;
    rst_n = 0;
    done_i = 0;
    data_i = 0;

    // Apply reset
    #20 rst_n = 1;

    // Write data into the buffer
    for (i = 0; i < 30; i = i + 1) begin
      data_i = i + 1;
      done_i = 1;
      #10;  // Wait for a clock cycle
    end

    // Indicate that writing is done
    done_i = 0;

    // Wait for some time to read data
    #1000;

    // FINISH simulation
    $stop;
  end

  // Monitor output
  initial begin
    $monitor("Time = %0t, data_i = %d, data_o = %d, done_o = %b", $time, data_i, data_o, done_o);
  end
endmodule
