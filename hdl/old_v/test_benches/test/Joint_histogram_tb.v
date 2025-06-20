`timescale 1ns / 1ps

module joint_histogram_tb ();

  // Clock and reset signals
  reg clk;
  reg rst_n;

  // Inputs to the DUT
  reg ci_i;
  reg [3:0] ni_i;
  reg [3:0] rd_i;
  reg i_valid;
  reg progress_done_i;

  // Outputs from the DUT
  wire [15:0] cinird_o;
  wire ;
  wire finish;

  // Instantiate the DUT
  joint_histogram DUT (
      .clk(clk),
      .rst_n(rst_n),
      .ci_i(ci_i),
      .ni_i(ni_i),
      .rd_i(rd_i),
      .i_valid(i_valid),
      .progress_done_i(progress_done_i),
      .cinird_o(cinird_o),
      .(),
      .finish(finish)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns clock period
  end

  // Test stimulus
  initial begin
    rst_n           = 1;
    ci_i            = 0;
    ni_i            = 0;
    rd_i            = 0;
    i_valid         = 0;
    progress_done_i = 0;

    #20;
    rst_n = 0;
    i_valid = 1;

    ci_i = 1;
    ni_i = 4'd2;
    rd_i = 4'd0;

    #10;
    ci_i = 0;
    ni_i = 4'd2;
    rd_i = 4'd1;

    #10;
    progress_done_i = 1;
    i_valid         = 0;
    #10;
    progress_done_i = 0;  // Deassert progress_done_i

    // Wait and monitor outputs
    repeat (500) @(posedge clk);  // Allow time for all registers to be processed

    // Finish simulation
    $stop;
  end

  // Monitor outputs
  initial begin
    $monitor("Time: %0t | ci_i: %b | ni_i: %h | rd_i: %b | : %b | finish: %b | cinird_o: %h",
             $time, ci_i, ni_i, rd_i, , finish, cinird_o);
  end


endmodule
