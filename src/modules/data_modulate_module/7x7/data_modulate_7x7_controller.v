module data_modulate_7x7_controller (
    input rst_n,
    input clk,
    input done_i,
    input padding_fi,
    input finish_en,
    output o_valid,
    output o_en,
    output reg count_en,
    output reg reset_en  `ifdef SIMULATION 
    ,
    output reg [1:0] current_state
    `endif

);
`ifdef SYNTHESIS
  reg [1:0] current_state;
`endif
  reg [1:0] next_state;
  parameter IDLE = 2'b00;
  parameter START = 2'b01;
  parameter DATA = 2'b10;
  parameter DONE = 2'b11;
  always @(posedge clk) begin
    if (~rst_n) begin
      current_state <= IDLE;
    end else begin
      current_state <= next_state;
    end
  end

  always @(*) begin
    // next_state = current_state;
    case (current_state)
      IDLE: next_state = (done_i) ? START : IDLE;
      START: next_state = (padding_fi) ? DATA : START;
      DATA: next_state = (finish_en) ? DONE : DATA;
      DONE: next_state = IDLE;
      default: next_state = IDLE;

    endcase
  end
  reg output_en;
  assign o_en = output_en;
  register #(
      .WIDTH(1)
  ) register_done (
      .clk(clk),
      .rst_n(rst_n),
      .D(output_en),
      .Q(o_valid)
  );

  always @(*) begin
    output_en = 0;
    count_en  = 0;
    reset_en  = 0;
    case (current_state)
      IDLE: begin
      end
      START: begin
        count_en = 1'b1;
        reset_en = 1'b1;
      end
      DATA: begin
        output_en = 1'b1;
      end
      DONE: begin

      end
      default: begin
        output_en = 1'b0;
        count_en  = 1'b0;
        reset_en  = 1'b0;
      end

    endcase
  end




endmodule
