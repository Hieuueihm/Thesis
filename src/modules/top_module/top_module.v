module top_module #(
    parameter COLS = 128,
    parameter ROWS = 128
) (
    input clk,
    input rst_n,
    input start_i,
    // slave interface
    input [7:0] grayscale_i,
    input i_valid,
    output o_data_ready,
    // master interface 
    output [31:0] histogram_o,
    output o_valid,
    input i_data_ready,
    // interrupt
    output o_intr
);

  wire axis_prog_full;
  assign o_data_ready = ~axis_prog_full;


  wire finish;
  wire read_finish;
  wire read_en;
  wire [31:0] histogram;
  wire o_histogram_valid;
  wire o_intr_o;
  top_module__controller inst_top_module__controller (
      .clk        (clk),
      .rst_n      (rst_n),
      .finish_i   (finish),
      .start_i    (start_i),
      .read_finish(read_finish),
      .o_intr     (o_intr_o),
      .read_en    (read_en)
  );
  top_module__datapath #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) inst_top_module__datapath (
      .clk        (clk),
      .rst_n      (rst_n),
      .grayscale_i(grayscale_i),
      .i_valid    (i_valid),
      .read_en    (read_en),
      .histogram_o(histogram),
      .o_valid    (o_histogram_valid),
      .finish     (finish),
      .read_finish(read_finish)
  );

  output_buffer_ip OB (
      .wr_rst_busy  (),                   // output wire wr_rst_busy
      .rd_rst_busy  (),                   // output wire rd_rst_busy
      .s_aclk       (clk),
      .s_aresetn    (rst_n),
      // s_axis
      .s_axis_tvalid(o_histogram_valid),
      .s_axis_tready(),
      .s_axis_tdata (histogram),
      // m_axis
      .m_axis_tvalid(o_valid),            // output wire m_axis_tvalid
      .m_axis_tready(i_data_ready),       // input wire m_axis_tready
      .m_axis_tdata (histogram_o),

      .axis_prog_full(axis_prog_full)
  );
  wire o_intr_q;
  dff #(
      .WIDTH(1)
  ) dff_o_intr (
      .clk(clk),
      .rst_n(rst_n),
      .D(o_intr_o),
      .Q(o_intr_q)
  );

  dff #(
      .WIDTH(1)
  ) dff_o_intr_q1 (
      .clk(clk),
      .rst_n(rst_n),
      .D(o_intr_q),
      .Q(o_intr)
  );
  //   integer file;
  //   always @(posedge clk) begin
  //     if (~rst_n) begin
  //       file = $fopen("D:\\Thesis\\codetest\\python\\histogram_verilog_prev.txt", "w");
  //     end else if (o_histogram_valid) begin
  //       $fwrite(file, "%d\n", histogram);
  //     end else if (o_intr) begin
  //       $fclose(file);
  //     end
  //   end


endmodule

