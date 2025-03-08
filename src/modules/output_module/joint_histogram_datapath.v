module joint_histogram_datapath (
    input clk,
    input rst_n,
    input ci_i,
    input done_i,
    input [3:0] ni_i,
    input [3:0] rd_i,
    input count_en,
    input read_en,
    output [15:0] cinird_o,
    output reg done_read,
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
  dff #(
      .WIDTH(1)
  ) DONE_I_DELAY (
      .clk(clk),
      .rst_n(rst_n),
      .D(done_i),
      .Q(done_delay)
  );
  wire [7:0] counter_value;

  assign counter_value = ci_delay + ni_delay + rd_delay;

  (* ram_style = "block" *)reg [15:0] register_array[0:199];
  reg [ 7:0] reset_index;
  reg [15:0] output_value;
  reg [ 7:0] read_index;
  assign reset_done = (reset_index == 200) ? 1'b1 : 1'b0;
  always @(posedge clk) begin
    if (~rst_n) begin
      reset_index <= 0;
      output_value <= 0;
      read_index   <= 0;
      done_read    <= 0;
    end else if (reset_en) begin
      reset_index <= 0;
      output_value <= 0;
      read_index   <= 0;
      done_read    <= 0;
    end else if (reset_index < 200) begin
      register_array[reset_index] <= 0;
      reset_index <= reset_index + 1;
    end else if (count_en && done_delay) begin
      register_array[counter_value] <= register_array[counter_value] + 1;
    end else if (read_en) begin
      output_value <= register_array[read_index];
      read_index   <= read_index + 1;
      done_read    <= (read_index > 197);
    end
  end
  assign cinird_o = output_value;

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
