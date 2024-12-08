module CI_buffer_R2 #(
    parameter COLS,
    parameter ROWS
) (
    input clk,
    input rst,
    input done_i,
    input [7:0] d0_i,
    d1_i,
    d2_i,
    d3_i,
    d4_i,
    output reg [7:0] data0_o,
    data1_o,
    data2_o,
    data3_o,
    data4_o,
    output reg done_o,
    output [9:0] i_row_o,
    i_col_o
);

  reg [9:0] i_row, i_col;

  reg [7:0] i_counter;

  assign i_row_o = i_row;
  assign i_col_o = i_col;


  reg done_reg;
  assign done_o = (i_counter == 2 && done_reg == 0) ? 1 : 0;

  // handle with i rows and i cols

  always @(posedge clk) begin
    if (rst) begin
      i_row <= 0;
      i_col <= 0;
      done_reg <= 0;
    end else begin
      if (done_o) begin
        i_col <= (i_col == COLS - 1) ? 0 : i_col + 1;
        if (i_col == COLS - 1) begin
          if (i_row == ROWS - 1) begin
            done_reg <= 1;
          end
          i_row <= (i_row == ROWS - 1) ? 0 : i_row + 1;
        end
      end
    end
  end


  always @(posedge clk) begin
    if (rst) begin
      i_counter <= 0;
    end else begin
      if (done_i) begin
        i_counter <= (i_counter == 2) ? i_counter : i_counter + 1;
      end


    end

  end


  always @(*) begin
    if (rst) begin
      data0_o <= 0;
      data1_o <= 0;
      data2_o <= 0;
      data3_o <= 0;
      data4_o <= 0;

    end else begin
      // zero padding
      if (done_o) begin
        data0_o <= d0_i;
        data1_o <= d1_i;
        data2_o <= d2_i;
        data3_o <= d3_i;
        data4_o <= d4_i;
      end
    end
  end



endmodule
