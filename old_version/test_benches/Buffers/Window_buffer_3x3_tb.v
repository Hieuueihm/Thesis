`timescale 1ns / 1ps

module window_buffer_3x3_tb ();


  // Parameters
  parameter COLS = 5;
  parameter ROWS = 5;

  // Inputs
  reg clk;
  reg rst_n;
  reg i_valid;
  reg [7:0] S1_i, S2_i, S3_i;

  // Outputs
  wire [7:0] S1_o, S2_o, S3_o, S4_o, S5_o, S6_o, S7_o, S8_o, S9_o;
  wire ;
  wire progress_;

  // Instantiate the Unit Under Test (UUT)
  window_buffer_3x3 #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) uut (
      .clk(clk),
      .rst_n(rst_n),
      .i_valid(i_valid),
      .S1_i(S1_i),
      .S2_i(S2_i),
      .S3_i(S3_i),
      .S1_o(S1_o),
      .S2_o(S2_o),
      .S3_o(S3_o),
      .S4_o(S4_o),
      .S5_o(S5_o),
      .S6_o(S6_o),
      .S7_o(S7_o),
      .S8_o(S8_o),
      .S9_o(S9_o),
      .(),
      .progress_(progress_)
  );

  // Clock generation
  always #5 clk = ~clk;

  integer i;
  // Test stimulus
  initial begin
    // Initialize Inputs
    clk    = 0;
    rst_n    = 1;
    i_valid = 0;
    S1_i   = 0;
    S2_i   = 0;
    S3_i   = 0;

    // Reset pulse
    #10;
    rst_n   = 0;
    i_valid = 1;
    // 1 2 3 4 5
    // 1 2 3 4 5
    // 1 2 3 4 5

    // 6 7 8 9 10
    // 6 7 8 9 10
    // 6 7 8 9 10
    for (i = 1; i < 16; i = i + 1) begin
      S1_i = i;
      S2_i = i;
      S3_i = i;
      #10;
    end
    i_valid = 0;


    #50;
    #100;
    $stop;
  end

endmodule
