
module MRELBP_CI_R2_tb;

  // Declare inputs as regs and outputs as wires
  reg clk;
  reg rst;
  reg done_i;
  reg [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9;
  wire [7:0] ci_o;
  wire done_o;

  // Instantiate the MRELBP_CI_R2 module
  MRELBP_CI_R2 uut (
      .clk(clk),
      .rst(rst),
      .done_i(done_i),
      .S1(S1),
      .S2(S2),
      .S3(S3),
      .S4(S4),
      .S5(S5),
      .S6(S6),
      .S7(S7),
      .S8(S8),
      .S9(S9),
      .ci_o(ci_o),
      .done_o(done_o)
  );

  // Generate clock
  always begin
    #5 clk = ~clk;  // Clock period of 10 time units
  end

  // Test sequence
  initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    done_i = 0;
    S1 = 8'd0;
    S2 = 8'd0;
    S3 = 8'd0;
    S4 = 8'd0;
    S5 = 8'd10;
    S6 = 8'd2;
    S7 = 8'd0;
    S8 = 8'd2;
    S9 = 8'd7;

    // Apply reset
    rst = 1;
    #10 rst = 0;  // Release reset

    // Provide input and trigger done_i
    #10 done_i = 1;
    #10 done_i = 0;

    // Wait for some time to observe the outputs
    #20;

    // Apply different values and trigger done_i again
    // S5 = 8'd2;  // As per original example
    // S7 = 8'd27;
    done_i = 1;
    #10 done_i = 0;

    // Observe the output
    #20;
    $display("ci_o = %d, done_o = %d", ci_o, done_o);

    // Finish simulation
    $finish;
  end

endmodule
