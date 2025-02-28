module memory #(
    parameter DEPTH = 1024
) (
    input clk,
    input rst_n,
    input ren,
    input wren,
    input [9:0] r_addr,
    input [9:0] w_addr,
    input [7:0] w_data,
    output [7:0] r_data
);

  reg [7:0] mem[0:DEPTH - 1];
  always @(posedge clk) begin
    if (~rst_n) begin
      mem[w_addr] <= 0;
    end else if (wren) begin
      mem[w_addr] <= w_data;
    end
  end
  reg [7:0] r;
  always @(posedge clk) begin
    if (~rst_n) begin
      r <= 0;
    end else if (ren) begin
      r <= mem[r_addr];
    end
  end

  assign r_data = r;

endmodule
