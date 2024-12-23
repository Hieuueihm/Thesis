module Serialiser_controller (input clk,
                              input rst,
                              input [9:0] i_col,
                              input done_i,
                              output [2:0] o_select,
                              output reg done_o);
    
    
    reg [2:0] o_select_tmp;
    reg [2:0] done_i_counter;
    reg [9:0] i_col_delay;
    always @(posedge clk) begin
        if (rst) begin
            i_col_delay <= 0;
            end else begin
            i_col_delay <= i_col;
        end
    end
    
    assign o_select = o_select_tmp;
    always @(posedge clk) begin
        if (rst) begin
            o_select_tmp   <= 0;
            done_o         <= 0;
            done_i_counter <= 0;
            end else begin
            if (done_i) begin
                done_i_counter <= 3'd5;
                done_o         <= 1'b1;
                end  else if (done_i_counter > 1) begin
                done_i_counter <= done_i_counter - 1;
                end else begin
                done_o         <= 1'b0;
                done_i_counter <= 3'd5;
                
            end
            
            
            
            if (done_i_counter || done_i) begin
                if (i_col == 0) begin
                    o_select_tmp <= 3'b0;
                    end else if (o_select_tmp < 3'd6) begin
                    o_select_tmp <= o_select_tmp + 1;
                end
            end
            
            
        end
    end
    
endmodule
