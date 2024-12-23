module Serialiser_controller (input clk,
                              input rst,
                              input [9:0] i_col,
                              input done_i,
                              output [2:0] o_select,
                              output reg done_o);
    
    
    reg [2:0] o_select_tmp;
    localparam IDLE      = 2'b00;
    localparam ROW_START = 2'b01;
    localparam ACT       = 2'b10;
    localparam DONE      = 2'b11;
    reg [1:0] current_state, next_state;
    reg [2:0] done_i_counter;
    assign o_select = o_select_tmp;
    reg [7:0] i_col_delay_1;
    
    // i_col_delay
    always @(posedge clk) begin
        if (rst) begin
            i_col_delay_1 <= 0;
            end else begin
            i_col_delay_1 <= i_col;
        end
    end
    
    always @(posedge clk) begin
        if (rst)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
    
    always @(*) begin
        case (current_state)
            IDLE: next_state       = (i_col == 0 && done_i_counter) ? ROW_START : IDLE;
            ROW_START:  next_state = (i_col > 0 && done_i_counter) ? ACT : ROW_START;
            ACT: next_state        = (done_i_counter == 0) ? DONE : (i_col_delay_1 == 0 && done_i_counter > 0) ? ROW_START : ACT;
            DONE: next_state       = IDLE;
            default: next_state    = IDLE;
        endcase
    end
    always @(posedge clk) begin
        case(current_state)
            IDLE:begin
                o_select_tmp <= 0;
                done_o       <= 0;
            end
            ROW_START: begin
                o_select_tmp <= 0;
                done_o       <= 1;
            end
            
            ACT: begin
                o_select_tmp <= (o_select_tmp < 7) ? o_select_tmp + 1 : o_select_tmp;
                done_o       <= 1;
            end
            DONE:
            begin
                o_select_tmp <= 0;
                done_o       <= 0;
            end
            
        endcase
    end
    
    
    // delay done_i ;
    always @(posedge clk) begin
        if (rst) begin
            
            done_i_counter <= 0;
            end else if (done_i) begin
            done_i_counter <= 3'd5;
            end else begin
            done_i_counter <= done_i_counter - 1;
        end
    end
    
    //
    
endmodule
