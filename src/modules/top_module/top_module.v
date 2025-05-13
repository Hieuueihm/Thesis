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



  //`ifdef SYNTHESIS
  wire axis_prog_full;

  assign o_data_ready = ~axis_prog_full;
  //`elsif SIMULATION
  //  assign o_data_ready = 1'b1;
  //`endif

  wire finish;
  wire read_finish;
  wire read_en;
  wire [31:0] histogram;
  wire o_histogram_valid;
  wire o_intr_o;
  wire start_en;
  top_module__controller inst_top_module__controller (
      .clk        (clk),
      .rst_n      (rst_n),
      .finish_i   (finish),
      .start_en   (start_en),
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
      .start_i    (start_i),
      .start_en   (start_en),
      .read_en    (read_en),
      .histogram_o(histogram),
      .o_valid    (o_histogram_valid),
      .finish     (finish),
      .read_finish(read_finish)
  );


  //`ifdef SIMULATION
  //  assign o_intr = o_intr_o;
  //  assign histogram_o = histogram;
  //  assign o_valid = o_histogram_valid;
  //`endif
  //`ifdef SYNTHESIS
  output_buffer_ip OB (
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
  wire o_intr_q, o_intr_q1, o_intr_q2;
  register #(
      .WIDTH(1)
  ) register_o_intr (
      .clk(clk),
      .rst_n(rst_n),
      .D(o_intr_o),
      .Q(o_intr_q)
  );
  register #(
      .WIDTH(1)
  ) register_o_intr_2 (
      .clk(clk),
      .rst_n(rst_n),
      .D(o_intr_q),
      .Q(o_intr_q1)
  );
  register #(
      .WIDTH(1)
  ) register_o_intr_3 (
      .clk(clk),
      .rst_n(rst_n),
      .D(o_intr_q1),
      .Q(o_intr_q2)
  );

  register #(
      .WIDTH(1)
  ) register_o_intr_4 (
      .clk(clk),
      .rst_n(rst_n),
      .D(o_intr_q2),
      .Q(o_intr)
  );
  //`endif
  //   integer file;
  //   always @(posedge clk or negedge rst_n) begin
  //     if (~rst_n) begin
  //       file = $fopen("D:\\Thesis\\codetest\\python\\histogram_verilog_prev.txt", "w");
  //     end else if (o_histogram_valid) begin
  //       $fwrite(file, "%d\n", histogram);
  //     end else if (o_intr) begin
  //       $fclose(file);
  //     end
  //   end


endmodule
