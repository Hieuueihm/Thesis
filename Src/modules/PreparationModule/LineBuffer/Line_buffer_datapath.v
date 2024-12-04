

module Line_buffer_datapath #(
    parameter DEPTH = 1024
) (
    input clk,
    input rst,
    input wr_en,
    input rd_en,
    input [7:0] data_i,
    output [7:0] data_o,
    output reg [9:0] i_counter
);
  reg [7:0] mem[0:DEPTH - 1];
  reg [9:0] internal_wr_pointer;
  reg [9:0] internal_rd_pointer;
  reg [9:0] internal_i_counter;



  //  output assignment
  assign data_o = (internal_i_counter == DEPTH) ? mem[internal_rd_pointer] : 8'bz;
  assign i_counter = internal_i_counter;

  always @(posedge clk) begin
    if (rst) begin
      internal_i_counter <= 0;
    end else begin
      if (wr_en) begin
        internal_i_counter <= (internal_i_counter == DEPTH) ? internal_i_counter : internal_i_counter + 1;
      end

    end
  end
  // Write process
  always @(posedge clk) begin
    if (rst) begin
      internal_wr_pointer <= 0;
    end else if (wr_en) begin
      mem[internal_wr_pointer] <= data_i;
      internal_wr_pointer <= (internal_wr_pointer == DEPTH - 1) ? 0 : internal_wr_pointer + 1;
    end
  end

  // Read process
  always @(posedge clk) begin
    if (rst) begin
      internal_rd_pointer <= 0;
    end else if (rd_en) begin
      internal_rd_pointer <= (internal_rd_pointer == DEPTH - 1) ? 0 : internal_rd_pointer + 1;
    end
  end
endmodule
