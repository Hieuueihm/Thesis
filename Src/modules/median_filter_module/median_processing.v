module median_processing #(
    parameter COLS = 30,
    parameter ROWS = 30
) (
    input clk,
    input rst_n,
    input [7:0] data_i,
    input done_i,
    output [7:0] data_o,
    output done_o,
    output [7:0] m_3x3_o,
    output done_3x3_o,
    output [7:0] m_5x5_o,
    output done_5x5_o,
    output [7:0] m_7x7_o,
    output done_7x7_o
);


  wire [7:0] d0_o, d1_o, d2_o, d3_o, d4_o, d5_o, d6_o;
  wire prepare_done_o;
  preparation_6 #(
      .DEPTH(COLS)
  ) median_PREPARATION (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .data_i(data_i),
      .data0_o(d0_o),
      .data1_o(d1_o),
      .data2_o(d2_o),
      .data3_o(d3_o),
      .data4_o(d4_o),
      .data5_o(d5_o),
      .data6_o(d6_o),
      .done_o(prepare_done_o)
  );
  assign data_o = d3_o;
  assign done_o = prepare_done_o;

  /*
        0 
        1 
        2
        3
        4
        5
        6
    */


  median_filter_3x3 #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) median_FILTER_3x3 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(prepare_done_o),
      .d0_i(d2_o),
      .d1_i(d3_o),
      .d2_i(d4_o),
      .median_o(m_3x3_o),
      .done_o(done_3x3_o)
  );

  median_filter_5x5 #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) median_FILTER_5x5 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(prepare_done_o),
      .d0_i(d1_o),
      .d1_i(d2_o),
      .d2_i(d3_o),
      .d3_i(d4_o),
      .d4_i(d5_o),
      .median_o(m_5x5_o),
      .done_o(done_5x5_o)
  );


  median_filter_7x7 #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) median_FILTER_7x7 (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(prepare_done_o),
      .d0_i(d0_o),
      .d1_i(d1_o),
      .d2_i(d2_o),
      .d3_i(d3_o),
      .d4_i(d4_o),
      .d5_i(d5_o),
      .d6_i(d6_o),
      .median_o(m_7x7_o),
      .done_o(done_7x7_o)
  );

  //  integer file_3x3, file_5x5, file_7x7;

  // initial begin
  //     // Mở file để ghi dữ liệu
  //     file_3x3 = $fopen("D:\\Thesis\\codetest\\python\\median_3x3_verilog.txt", "w");
  //     file_5x5 = $fopen("D:\\Thesis\\codetest\\python\\median_5x5_verilog.txt", "w");
  //     file_7x7 = $fopen("D:\\Thesis\\codetest\\python\\median_7x7_verilog.txt", "w");

  //     if (file_3x3 == 0 || file_5x5 == 0 || file_7x7 == 0) begin
  //         $display("Error: Unable to open one or more files!");
  //         $stop;
  //     end
  // end
  // reg done_3x3_prev;
  // reg done_5x5_prev;
  // reg done_7x7_prev;
  // always @(posedge clk ) begin
  //     if (~rst_n) begin
  //         done_3x3_prev <= 0;
  //         done_5x5_prev <= 0;
  //         done_7x7_prev <= 0;
  //     end else begin
  //         done_3x3_prev <= done_3x3_o;
  //         done_5x5_prev <= done_5x5_o;
  //         done_7x7_prev <= done_7x7_o;
  //     end
  // end
  // always @(posedge clk) begin
  //     if (done_3x3_o) begin
  //         $fwrite(file_3x3, "%d\n", m_3x3_o);
  //     end
  //     if (done_5x5_o) begin
  //         $fwrite(file_5x5, "%d\n", m_5x5_o);
  //     end
  //     if (done_7x7_o) begin
  //         $fwrite(file_7x7, "%d\n", m_7x7_o);
  //     end
  //     if(done_3x3_prev == 1 && done_3x3_o == 0) begin
  //         $fclose(file_3x3);
  //     end
  //     if(done_5x5_prev == 1 && done_5x5_o == 0) begin
  //         $fclose(file_5x5);
  //     end
  //             if(done_7x7_prev == 1 && done_7x7_o == 0) begin
  //         $fclose(file_7x7);
  //     end
  // end


endmodule
