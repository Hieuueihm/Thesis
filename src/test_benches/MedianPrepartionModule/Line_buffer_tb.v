`timescale 1ns / 1ps



`define clk_period 10


module line_buffer_tb ();

  reg clk, rst_n, we_i;
  reg [7:0] data_i;
  wire [7:0] data_o;
  wire ;


  initial clk = 1'b1;
  always #(`clk_period / 2) clk = ~clk;
  line_buffer #(
      .DEPTH(5)
  ) uut (
      .clk(clk),
      .rst_n(rst_n),
      .i_valid(we_i),
      .data_i(data_i),
      .data_o(data_o),
      .()
  );
  integer i;
  initial begin
    rst_n  = 1'b1;
    data_i = 8'b0;
    we_i   = 1'b0;

    #(`clk_period);
    rst_n = 1'b0;
    we_i  = 1'b1;

    for (i = 1; i < 11; i = i + 1) begin
      data_i = i;
      #(`clk_period);
    end

    we_i = 1'b0;
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);
    #(`clk_period);

    $stop;

  end

endmodule
