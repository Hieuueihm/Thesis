`timescale 1ns / 1ps

module mrelbp_ci_r4_tb ();

  reg clk;
  reg rst_n;
  reg i_valid;
  reg [7:0] S1;
  reg [7:0] S2;
  reg [7:0] S3;
  reg [7:0] S4;
  reg [7:0] S5, S6, S7, S8, S9;
  wire ;
  wire ci_o;
  wire progress_;
  mrelbp_ci_r4 DUT (
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
      .(),
      .ci_o(ci_o),
      .progress_(progress_)
  );


  // Clock generation
  always #5 clk = ~clk;  // 10 ns clock period

  initial begin
    // Initialize inputs
    clk     = 0;
    rst_n   = 1;
    i_valid = 0;
    S1      = 8'h00;
    S2      = 8'h00;
    S3      = 8'h00;
    S4      = 8'h00;
    S5      = 8'h00;
    S6      = 8'h00;
    S7      = 8'h00;
    S8      = 8'h0;
    S9      = 8'h0;

    // Apply reset
    #10 rst_n = 0;

    // Test Case 1: Apply some values
    #10;
    i_valid = 1;
    S1      = 8'd10;
    S2      = 8'd10;
    S3      = 8'd10;
    S4      = 8'd10;
    S5      = 8'd10;
    S6      = 8'd10;
    S7      = 8'd10;
    S8      = 8'd10;
    S9      = 8'd10;
    #10;
    i_valid = 1;
    S1      = 8'd20;
    S2      = 8'd20;
    S3      = 8'd20;
    S4      = 8'd20;
    S5      = 8'd20;
    S6      = 8'd20;
    S7      = 8'd20;
    S8      = 8'd20;
    S9      = 8'd20;
    #10;
    i_valid = 1;
    S1      = 8'd30;
    S2      = 8'd30;
    S3      = 8'd30;
    S4      = 8'd30;
    S5      = 8'd30;
    S6      = 8'd30;
    S7      = 8'd30;
    S8      = 8'd30;
    S9      = 8'd30;
    #10;
    i_valid = 1;
    S1      = 8'd40;
    S2      = 8'd40;
    S3      = 8'd40;
    S4      = 8'd40;
    S5      = 8'd40;
    S6      = 8'd40;
    S7      = 8'd40;
    S8      = 8'd40;
    S9      = 8'd40;
    #10;
    i_valid = 1;
    S1      = 8'd50;
    S2      = 8'd50;
    S3      = 8'd50;
    S4      = 8'd50;
    S5      = 8'd50;
    S6      = 8'd50;
    S7      = 8'd50;
    S8      = 8'd50;
    S9      = 8'd50;
    #10;
    i_valid = 1;
    S1      = 8'd60;
    S2      = 8'd60;
    S3      = 8'd60;
    S4      = 8'd60;
    S5      = 8'd60;
    S6      = 8'd60;
    S7      = 8'd60;
    S8      = 8'd60;
    S9      = 8'd60;
    #10;
    i_valid = 1;
    S1      = 8'd70;
    S2      = 8'd70;
    S3      = 8'd70;
    S4      = 8'd70;
    S5      = 8'd70;
    S6      = 8'd70;
    S7      = 8'd70;
    S8      = 8'd70;
    S9      = 8'd70;
    #10;
    S1 = 8'd80;
    S2 = 8'd80;
    S3 = 8'd80;
    S4 = 8'd80;
    S5 = 8'd80;
    S6 = 8'd80;
    S7 = 8'd80;
    S8 = 8'd80;
    S9 = 8'd80;
    #10;
    i_valid = 1;
    S1      = 8'd90;
    S2      = 8'd90;
    S3      = 8'd90;
    S4      = 8'd90;
    S5      = 8'd90;
    S6      = 8'd90;
    S7      = 8'd90;
    S8      = 8'd90;
    S9      = 8'd90;
    #10;
    i_valid = 1;
    S1      = 8'd100;
    S2      = 8'd100;
    S3      = 8'd100;
    S4      = 8'd100;
    S5      = 8'd100;
    S6      = 8'd100;
    S7      = 8'd100;
    S8      = 8'd100;
    S9      = 8'd100;
    #10;
    i_valid = 1;
    S1      = 8'd110;
    S2      = 8'd110;
    S3      = 8'd110;
    S4      = 8'd110;
    S5      = 8'd110;
    S6      = 8'd110;
    S7      = 8'd110;
    S8      = 8'd110;
    S9      = 8'd110;
    #10;
    i_valid = 1;
    S1      = 8'd10;
    S2      = 8'd10;
    S3      = 8'd10;
    S4      = 8'd10;
    S5      = 8'd10;
    S6      = 8'd10;
    S7      = 8'd10;
    S8      = 8'd10;
    S9      = 8'd10;
    #10;
    i_valid = 1;
    S1      = 8'd20;
    S2      = 8'd20;
    S3      = 8'd20;
    S4      = 8'd20;
    S5      = 8'd20;
    S6      = 8'd20;
    S7      = 8'd20;
    S8      = 8'd20;
    S9      = 8'd20;
    #10;
    i_valid = 1;
    S1      = 8'd30;
    S2      = 8'd30;
    S3      = 8'd30;
    S4      = 8'd30;
    S5      = 8'd30;
    S6      = 8'd30;
    S7      = 8'd30;
    S8      = 8'd30;
    S9      = 8'd30;
    #10;
    i_valid = 1;
    S1      = 8'd40;
    S2      = 8'd40;
    S3      = 8'd40;
    S4      = 8'd40;
    S5      = 8'd40;
    S6      = 8'd40;
    S7      = 8'd40;
    S8      = 8'd40;
    S9      = 8'd40;
    #10;
    i_valid = 1;
    S1      = 8'd50;
    S2      = 8'd50;
    S3      = 8'd50;
    S4      = 8'd50;
    S5      = 8'd50;
    S6      = 8'd50;
    S7      = 8'd50;
    S8      = 8'd50;
    S9      = 8'd50;
    #10;
    i_valid = 1;
    S1      = 8'd60;
    S2      = 8'd60;
    S3      = 8'd60;
    S4      = 8'd60;
    S5      = 8'd60;
    S6      = 8'd60;
    S7      = 8'd60;
    S8      = 8'd60;
    S9      = 8'd60;
    #10;
    i_valid = 1;
    S1      = 8'd70;
    S2      = 8'd70;
    S3      = 8'd70;
    S4      = 8'd70;
    S5      = 8'd70;
    S6      = 8'd70;
    S7      = 8'd70;
    S8      = 8'd70;
    S9      = 8'd70;
    #10;
    S1 = 8'd80;
    S2 = 8'd80;
    S3 = 8'd80;
    S4 = 8'd80;
    S5 = 8'd80;
    S6 = 8'd80;
    S7 = 8'd80;
    S8 = 8'd80;
    S9 = 8'd80;
    #10;
    i_valid = 1;
    S1      = 8'd90;
    S2      = 8'd90;
    S3      = 8'd90;
    S4      = 8'd90;
    S5      = 8'd90;
    S6      = 8'd90;
    S7      = 8'd90;
    S8      = 8'd90;
    S9      = 8'd90;
    #10;
    i_valid = 1;
    S1      = 8'd100;
    S2      = 8'd100;
    S3      = 8'd100;
    S4      = 8'd100;
    S5      = 8'd100;
    S6      = 8'd100;
    S7      = 8'd100;
    S8      = 8'd100;
    S9      = 8'd100;
    #10;
    i_valid = 1;
    S1      = 8'd110;
    S2      = 8'd110;
    S3      = 8'd110;
    S4      = 8'd110;
    S5      = 8'd110;
    S6      = 8'd110;
    S7      = 8'd110;
    S8      = 8'd110;
    S9      = 8'd110;
    #10;
    i_valid = 0;


    #1000;
    $stop;
  end



endmodule
