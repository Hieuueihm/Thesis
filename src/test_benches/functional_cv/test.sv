`timescale 1ns / 1ps
`define clk_period 10
`define half_clk_period 5
`define SIZE 128
`define COLS `SIZE
`define ROWS `SIZE


module test_top_tb ();
  reg [7:0] matrix[0:`ROWS-1][0:`COLS-1];
  `include "zero_padding_3x3_cv.sv"
  `include "line_buffer_cv.sv"
  `include "zero_padding_5x5_cv.sv"
  `include "zero_padding_7x7_cv.sv"
  `include "median_calc_3x3_cv.sv"
  `include "median_calc_5x5_cv.sv"
  `include "median_calc_7x7_cv.sv"

  task read_matrix;
    input integer file_id;
    reg [7:0] temp_value;
    integer i, j;

    begin
      for (i = 0; i < `ROWS; i = i + 1) begin
        for (j = 0; j < `COLS; j = j + 1) begin
          if (!$fscanf(file_id, "%d", temp_value)) begin
            $display("Error: Not enough data in the file.");
            disable read_matrix;
          end
          matrix[i][j] = temp_value;
        end
      end
    end

  endtask
  reg clk;
  reg rst_n;
  reg [7:0] grayscale_i;
  reg i_valid;
  reg start_i;
  reg i_data_ready;


  wire [31:0] histogram_o;
  wire o_valid;
  wire o_intr;
  wire o_data_ready;

  top_module #(
      .COLS(`COLS),
      .ROWS(`ROWS)
  ) DUT (
      .clk(clk),
      .rst_n(rst_n),
      .grayscale_i(grayscale_i),
      .i_valid(i_valid),
      .o_data_ready(o_data_ready),
      .start_i(start_i),
      .histogram_o(histogram_o),
      .o_valid(o_valid),
      .i_data_ready(i_data_ready),
      .o_intr(o_intr)
  );
  // genvar k;
  // generate
  //   for (k = 0; k < 6; k++) begin : gen_monitors
  //     line_buffer_monitor monitor_inst (
  //         .clk(clk),
  //         .rst_n(rst_n),
  //         .i_valid(DUT.inst_top_module__datapath.median_PROCESSING.median_PREPARATION.gen_line_buffers[k].LINE_BUFFER.done_i),
  //         .i_data(DUT.inst_top_module__datapath.median_PROCESSING.median_PREPARATION.gen_line_buffers[k].LINE_BUFFER.data_i),
  //         .o_valid(DUT.inst_top_module__datapath.median_PROCESSING.median_PREPARATION.gen_line_buffers[k].LINE_BUFFER.o_valid),
  //         .o_data(DUT.inst_top_module__datapath.median_PROCESSING.median_PREPARATION.gen_line_buffers[k].LINE_BUFFER.data_o)
  //     );
  //   end
  // endgenerate

  line_buffer_if vif (
      clk,
      rst_n
  );
  assign vif.data_i = DUT.inst_top_module__datapath.median_PROCESSING.median_PREPARATION.gen_line_buffers[0].LINE_BUFFER.data_i;
  assign vif.data_o = DUT.inst_top_module__datapath.median_PROCESSING.median_PREPARATION.gen_line_buffers[0].LINE_BUFFER.data_o;
  assign vif.done_i = DUT.inst_top_module__datapath.median_PROCESSING.median_PREPARATION.gen_line_buffers[0].LINE_BUFFER.done_i;
  assign vif.o_valid = DUT.inst_top_module__datapath.median_PROCESSING.median_PREPARATION.gen_line_buffers[0].LINE_BUFFER.o_valid;
  assign vif.o_start = DUT.inst_top_module__datapath.median_PROCESSING.median_PREPARATION.gen_line_buffers[0].LINE_BUFFER.o_start;
  assign vif.o_finish = DUT.inst_top_module__datapath.median_PROCESSING.median_PREPARATION.gen_line_buffers[0].LINE_BUFFER.o_finish;

  line_buffer_cv lb_cv = new(vif);









  zero_padding_3x3_if z_vif (
      clk,
      rst_n
  );
  assign z_vif.done_i = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.done_i;
  assign z_vif.done_o = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.done_o;
  assign z_vif.d0_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d0_i;
  assign z_vif.d1_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d1_i;
  assign z_vif.d2_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d2_i;
  assign z_vif.d0_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d0_o;
  assign z_vif.d1_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d1_o;
  assign z_vif.d2_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d2_o;
  assign z_vif.d3_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d3_o;
  assign z_vif.d4_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d4_o;
  assign z_vif.d5_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d5_o;
  assign z_vif.d6_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d6_o;
  assign z_vif.d7_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d7_o;
  assign z_vif.d8_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_DATA_MODULATE.d8_o;

  zero_padding_3x3_cv zero_3x3_cv = new(z_vif);

  zero_padding_5x5_if z5_vif (
      clk,
      rst_n
  );
  assign z5_vif.done_i = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.done_i;
  assign z5_vif.done_o = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.done_o;
  assign z5_vif.d0_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d0_i;
  assign z5_vif.d1_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d1_i;
  assign z5_vif.d2_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d2_i;
  assign z5_vif.d3_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d3_i;
  assign z5_vif.d4_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d4_i;
  assign z5_vif.d0_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d0_o;
  assign z5_vif.d1_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d1_o;
  assign z5_vif.d2_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d2_o;
  assign z5_vif.d3_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d3_o;
  assign z5_vif.d4_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d4_o;
  assign z5_vif.d5_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d5_o;
  assign z5_vif.d6_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d6_o;
  assign z5_vif.d7_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d7_o;
  assign z5_vif.d8_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d8_o;
  assign z5_vif.d9_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d9_o;
  assign z5_vif.d10_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d10_o;
  assign z5_vif.d11_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d11_o;
  assign z5_vif.d12_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d12_o;
  assign z5_vif.d13_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d13_o;
  assign z5_vif.d14_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d14_o;
  assign z5_vif.d15_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d15_o;
  assign z5_vif.d16_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d16_o;
  assign z5_vif.d17_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d17_o;
  assign z5_vif.d18_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d18_o;
  assign z5_vif.d19_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d19_o;
  assign z5_vif.d20_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d20_o;
  assign z5_vif.d21_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d21_o;
  assign z5_vif.d22_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d22_o;
  assign z5_vif.d23_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d23_o;
  assign z5_vif.d24_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5x5_DATA_MODULATE.d24_o;


  zero_padding_5x5_cv zero_5x5_cv = new(z5_vif);


  zero_padding_7x7_if z7_vif (
      clk,
      rst_n
  );
  assign z7_vif.done_i = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.done_i;
  assign z7_vif.done_o = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.done_o;
  assign z7_vif.d0_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d0_i;
  assign z7_vif.d1_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d1_i;
  assign z7_vif.d2_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d2_i;
  assign z7_vif.d3_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d3_i;
  assign z7_vif.d4_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d4_i;
  assign z7_vif.d5_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d5_i;
  assign z7_vif.d6_i   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d6_i;
  assign z7_vif.d0_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d0_o;
  assign z7_vif.d1_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d1_o;
  assign z7_vif.d2_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d2_o;
  assign z7_vif.d3_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d3_o;
  assign z7_vif.d4_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d4_o;
  assign z7_vif.d5_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d5_o;
  assign z7_vif.d6_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d6_o;
  assign z7_vif.d7_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d7_o;
  assign z7_vif.d8_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d8_o;
  assign z7_vif.d9_o   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d9_o;
  assign z7_vif.d10_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d10_o;
  assign z7_vif.d11_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d11_o;
  assign z7_vif.d12_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d12_o;
  assign z7_vif.d13_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d13_o;
  assign z7_vif.d14_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d14_o;
  assign z7_vif.d15_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d15_o;
  assign z7_vif.d16_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d16_o;
  assign z7_vif.d17_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d17_o;
  assign z7_vif.d18_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d18_o;
  assign z7_vif.d19_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d19_o;
  assign z7_vif.d20_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d20_o;
  assign z7_vif.d21_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d21_o;
  assign z7_vif.d22_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d22_o;
  assign z7_vif.d23_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d23_o;
  assign z7_vif.d24_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d24_o;
  assign z7_vif.d25_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d25_o;
  assign z7_vif.d26_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d26_o;
  assign z7_vif.d27_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d27_o;
  assign z7_vif.d28_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d28_o;
  assign z7_vif.d29_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d29_o;
  assign z7_vif.d30_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d30_o;
  assign z7_vif.d31_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d31_o;
  assign z7_vif.d32_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d32_o;
  assign z7_vif.d33_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d33_o;
  assign z7_vif.d34_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d34_o;
  assign z7_vif.d35_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d35_o;
  assign z7_vif.d36_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d36_o;
  assign z7_vif.d37_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d37_o;
  assign z7_vif.d38_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d38_o;
  assign z7_vif.d39_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d39_o;
  assign z7_vif.d40_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d40_o;
  assign z7_vif.d41_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d41_o;
  assign z7_vif.d42_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d42_o;
  assign z7_vif.d43_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d43_o;
  assign z7_vif.d44_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d44_o;
  assign z7_vif.d45_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d45_o;
  assign z7_vif.d46_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d46_o;
  assign z7_vif.d47_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d47_o;
  assign z7_vif.d48_o  = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_DATA_MODULATE.d48_o;


  zero_padding_7x7_cv zero_7x7_cv = new(z7_vif);

  median_calc_3x3_if m_vif (
      clk,
      rst_n
  );
  assign m_vif.done_i = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.done_i;
  assign m_vif.done_o = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.done_o;
  assign m_vif.S1    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.S1;
  assign m_vif.S2    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.S2;
  assign m_vif.S3    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.S3;
  assign m_vif.S4    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.S4;
  assign m_vif.S5    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.S5;
  assign m_vif.S6    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.S6;
  assign m_vif.S7    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.S7;
  assign m_vif.S8    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.S8;
  assign m_vif.S9    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.S9;
  assign m_vif.median_o = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_3x3.median_3X3_CALC.median_o;


  median_calc_3x3_cv median_3x3_cv = new(m_vif);


  median_calc_5x5_if m5_vif (
      clk,
      rst_n
  );
  assign m5_vif.done_i = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.done_i;
  assign m5_vif.done_o = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.done_o;
  assign m5_vif.S1    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S1;
  assign m5_vif.S2    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S2;
  assign m5_vif.S3    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S3;
  assign m5_vif.S4    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S4;
  assign m5_vif.S5    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S5;
  assign m5_vif.S6    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S6;
  assign m5_vif.S7    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S7;
  assign m5_vif.S8    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S8;
  assign m5_vif.S9    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S9;
  assign m5_vif.S10   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S10;
  assign m5_vif.S11   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S11;
  assign m5_vif.S12   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S12;
  assign m5_vif.S13   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S13;
  assign m5_vif.S14   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S14;
  assign m5_vif.S15   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S15;
  assign m5_vif.S16   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S16;
  assign m5_vif.S17   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S17;
  assign m5_vif.S18   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S18;
  assign m5_vif.S19   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S19;
  assign m5_vif.S20   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S20;
  assign m5_vif.S21   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S21;
  assign m5_vif.S22   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S22;
  assign m5_vif.S23   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S23;
  assign m5_vif.S24   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S24;
  assign m5_vif.S25   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.S25;
  assign m5_vif.median_o = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_5x5.median_5X5_CALC.median_o;

  median_calc_5x5_cv median_5x5_cv = new(m5_vif);


  median_calc_7x7_if m7_vif (
      clk,
      rst_n
  );
  assign m7_vif.done_i = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.done_i;
  assign m7_vif.done_o = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.done_o;
  assign m7_vif.S1    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S1;
  assign m7_vif.S2    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S2;
  assign m7_vif.S3    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S3;
  assign m7_vif.S4    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S4;
  assign m7_vif.S5    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S5;
  assign m7_vif.S6    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S6;
  assign m7_vif.S7    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S7;
  assign m7_vif.S8    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S8;
  assign m7_vif.S9    = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S9;
  assign m7_vif.S10   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S10;
  assign m7_vif.S11   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S11;
  assign m7_vif.S12   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S12;
  assign m7_vif.S13   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S13;
  assign m7_vif.S14   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S14;
  assign m7_vif.S15   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S15;
  assign m7_vif.S16   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S16;
  assign m7_vif.S17   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S17;
  assign m7_vif.S18   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S18;
  assign m7_vif.S19   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S19;
  assign m7_vif.S20   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S20;
  assign m7_vif.S21   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S21;
  assign m7_vif.S22   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S22;
  assign m7_vif.S23   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S23;
  assign m7_vif.S24   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S24;
  assign m7_vif.S25   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S25;
  assign m7_vif.S26   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S26;
  assign m7_vif.S27   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S27;
  assign m7_vif.S28   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S28;
  assign m7_vif.S29   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S29;
  assign m7_vif.S30   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S30;
  assign m7_vif.S31   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S31;
  assign m7_vif.S32   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S32;
  assign m7_vif.S33   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S33;
  assign m7_vif.S34   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S34;
  assign m7_vif.S35   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S35;
  assign m7_vif.S36   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S36;
  assign m7_vif.S37   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S37;
  assign m7_vif.S38   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S38;
  assign m7_vif.S39   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S39;
  assign m7_vif.S40   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S40;
  assign m7_vif.S41   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S41;
  assign m7_vif.S42   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S42;
  assign m7_vif.S43   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S43;
  assign m7_vif.S44   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S44;
  assign m7_vif.S45   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S45;
  assign m7_vif.S46   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S46;
  assign m7_vif.S47   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S47;
  assign m7_vif.S48   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S48;
  assign m7_vif.S49   = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.S49;
  assign m7_vif.median_o = DUT.inst_top_module__datapath.median_PROCESSING.median_FILTER_7x7.median_7x7_CALC.median_o;

  median_calc_7x7_cv median_7x7_cv = new(m7_vif);










  initial begin
    clk <= 1'b0;

  end
  initial begin
    fork
      zero_3x3_cv.monitor();
      zero_5x5_cv.monitor();
      zero_7x7_cv.monitor();
      median_3x3_cv.monitor();
      median_5x5_cv.monitor();
      median_7x7_cv.monitor();
    join_none
  end

  initial begin
    fork
      lb_cv.monitor();
    join_none
  end

  always #(`half_clk_period) clk = ~clk;

  integer row, col;
  integer file_out;
  integer file;
  integer file_out1;
  initial begin
    clk         <= 1'b1;
    rst_n       <= 1'b0;
    i_valid     <= 1'b0;
    grayscale_i <= 8'b0;
    i_data_ready = 1'b0;

    start_i <= 0;
    file = $fopen("D:\\Thesis\\Src\\test_benches\\test\\random_matrix.txt", "r");
    if (file == 0) begin
      $display("Error: Cannot open file.");
      $finish;
    end

    file_out = $fopen("D:\\Thesis\\codetest\\python\\histogram_verilog.txt", "w");
    // file_out1 = $fopen("D:\\Thesis\\codetest\\python\\histogram_verilog_1.txt", "w");
    if (file_out == 0) begin
      $display("Error: Could not open output files.");
      $finish;
    end



    read_matrix(file);
    $fclose(file);

    #(`clk_period * 2);
    rst_n <= 1'b1;
    i_data_ready = 1'b1;


    #(`clk_period);
    start_i <= 1'b1;
    #(`clk_period);
    start_i <= 1'b0;
    #(`clk_period * 5);
    i_valid <= 1'b1;

    for (row = 0; row < `ROWS; row = row + 1) begin
      for (col = 0; col < `COLS; col = col + 1) begin
        grayscale_i <= matrix[row][col];
        #(`clk_period);
      end
    end
    i_valid <= 1'b0;

    @(posedge o_intr);

    // $fclose(file_out1);
    $fclose(file_out);

    lb_cv.report();  // In coverage ra console
    zero_3x3_cv.report();
    zero_5x5_cv.report();
    zero_7x7_cv.report();
    median_3x3_cv.report();
    median_5x5_cv.report();
    median_7x7_cv.report();

    #100;
    $stop;
  end

  always @(posedge clk) begin
    if (o_valid) begin
      $fwrite(file_out, "%d\n", histogram_o);
      $fflush(file_out);

    end
    // if (o_valid) $fwrite(file_out1, "%d\n", histogram_o);
  end
endmodule
