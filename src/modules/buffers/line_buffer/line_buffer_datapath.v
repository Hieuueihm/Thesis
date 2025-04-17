
module line_buffer_datapath #(
    parameter DEPTH = 1024
) (
    input clk,
    input rst_n,
    input wr_en,
    input rd_en,
    input reset_en,
    input [7:0] data_i,
    output [7:0] data_o,
    output first_done,
    output last_done
);

  (* use_carry_chain = "yes" *)reg [ 9:0] wr_pointer;
  (* use_carry_chain = "yes" *)reg [ 9:0] rd_pointer;
  (* use_carry_chain = "yes" *)reg [31:0] count_num_inp;
  (* use_carry_chain = "yes" *)reg [31:0] count_num_oup;

  always @(posedge clk) begin
    if (~rst_n) begin
      count_num_inp <= 0;
    end else if (reset_en) begin
      count_num_inp <= 0;
    end else if (wr_en) begin
      count_num_inp <= count_num_inp + 1;
    end

  end

  always @(posedge clk) begin
    if (~rst_n) begin
      count_num_oup <= 0;
    end else if (reset_en) begin
      count_num_oup <= 0;
    end else if (rd_en) begin
      count_num_oup <= count_num_oup + 1;
    end
  end

  assign first_done = (count_num_inp == DEPTH - 2) ? 1'b1 : 1'b0;
  assign last_done  = (count_num_oup == count_num_inp) ? 1'b1 : 1'b0;

  always @(posedge clk) begin
    if (~rst_n) begin
      wr_pointer <= 0;
    end else if (reset_en) begin
      wr_pointer <= 0;
    end else if (wr_pointer == DEPTH - 1) begin
      wr_pointer <= 0;
    end else if (wr_en) begin
      wr_pointer <= wr_pointer + 1;
    end

  end


  always @(posedge clk) begin
    if (~rst_n) begin
      rd_pointer <= 0;
    end else if (reset_en) begin
      rd_pointer <= 0;
    end else if (rd_pointer == DEPTH - 1) begin
      rd_pointer <= 0;
    end else if (rd_en) begin
      rd_pointer <= rd_pointer + 1;
    end


  end







  memory #(
      .DEPTH(DEPTH),
      .DATA_SIZE(8)
  ) memory_inst (
      .clk(clk),
      .rst_n(rst_n),
      .r_addr(rd_pointer),
      .w_addr(wr_pointer),
      .ren(rd_en),
      .wren(wr_en),
      .w_data(data_i),
      .r_data(data_o)
  );


endmodule
