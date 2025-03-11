module dff (
    input  clk,
    input  rst_n,
    input  D,
    output Q
);
  reg data_out;
  assign Q = data_out;
  always @(posedge clk) begin
    if (~rst_n) begin
      data_out <= 0;
    end else begin
      data_out <= D;
    end
  end

endmodule
