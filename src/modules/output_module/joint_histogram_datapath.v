module joint_histogram_datapath (
    input clk,
    input rst_n,
    input ci_i,
    input done_i,
    input [3:0] ni_i,
    input [3:0] rd_i,
    input count_en,
    input read_en,
    output reg [15:0] cinird_o,
    output done_read,
    input reset_en,
    output reset_done
);


  wire [7:0] ci_scale;
  assign ci_scale = (ci_i << 6) + (ci_i << 5) + (ci_i << 2);
  wire [7:0] ni_scale;
  assign ni_scale = (ni_i << 3) + (ni_i << 1);
  reg [7:0] ci_delay, ni_delay, rd_delay;
  always @(posedge clk) begin
    if (~rst_n) begin
      ci_delay <= 0;
      ni_delay <= 0;
      rd_delay <= 0;
    end else if (done_i) begin
      ci_delay <= ci_scale;
      ni_delay <= ni_scale;
      rd_delay <= {4'b0, rd_i};
    end
  end
  wire done_delay;
  register #(
      .WIDTH(1)
  ) DONE_I_DELAY (
      .clk(clk),
      .rst_n(rst_n),
      .D(done_i),
      .Q(done_delay)
  );
  wire [7:0] counter_value;

  assign counter_value = ci_delay + ni_delay + rd_delay;

  reg [7:0] reset_index;
  reg [7:0] read_index;
  assign reset_index_lt_200 = (reset_index < 200);
  wire w_data_en;
  assign w_data_en  = (reset_index_lt_200 | (count_en & done_delay));
  assign reset_done = (reset_index == 200);
  wire [15:0] w_data;
  wire [15:0] r_data;
  assign done_read = read_index > 198;
  always @(posedge clk) begin
    if (~rst_n) begin
      reset_index <= 0;
      read_index  <= 0;
    end else if (reset_en) begin
      reset_index <= 0;
      read_index  <= 0;
    end else if (reset_index_lt_200) begin
      reset_index <= reset_index + 1;
    end else if (read_en) begin
      read_index <= read_index + 1;
      // done_read  <= (read_index > 197);
    end
  end
  assign w_data = (reset_index_lt_200) ? 0 : (r_data + 1);
  memory_1 #(
      .DEPTH(200),
      .DATA_SIZE(16)
  ) mem (
      .clk(clk),
      .rst_n(rst_n),
      .ren(read_en | (count_en & done_delay)),
      .wren(w_data_en),
      .r_addr(read_en ? read_index : counter_value),
      .w_addr(reset_index_lt_200 ? reset_index : counter_value),
      .w_data(reset_index_lt_200 ? 0 : w_data),
      .r_data(r_data)
  );
  always @(posedge clk) begin
    if (~rst_n) begin
      cinird_o <= 0;
    end else if (read_en) begin
      cinird_o <= r_data;
    end else cinird_o <= 0;

  end

  // integer file;
  // always @(posedge clk) begin
  //     if (~rst_n) begin
  //         file = $fopen("D:\\Thesis\\codetest\\python\\ci_ni_rd_data.txt", "w");
  //         end else if (done_i) begin
  //         if (file) begin
  //             $fwrite(file, "(%d, %d, %d)\n", ci_i, ni_i, rd_i);
  //         end
  //         end else if (read_index == 200) begin
  //         $fclose(file);
  //     end
  // end

endmodule
