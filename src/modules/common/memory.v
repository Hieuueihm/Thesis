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
    output reg [7:0] r_data  // ✅ Change to reg for synchronous output
);

  (* ram_style = "block" *) reg [7:0] mem[0:DEPTH - 1];

  always @(posedge clk) begin
    if (wren) begin
      mem[w_addr] <= w_data;
    end
  end

  always @(posedge clk) begin
    if (~rst_n) begin
      r_data <= 0;
    end else if (ren) begin
      r_data <= mem[r_addr];
    end
  end

endmodule
