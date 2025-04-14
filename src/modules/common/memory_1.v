module memory_1 #(
    parameter DEPTH = 1024,
    parameter DATA_SIZE = 8
) (
    input clk,
    input rst_n,
    input ren,
    input wren,
    input [$clog2(DEPTH)-1:0] r_addr,
    input [$clog2(DEPTH)-1:0] w_addr,
    input [DATA_SIZE-1 : 0] w_data,
    output [DATA_SIZE- 1:0] r_data
);

  (* ram_style = "block" *) reg [DATA_SIZE - 1:0] mem[0:DEPTH - 1];

  always @(posedge clk) begin
    if (wren) begin
      mem[w_addr] <= w_data;
    end
  end

  assign r_data = (ren) ? mem[r_addr] : 0;

endmodule
