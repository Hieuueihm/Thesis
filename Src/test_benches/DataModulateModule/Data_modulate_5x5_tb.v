module Data_modulate_5x5_tb;

  // Parameters for the testbench (set appropriate values for ROWS and COLS)
  parameter ROWS = 3;
  parameter COLS = 3;

  // Inputs
  reg clk;
  reg rst;
  reg [7:0] d0_i, d1_i, d2_i, d3_i, d4_i, d5_i, d6_i, d7_i, d8_i;
  reg done_i;

  // Outputs
  wire [7:0] d0_o, d1_o, d2_o, d3_o, d4_o, d5_o, d6_o, d7_o, d8_o;
  wire [7:0] d9_o, d10_o, d11_o, d12_o, d13_o, d14_o, d15_o, d16_o, d17_o, d18_o;
  wire [7:0] d19_o, d20_o, d21_o, d22_o, d23_o, d24_o;
  wire done_o;

  // Instantiate the UUT (Unit Under Test)
  Data_modulat_5x5 #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) uut (
      .clk(clk),
      .rst(rst),
      .d0_i(d0_i),
      .d1_i(d1_i),
      .d2_i(d2_i),
      .d3_i(d3_i),
      .d4_i(d4_i),
      .d5_i(d5_i),
      .d6_i(d6_i),
      .d7_i(d7_i),
      .d8_i(d8_i),
      .done_i(done_i),
      .d0_o(d0_o),
      .d1_o(d1_o),
      .d2_o(d2_o),
      .d3_o(d3_o),
      .d4_o(d4_o),
      .d5_o(d5_o),
      .d6_o(d6_o),
      .d7_o(d7_o),
      .d8_o(d8_o),
      .d9_o(d9_o),
      .d10_o(d10_o),
      .d11_o(d11_o),
      .d12_o(d12_o),
      .d13_o(d13_o),
      .d14_o(d14_o),
      .d15_o(d15_o),
      .d16_o(d16_o),
      .d17_o(d17_o),
      .d18_o(d18_o),
      .d19_o(d19_o),
      .d20_o(d20_o),
      .d21_o(d21_o),
      .d22_o(d22_o),
      .d23_o(d23_o),
      .d24_o(d24_o),
      .done_o(done_o)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;  // 100 MHz clock
  end

  // Initial block for the test
  initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;
    done_i = 0;

    // Stimulus values for d0_i to d8_i (example)
    d0_i = 8'd10;
    d1_i = 8'd20;
    d2_i = 8'd30;
    d3_i = 8'd40;
    d4_i = 8'd50;
    d5_i = 8'd60;
    d6_i = 8'd70;
    d7_i = 8'd80;
    d8_i = 8'd90;

    // Apply reset
    rst = 1;
    #10 rst = 0;

    // Test case 1: Provide data for one row and trigger done_i
    done_i = 1;
    #10 done_i = 0;

    // Test case 2: Provide data for next row and trigger done_i
    d0_i   = 8'd11;
    d1_i   = 8'd21;
    d2_i   = 8'd31;
    d3_i   = 8'd41;
    d4_i   = 8'd51;
    d5_i   = 8'd61;
    d6_i   = 8'd71;
    d7_i   = 8'd81;
    d8_i   = 8'd91;
    done_i = 1;
    #10 done_i = 0;

    // More test cases can be added for other rows and columns
    // For example, testing zero-padding and boundary conditions

    // End the simulation
    #100 $finish;
  end

  // Monitor the outputs to check results
  initial begin
    $monitor(
        "Time = %0t | d0_o = %d, d1_o = %d, d2_o = %d, d3_o = %d, d4_o = %d, d5_o = %d, d6_o = %d, d7_o = %d, d8_o = %d, done_o = %d",
        $time, d0_o, d1_o, d2_o, d3_o, d4_o, d5_o, d6_o, d7_o, d8_o, done_o);
  end

endmodule
