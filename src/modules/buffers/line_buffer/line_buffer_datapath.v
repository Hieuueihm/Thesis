

module line_buffer_datapath #(
    parameter DEPTH = 1024
) (
    input clk,
    input rst_n,
    input wr_en,
    input rd_en,
    input [7:0] data_i,
    output [7:0] data_o,
    output reg [9:0] i_counter,
    input done_o
);

  reg  done_o_prev;
  wire done_o_negedge;
  always @(posedge clk) begin
    if (~rst_n) begin
      done_o_prev <= 0;
    end else begin
      done_o_prev <= done_o;
    end
  end

  assign done_o_negedge = (done_o_prev == 1 & done_o == 0) ? 1'b1 : 1'b0;
  reg [9:0] internal_wr_pointer;
  reg [9:0] internal_rd_pointer;
  always @(posedge clk) begin
    if (~rst_n) begin
      internal_wr_pointer <= 0;
    end else if (done_o_negedge) begin
      internal_wr_pointer <= 0;
    end else if (wr_en) begin
      internal_wr_pointer <= internal_wr_pointer + 1;
    end
    if (internal_wr_pointer == DEPTH - 1) begin
      internal_wr_pointer <= 0;
    end
  end
  always @(posedge clk) begin
    if (~rst_n) begin
      i_counter <= 0;
    end else if (done_o_negedge) begin
      i_counter <= 0;
    end else if (wr_en & (i_counter < DEPTH - 2)) begin
      i_counter <= i_counter + 1;
    end

  end


  always @(posedge clk) begin
    if (~rst_n) begin
      internal_rd_pointer <= 0;
    end else if (done_o_negedge) begin
      internal_rd_pointer <= 0;
    end else if (rd_en) begin
      internal_rd_pointer <= internal_rd_pointer + 1;
    end
    if (internal_rd_pointer == DEPTH - 1) begin
      internal_rd_pointer <= 0;
    end

  end




  memory #(
      .DEPTH(DEPTH)
  ) memory_inst (
      .clk(clk),
      .rst_n(rst_n),
      .r_addr(internal_rd_pointer),
      .w_addr(internal_wr_pointer),
      .ren(rd_en),
      .wren(wr_en),
      .w_data(data_i),
      .r_data(data_o)
  );


endmodule
