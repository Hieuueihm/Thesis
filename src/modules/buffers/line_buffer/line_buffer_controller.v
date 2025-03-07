module line_buffer_controller #(
    parameter DEPTH = 1024
) (
    input  clk,         // Clock input
    input  rst_n,       // Reset input
    input  done_i,      // Done signal when operation is complete
    input  first_done,
    input  last_done,
    // for datapath
    output wr_en,       // Write enable signal
    output reg rd_en,       // Read enable signal
    output reg reset_en,
  // for next buff
    output reg o_valid,
    output reg o_start,
    output reg o_finish
);

  parameter IDLE = 3'b000;
  parameter START = 3'b001;
  parameter FIRST_READ = 3'b010;
  parameter READ1 = 3'b011;
  parameter READ2 = 3'b100;
  parameter DONE = 3'b101;
  reg [2:0] current_state, next_state;

  always @(posedge clk) begin
    if (~rst_n) begin
      current_state <= IDLE;
    end else begin
      current_state <= next_state;
    end
  end

  always @(*) begin
    next_state = current_state;
    case (current_state)
      IDLE:  next_state = (done_i) ? START : IDLE;
      START: next_state = (first_done) ? FIRST_READ : START;
      FIRST_READ: next_state =  READ1;
      READ1:  next_state =  READ2;
      READ2:  next_state = (last_done) ? DONE : READ2;
      DONE:  next_state = IDLE;
    endcase
  end

  assign wr_en = done_i;

  always @(*) begin
    rd_en = 1'b0;
    o_valid = 1'b0;
    o_start = 1'b0;
    o_finish = 1'b0;
    reset_en = 1'b0;

    case (current_state)
      IDLE: begin
      end
      START: begin
      end
      FIRST_READ: begin
        rd_en = 1'b1;
      end
      READ1: begin
        rd_en = 1'b1;
        o_valid = 1'b1;
        o_start = 1'b1;
      end
      READ2: begin
        rd_en = 1'b1;
        o_valid = 1'b1;
      end
      DONE: begin
        reset_en = 1'b1;
        o_finish = 1'b1;
      end
    endcase
  end



endmodule
