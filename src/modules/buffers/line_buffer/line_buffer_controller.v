module line_buffer_controller #(
    parameter DEPTH = 1024
) (
    input        clk,        // Clock input
    input        rst_n,      // Reset input
    input        done_i,     // Done signal when operation is complete
    input  [9:0] i_counter,
    output       wr_en,      // Write enable signal
    output       rd_en,      // Read enable signal
    output       done_o
);  // Done output signal


  wire i_counter_eq = (i_counter >= (DEPTH / 2) - 1) ? 1 : 0;

  wire i_counter_eq_max;
  dff #(
      .WIDTH(1)
  ) SHIFT_I_SIGNAL (
      .clk(clk),
      .rst_n(rst_n),
      .D(i_counter_eq),
      .Q(i_counter_eq_max)
  );

  wire done_and_i_counter = done_i & i_counter_eq_max;

  assign wr_en = done_i;


  wire done_o_mux_delay;
  dff #(
      .WIDTH(1)
  ) SHIFT_DONE (
      .clk(clk),
      .rst_n(rst_n),
      .D(done_and_i_counter),
      .Q(done_o_mux_delay)
  );

  reg [9:0] counter;
  reg done_extended;

  // delay done_i
  always @(posedge clk or posedge rst_n) begin
    if (~rst_n) begin
      counter       <= 0;
      done_extended <= 0;
    end else if (done_and_i_counter) begin
      counter       <= 0;
      done_extended <= 1;
    end else if (done_extended && counter < DEPTH - 2) begin
      counter       <= counter + 1;
      done_extended <= 1;
    end else begin
      counter       <= 0;
      done_extended <= 0;
    end
  end

  assign done_o_p = done_and_i_counter | done_extended;
  dff #(
      .WIDTH(1)
  ) SHIFT_DONE_O (
      .clk(clk),
      .rst_n(rst_n),
      .D(done_o_p),
      .Q(done_o)
  );
  assign rd_en = done_and_i_counter | done_extended;


endmodule
