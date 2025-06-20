`timescale 1ns / 1ps

module median_filter_3x3_calc_tb;

  // Testbench Signals
  reg clk;
  reg rst_n;
  reg i_valid;
  reg [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9;
  wire [7:0] median_o;
  wire ;

  // Instantiate the median_filter_3x3_calc module
  median_filter_3x3_calc uut (
      .clk(clk),
      .rst_n(rst_n),
      .i_valid(i_valid),
      .S1(S1),
      .S2(S2),
      .S3(S3),
      .S4(S4),
      .S5(S5),
      .S6(S6),
      .S7(S7),
      .S8(S8),
      .S9(S9),
      .median_o(median_o),
      .()
  );

  // Clock Generation
  always begin
    #5 clk = ~clk;  // 100 MHz clock (10 ns period)
  end

  // Test Sequence
  initial begin
    // Initialize signals
    clk = 0;
    rst_n = 0;
    i_valid = 0;
    S1 = 8'd0;
    S2 = 8'd0;
    S3 = 8'd0;
    S4 = 8'd0;
    S5 = 8'd0;
    S6 = 8'd0;
    S7 = 8'd0;
    S8 = 8'd0;
    S9 = 8'd0;

    // Apply reset
    rst_n = 1;
    #10;
    rst_n   = 0;
    i_valid = 1;
    #10;

    // Test Case 2: Another set of values
    S1 = 8'd0;
    S2 = 8'd0;
    S3 = 8'd0;
    S4 = 8'd12;
    S5 = 8'd24;
    S6 = 8'd0;
    S7 = 8'd61;
    S8 = 8'd72;
    S9 = 8'd0;

    // Wait for 1 clock cycle and check the output
    wait ( == 1);
    i_valid = 0;
    #10;

    i_valid = 1;
    #10;

    // Test Case 2: Another set of values
    S1 = 8'd20;
    S2 = 8'd90;
    S3 = 8'd60;
    S4 = 8'd30;
    S5 = 8'd10;
    S6 = 8'd70;
    S7 = 8'd50;
    S8 = 8'd40;
    S9 = 8'd80;

    // Wait for 1 clock cycle and check the output
    wait ( == 1);
    i_valid = 0;

    #100;



    // Finish the simulation
    $stop;
  end

  // Monitor the output to check correctness
  initial begin
    $monitor("Time: %t | median Output: %d | Done Output: %b", $time, median_o, );
  end

endmodule


/*

  S1 = 25     45
  S2 = 35 ->  35 
  S3 = 45     25

  S4 = 55     75
  S5 = 65 ->  65 -
  S6 = 75     55

  S7 = 85     105
  S8 = 95 ->  95
  S9 = 105    85
  med5= 65
  max4 = 75
  min7 == 55 
  min5 = 75
*/
