module top_module__controller (
    input clk,
    input rst_n,
    input finish_i,
    input start_en,
    input read_finish,
    input start_i,
    output reg o_intr,
    output reg read_en
);
  parameter IDLE = 2'b00, PROCESS = 2'b01, READ = 2'b10, FINISH = 2'b11;
  reg [1:0] current_state, next_state;



  always @(posedge clk) begin
    if (~rst_n) current_state <= IDLE;
    else current_state <= next_state;
  end
  always @(*) begin
    next_state = current_state;
    case (current_state)
      IDLE:    next_state = (start_i) ? PROCESS : IDLE;
      PROCESS: next_state = (finish_i) ? READ : PROCESS;
      READ:    next_state = (read_finish) ? FINISH : READ;
      FINISH:  next_state = IDLE;

    endcase
  end
  always @(*) begin
    read_en = 1'b0;
    o_intr  = 1'b0;
    case (current_state)
      IDLE: begin

      end
      PROCESS: begin
      end
      READ: begin
        read_en <= 1'b1;
      end

      FINISH: begin
        read_en <= 1'b0;
        o_intr  <= 1'b1;
      end


    endcase

  end




endmodule
