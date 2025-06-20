module ci_top #(
    parameter ROWS = 30,
    parameter COLS = 30
) (
    input clk,
    input rst_n,
    input [7:0] m_3x3_i,
    input done_i,
    output ci_r2_o,
    output done_r2,
    output progress_done_r2,
    output ci_r4_o,
    output done_r4,
    output progress_done_r4,
    output ci_r6_o,
    output done_r6,
    output progress_done_r6
);

  wire [7:0] data0_o;
  wire [7:0] data1_o;
  wire [7:0] data2_o;
  wire [7:0] data3_o;
  wire [7:0] data4_o;
  wire [7:0] data5_o;
  wire [7:0] data6_o;
  wire [7:0] data7_o;
  wire [7:0] data8_o;
  wire [7:0] data9_o, data10_o, data11_o, data12_o;
  wire buffer_r6_done_o;
  wire buffer_r4_done_o;
  wire buffer_r2_done_o;
  buffer_12_rows_ci #(
      .DEPTH(COLS)
  ) BUFFER_12_ROWS (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .data_i(m_3x3_i),
      .data0_o(data0_o),
      .data1_o(data1_o),
      .data2_o(data2_o),
      .data3_o(data3_o),
      .data4_o(data4_o),
      .data5_o(data5_o),
      .data6_o(data6_o),
      .data7_o(data7_o),
      .data8_o(data8_o),
      .data9_o(data9_o),
      .data10_o(data10_o),
      .data11_o(data11_o),
      .data12_o(data12_o),
      // .data13_o(data13_o),
      // .data14_o(data14_o),
      // .data15_o(data15_o),
      // .data16_o(data16_o),
      .done_r2_o(buffer_r2_done_o),
      .done_r4_o(buffer_r4_done_o),
      .done_r6_o(buffer_r6_done_o)
  );



  // // ci calculation
  mrelbp_ci_r2 #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) r2_TOP (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(buffer_r2_done_o),
      .S1(data0_o),
      .S2(data1_o),
      .S3(data2_o),
      .S4(data3_o),
      .S5(data4_o),
      .done_o(done_r2),
      .ci_o(ci_r2_o),
      .progress_done_o(progress_done_r2)
  );

  mrelbp_ci_r4 #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) r4_TOP (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(buffer_r4_done_o),
      .S1(data0_o),
      .S2(data1_o),
      .S3(data2_o),
      .S4(data3_o),
      .S5(data4_o),
      .S6(data5_o),
      .S7(data6_o),
      .S8(data7_o),
      .S9(data8_o),
      .done_o(done_r4),
      .ci_o(ci_r4_o),
      .progress_done_o(progress_done_r4)
  );

  mrelbp_ci_r6 #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) r6_TOP (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(buffer_r6_done_o),
      .S1(data0_o),
      .S2(data1_o),
      .S3(data2_o),
      .S4(data3_o),
      .S5(data4_o),
      .S6(data5_o),
      .S7(data6_o),
      .S8(data7_o),
      .S9(data8_o),
      .S10(data9_o),
      .S11(data10_o),
      .S12(data11_o),
      .S13(data12_o),
      .done_o(done_r6),
      .ci_o(ci_r6_o),
      .progress_done_o(progress_done_r6)
  );


  //   integer file1, file2, file3;
  //   integer count;
  //   always @(posedge clk or negedge rst_n) begin
  //     if (~rst_n) begin
  //       count = 0;
  //       file1 = $fopen("D:\\Thesis\\codetest\\python\\ci_r2_verilog.txt", "w");
  //       file2 = $fopen("D:\\Thesis\\codetest\\python\\ci_r4_verilog.txt", "w");
  //       file3 = $fopen("D:\\Thesis\\codetest\\python\\ci_r6_verilog.txt", "w");
  //     end
  //     if (done_r2) begin
  //       if (file1) begin
  //         $fwrite(file1, "%d\n", ci_r2_o);
  //       end
  //     end
  //     if (progress_done_r2) begin
  //       $fclose(file1);
  //     end
  //     if (done_r4) begin
  //       if (file2) begin
  //         $fwrite(file2, "%d\n", ci_r4_o);
  //       end
  //     end
  //     if (progress_done_r4) begin
  //       $fclose(file2);
  //     end

  //     if (done_r6) begin
  //       if (file3) begin
  //         $fwrite(file3, "%d\n", ci_r6_o);
  //         $fflush(file3);
  //       end
  //     end
  //     if (progress_done_r6 && count == 0) begin
  //       count = count + 1;
  //       $fwrite(file3, "end\n");
  //     end else if (progress_done_r6 && count == 1) begin
  //       $fclose(file3);
  //     end

  //   end

endmodule
