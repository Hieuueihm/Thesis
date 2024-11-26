module Line_buffer_controller #(
    parameter DEPTH = 1024
) (
    input  clk,     // Clock input
    input  rst,     // Reset input
    input  done_i,  // Done signal when operation is complete
    input [9:0] i_counter,
    output wr_en,   // Write enable signal
    output rd_en,   // Read enable signal
    output done_o  // Done output signal
);

  // Internal signals for managing state
  reg [1:0] state, next_state;

  // State encoding
  localparam IDLE = 2'b00, ACT = 2'b01, DONE = 2'b00;
  // State register
  always @(posedge clk) begin
    if (rst) begin
      state <= IDLE;
    end else begin
      state <= next_state;
    end
  end

  // start idle  state 
  // if done_i == 1 -> next_state == WRITE -> wr_en
  // if i_counter == DEPTH - 1 -> WRITE FULL BUFFER -> NEXT STATE = RDAWR
  // if done_i wr and read
  // else done
  // Next state logic
  always @(*) begin
    case (state)
      IDLE: begin
        if (done_i && i_counter == DEPTH) next_state = ACT;
        else next_state = IDLE;
      end
      ACT: begin
        if (!done_i) next_state = DONE;
        else next_state= ACT;
      end
      DONE: begin
          next_state = IDLE;
      end
      default: next_state = IDLE;
    
    endcase
  end

  assign wr_en  = (done_i == 1) ? 1 : 0;
  assign rd_en  = (done_i && i_counter == DEPTH);
  assign done_o = (i_counter == DEPTH);

endmodule
