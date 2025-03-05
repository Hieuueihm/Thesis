module joint_histogram (
    input clk,
    input rst_n,
    input ci_i,
    input [3:0] ni_i,
    input [3:0] rd_i,
    input done_i,
    input progress_done_i,
    output [15:0] cinird_o,
    output done_o,
    output finish
);

  wire done_read;
  wire count_en, read_en;
  joint_histogram_controller joint_CONTROLLER (
      .clk(clk),
      .rst_n(rst_n),
      .done_i(done_i),
      .progress_done_i(progress_done_i),
      .done_read(done_read),
      .done_o(done_o),
      .finish(finish),
      .count_en(count_en),
      .read_en(read_en)
  );

  joint_histogram_datapath joint_DATAPATH (
      .clk(clk),
      .rst_n(rst_n),
      .ci_i(ci_i),
      .done_i(done_i),
      .ni_i(ni_i),
      .rd_i(rd_i),
      .count_en(count_en),
      .read_en(read_en),
      .cinird_o(cinird_o),
      .done_read(done_read),
      .finish(finish)
  );



  // integer file1;
  // always @(posedge clk) begin
  //     if (~rst_n) begin
  //         file1 = $fopen("D:\\Thesis\\codetest\\python\\joint_r4.txt", "w");
  //         end else if (done_i) begin
  //         if (file1) begin
  //             $fwrite(file1, "%d %d %d\n",ci_i, ni_i, rd_i);
  //         end
  //         end else if (progress_done_i) begin
  //         $fclose(file1);
  //     end

  // end

endmodule
