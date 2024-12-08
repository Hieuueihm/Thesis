module MRELBP_CI_R2_tb;

  // Parameters for the DUT
  parameter ROWS = 7;
  parameter COLS = 7;

  // Testbench signals
  reg clk;
  reg rst;
  reg done_i;
  reg [7:0] d0_i, d1_i, d2_i, d3_i, d4_i;
  wire ci_o;
  wire done_o;

  // Instantiate the DUT (Device Under Test)
  MRELBP_CI_R2 #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) uut (
      .clk(clk),
      .rst(rst),
      .done_i(done_i),
      .d0_i(d0_i),
      .d1_i(d1_i),
      .d2_i(d2_i),
      .d3_i(d3_i),
      .d4_i(d4_i),
      .ci_o(ci_o),
      .done_o(done_o)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;  // 100 MHz clock
  end

  // Stimulus process
  initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    done_i = 0;
    d0_i = 8'b0;
    d1_i = 8'b0;
    d2_i = 8'b0;
    d3_i = 8'b0;
    d4_i = 8'b0;

    // Reset the system
    rst = 1;
    #10 rst = 0;
    done_i = 1;
    #10;

    // Apply test stimuli
    d0_i = 8'd1;
    d1_i = 8'd2;
    d2_i = 8'd3;
    d3_i = 8'd4;
    d4_i = 8'd5;
    #10;

    d0_i = 8'd6;
    d1_i = 8'd7;
    d2_i = 8'd8;
    d3_i = 8'd9;
    d4_i = 8'd10;
    #10;

    d0_i = 8'd11;
    d1_i = 8'd12;
    d2_i = 8'd13;
    d3_i = 8'd14;
    d4_i = 8'd15;
    #10;


    d0_i = 8'd16;
    d1_i = 8'd17;
    d2_i = 8'd18;
    d3_i = 8'd19;
    d4_i = 8'd20;
    #10;


    d0_i = 8'd21;
    d1_i = 8'd22;
    d2_i = 8'd23;
    d3_i = 8'd24;
    d4_i = 8'd25;
    #10;


    d0_i = 8'd26;
    d1_i = 8'd27;
    d2_i = 8'd28;
    d3_i = 8'd29;
    d4_i = 8'd30;
    #10;


    d0_i = 8'd11;
    d1_i = 8'd12;
    d2_i = 8'd13;
    d3_i = 8'd14;
    d4_i = 8'd15;
    #10;

    #100;
    done_i = 0;
    // Finish simulation
    $stop;
  end

  // Monitor outputs
  initial begin
    $monitor("At time %t, done_o = %b, ci_o = %b", $time, done_o, ci_o);
  end

endmodule
