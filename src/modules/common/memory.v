module memory #(
    parameter DEPTH = 1024,
    parameter DATA_SIZE = 8
) (
    input clk,
    input rst_n,
    input ren,
    input wren,
    input [$clog2(DEPTH)-1:0] r_addr,
    input [$clog2(DEPTH)-1:0] w_addr,
    input [DATA_SIZE-1 :0] w_data,
    output reg [DATA_SIZE- 1:0] r_data  
);

  (* ram_style = "block" *) reg [DATA_SIZE - 1:0] mem[0:DEPTH - 1];

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
