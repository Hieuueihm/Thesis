module joint_histogram_controller (
    input clk,
    input rst_n,
    input done_i,
    input done_read,
    input read_en,
    output reg done_o,
    output reg finish,
    output reg count_en,
    output reg reset_en,
    input reset_done  
    `ifdef SIMULATION 
    ,
    output reg [2:0] current_state
    `endif

);
`ifdef SYNTHESIS
  reg [2:0] current_state;
`endif

  parameter RESET = 3'b000, IDLE = 3'b001, COUNTING = 3'b010, READING = 3'b011, FINISH = 3'b100;
  reg [2:0] next_state;

  always @(posedge clk) begin
    if (~rst_n) current_state <= RESET;
    else current_state <= next_state;
  end
  always @(*) begin
    next_state = current_state;
    case (current_state)
      RESET:    next_state = reset_done ? IDLE : RESET;
      IDLE:     next_state = (done_i) ? COUNTING : IDLE;
      COUNTING: next_state = (read_en) ? READING : COUNTING;
      READING:  next_state = (done_read) ? FINISH : READING;
      FINISH:   next_state = IDLE;
      default:  next_state = IDLE;

    endcase
  end
  reg done, fin;
  always @(*) begin
    done = 0;
    fin = 0;
    count_en = 0;
    reset_en = 0;

    case (current_state)
      RESET: begin

      end
      IDLE: begin
      end
      COUNTING: begin
        count_en = 1;
      end
      READING: begin
        done = 1;
      end

      FINISH: begin
        fin = 1;
        reset_en = 1;

      end
      default: begin
        done = 0;
        fin = 0;
        count_en = 0;
        reset_en = 0;
      end
    endcase

  end
  always @(posedge clk) begin
    if (~rst_n) begin
      done_o <= 0;
      finish <= 0;
    end else begin
      done_o <= done;
      finish <= fin;
    end
  end



endmodule
