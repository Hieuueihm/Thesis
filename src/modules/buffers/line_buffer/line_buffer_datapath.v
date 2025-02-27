

module line_buffer_datapath #(
    parameter DEPTH = 1024
) (
    input clk,
    input rst_n,
    input wr_en,
    input rd_en,
    input [7:0] data_i,
    output reg [7:0] data_o,
    output [9:0] i_counter
);
  reg [7:0] mem[0:DEPTH - 1];
  wire [9:0] internal_wr_pointer;
  wire [9:0] internal_wr_pointer_plus_1;
  wire [9:0] internal_rd_pointer, internal_rd_pointer_plus_1;
  wire [9:0] internal_i_counter_plus_1;

  // assign data_o = (i_counter == DEPTH) ? mem[internal_rd_pointer] : 8'bzz;

  always @(posedge clk) begin
    if (~rst_n) begin
      data_o <= 0;
    end else if (rd_en) begin
      data_o <= mem[internal_rd_pointer];
    end else data_o <= 0;
  end

  plus_1 #(
      .WIDTH(10)
  ) COUNTER_I (
      .rst_n(rst_n),
      .clk(clk),
      .en(wr_en),
      .D(i_counter),
      .Q(internal_i_counter_plus_1)
  );


  plus_1 #(
      .WIDTH(10)
  ) COUNTER_WR_POINTER (
      .rst_n(rst_n),
      .clk(clk),
      .en(wr_en),
      .D(internal_wr_pointer),
      .Q(internal_wr_pointer_plus_1)
  );
  assign  internal_wr_pointer = (internal_wr_pointer_plus_1 == DEPTH) ? 0 : internal_wr_pointer_plus_1;

  reg [9:0] i_counter_reg;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) i_counter_reg <= 0;
    else if (internal_i_counter_plus_1 > DEPTH - 1) i_counter_reg <= i_counter_reg;
    else i_counter_reg <= internal_i_counter_plus_1;
  end

  assign i_counter = i_counter_reg;

  // Write process
  always @(posedge clk) begin
    if (~rst_n) begin
    end else if (wr_en) begin
      mem[internal_wr_pointer] <= data_i;
    end
  end


  plus_1 #(
      .WIDTH(10)
  ) COUNTER_rd_POINTER (
      .rst_n(rst_n),
      .clk(clk),
      .en(rd_en),
      .D(internal_rd_pointer),
      .Q(internal_rd_pointer_plus_1)
  );
  assign internal_rd_pointer = (internal_rd_pointer_plus_1 == DEPTH) ? 0 : internal_rd_pointer_plus_1;

endmodule
