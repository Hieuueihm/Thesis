`timescale 1ns / 1ps

module SortAscending7_tb;

  // Inputs
  reg clk;
  reg rst;
  reg done_i;
  reg [7:0] S1, S2, S3, S4, S5, S6, S7;

  // Outputs
  wire [7:0] min, out2, out3, mid, out5, out6, max;
  wire done_o;

  // Instantiate the module under test
  SortAscending7 uut (
      .clk(clk),
      .rst(rst),
      .done_i(done_i),
      .done_o(done_o),
      .S1(S1),
      .S2(S2),
      .S3(S3),
      .S4(S4),
      .S5(S5),
      .S6(S6),
      .S7(S7),
      .min(min),
      .out2(out2),
      .out3(out3),
      .mid(mid),
      .out5(out5),
      .out6(out6),
      .max(max)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10 ns period clock
  end

  // Test sequence
  initial begin
    // Initialize inputs
    rst = 1;
    done_i = 0;
    S1 = 0;
    S2 = 0;
    S3 = 0;
    S4 = 0;
    S5 = 0;
    S6 = 0;
    S7 = 0;

    // Apply reset
    #20;
    rst = 0;

    // Test case 1
    S1 = 8'd12;
    S2 = 8'd24;
    S3 = 8'd35;
    S4 = 8'd9;
    S5 = 8'd18;
    S6 = 8'd0;
    S7 = 8'd100;
    done_i = 1;
    #10;


    // // Test case 2
    // S1 = 8'd50;
    // S2 = 8'd40;
    // S3 = 8'd30;
    // S4 = 8'd20;
    // S5 = 8'd10;
    // #10;
    done_i = 0;

    // // Wait for the result
    // wait (done_o);
    // #10;
    // $display("Test Case 2:");
    // $display("min = %d, out2 = %d, mid = %d, out4 = %d, max = %d", min, out2, mid, out4, max);

    // // Check results for Test Case 2
    // if (min == 8'd10 && out2 == 8'd20 && mid == 8'd30 && out4 == 8'd40 && max == 8'd50) begin
    //   $display("Test Case 2 Passed!");
    // end else begin
    //   $display("Test Case 2 Failed!");
    // end

    // End of simulation
    #200;
    $stop;
  end

endmodule
