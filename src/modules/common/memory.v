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
  // reg [7:0] w_latch;  // Latch giữ dữ liệu ghi
  // reg [7:0] addr_latch;
  always @(posedge clk) begin
    if (wren) begin
      mem[w_addr] <= w_data;
    end
  end
  // always @(posedge clk) begin
  //   if (~rst_n) begin
  //     w_latch <= 0;
  //   end else if (wren) begin
  //     w_latch <= w_data;  // Latch giá trị khi wren = 1
  //   end
  // end
  // always @(posedge clk) begin
  //   if (~rst_n) begin
  //     addr_latch <= 0;
  //   end else if (wren) begin
  //     addr_latch <= w_addr;  // Latch giá trị khi wren = 1
  //   end
  // end
  // wire wr_en_delay;
  // dff #(1) wr_en_delay_inst (
  //     .clk(clk),
  //     .rst_n(rst_n),
  //     .D(wren),
  //     .Q(wr_en_delay)
  // );
  // always @(posedge clk) begin
  //   if (wr_en_delay) begin
  //     mem[addr_latch] <= w_latch;
  //   end
  // end


  reg [7:0] r;
  always @(posedge clk) begin
    if (~rst_n) begin
      r <= 0;
    end else if (ren && !(wren && (w_addr == r_addr))) begin
      r <= mem[r_addr];
    end else if (wren && (w_addr == r_addr)) begin
      r <= w_data;
    end
  end

  assign r_data = r;

endmodule
