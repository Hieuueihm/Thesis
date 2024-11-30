`timescale 1ns / 1ps

module SortAscending9_tb;

  // Inputs
  reg [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9;

  // Outputs
  wire [7:0] min, out2, out3, out4, mid, out6, out7, out8, max;

  // Instantiate the Unit Under Test (UUT)
  SortAscending9 uut (
      .S1  (S1),
      .S2  (S2),
      .S3  (S3),
      .S4  (S4),
      .S5  (S5),
      .S6  (S6),
      .S7  (S7),
      .S8  (S8),
      .S9  (S9),
      .min (min),
      .out2(out2),
      .out3(out3),
      .out4(out4),
      .mid (mid),
      .out6(out6),
      .out7(out7),
      .out8(out8),
      .max (max)
  );

  initial begin
    // Initialize Inputs
    S1 = 8'd10;
    S2 = 8'd55;
    S3 = 8'd23;
    S4 = 8'd18;
    S5 = 8'd92;
    S6 = 8'd44;
    S7 = 8'd67;
    S8 = 8'd31;
    S9 = 8'd76;

    // Wait for a few nanoseconds
    #10;
    // Display the outputs
    $display("Inputs: %d %d %d %d %d %d %d %d %d", S1, S2, S3, S4, S5, S6, S7, S8, S9);


    // Apply another set of test inputs
    #20;
    S1 = 8'd90;
    S2 = 8'd10;
    S3 = 8'd70;
    S4 = 8'd50;
    S5 = 8'd30;
    S6 = 8'd80;
    S7 = 8'd20;
    S8 = 8'd60;
    S9 = 8'd40;

    #10;
    $display("Inputs: %d %d %d %d %d %d %d %d %d", S1, S2, S3, S4, S5, S6, S7, S8, S9);

    // End simulation
    #10;
    $stop;
  end

endmodule
