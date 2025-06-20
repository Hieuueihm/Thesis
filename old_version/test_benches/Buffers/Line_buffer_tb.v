`timescale 1ns / 1ps

module line_buffer_tb ();
  parameter DEPTH = 10;

  reg clk;
  reg rst_n;
  reg i_valid;
  reg [7:0] data_i;
  wire [7:0] data_o;
  wire ;

  // Instantiate DUT (Device Under Test)
  line_buffer #(DEPTH) DUT (
      .clk(clk),
      .rst_n(rst_n),
      .i_valid(i_valid),
      .data_i(data_i),
      .data_o(data_o),
      .()
  );

  // Clock generation
  always #5 clk = ~clk;  // 10ns clock period

  initial begin
    // Initialize signals
    clk    = 0;
    rst_n    = 1;
    i_valid = 0;
    data_i = 0;

    // Reset sequence
    #10 rst_n = 0;

    // Write data into the buffer
    repeat (DEPTH) begin
      #10 data_i = data_i + 1;  // Increment input data
      i_valid = 1;
    end

    // Stop i_valid signal

    // Read data from the buffer
    repeat (DEPTH) begin
      #10;
    end

    // End simulation
    #50;
    $stop;
  end
endmodule
