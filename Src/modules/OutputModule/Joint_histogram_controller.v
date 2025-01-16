module Joint_histogram_controller(input clk,
                                  input rst,
                                  input done_i,
                                  input progress_done_i,
                                  input done_read,
                                  output reg done_o,
                                  output reg finish,
                                  output reg count_en,
                                  output reg read_en);
    
    parameter IDLE = 3'b000,
    COUNTING = 3'b001,
    START_READ = 3'b010,
    READING = 3'b011,
    FINISH = 3'b100;
    reg [2:0] current_state, next_state;
    
    always @(posedge clk) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
    always @(*) begin
        case(current_state)
            IDLE: next_state       = (done_i) ? COUNTING : IDLE;
            COUNTING : next_state  = (progress_done_i) ? START_READ : COUNTING;
            START_READ: next_state = READING;
            READING: next_state    = (done_read) ? FINISH : READING;
            FINISH: next_state     = IDLE;
            
        endcase
    end
    always @(*) begin
        case(current_state)
            IDLE: begin
                done_o       <= 0;
                finish       <= 0;
                count_en     <= 0;
                read_en      <= 0;
            end
            COUNTING: begin
                count_en <= 1;
            end
            START_READ: begin
                count_en <= 0;
                read_en  <= 1;
            end
            
            READING:  begin
                done_o       <= 1;
                read_en      <= 1;
            end
            
            FINISH: begin
                finish       <= 1;
                done_o       <= 0;
                read_en      <= 0;
                count_en     <= 0;
                
            end
        endcase
        
    end
    
    
    
endmodule
