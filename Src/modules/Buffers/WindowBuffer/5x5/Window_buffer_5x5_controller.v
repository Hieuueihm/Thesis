module Window_buffer_5x5_controller(input clk,
                                    input rst,
                                    input done_i,
                                    input i_row_eq_max,
                                    input i_col_eq_max,
                                    input i_col_ge_threshold,
                                    output reg count_en,
                                    output reg progress_done,
                                    output reg done_o);
    
    reg [2:0] current_state, next_state;
    parameter IDLE       = 3'b000;
    parameter START      = 3'b001;
    parameter START_COL  = 3'b010;
    parameter COL_OUT    = 3'b011;
    parameter END_COL    = 3'b100;
    parameter END_COL_2  = 3'b101;
    parameter FINISH_ALL = 3'b110;
    parameter DONE       = 3'b111;
    always @(posedge clk) begin
        if (rst) begin
            current_state <= IDLE;
            end else begin
            current_state <= next_state;
        end
    end
    
    always @(*) begin
        case(current_state)
            IDLE: next_state      = (done_i) ? START : IDLE;
            START : next_state    = START_COL;
            START_COL: next_state = i_row_eq_max ? FINISH_ALL : (i_col_ge_threshold)  ? COL_OUT : START_COL;
            COL_OUT: next_state   = i_row_eq_max ? FINISH_ALL : (i_col_eq_max) ? END_COL : COL_OUT;
            END_COL : next_state  = i_row_eq_max ? FINISH_ALL : END_COL_2;
            END_COL_2: next_state = i_row_eq_max ? FINISH_ALL : START_COL;
            
            FINISH_ALL: next_state = DONE;
        endcase
    end
    always @(*) begin
        case(current_state)
            IDLE: begin
                count_en      = 1'b0;
                done_o        = 1'b0;
                progress_done = 1'b0;
            end
            START_COL: begin
                count_en = 1'b1;
                done_o   = 1'b0;
            end
            COL_OUT: begin
                done_o = 1'b1;
            end
            END_COL: begin
                count_en = 1'b0;
                done_o   = 1'b1;
            end
            END_COL_2: begin
                count_en = 1'b0;
                done_o   = 1'b0;
            end
            FINISH_ALL: begin
                count_en      = 1'b0;
                done_o        = 1'b0;
                progress_done = 1'b1;
                
            end
            DONE: begin
                progress_done = 1'b0;
            end
        endcase
        
    end
    
    
endmodule
