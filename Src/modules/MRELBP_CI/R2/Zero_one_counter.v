module Zero_one_counter(input clk,
                        input rst,
                        input done_i,
                        input data_i,
                        input progress_done_i,
                        output reg [9:0]  bit_one_o,
                        output reg [9:0]  bit_zero_o,
                        output reg done_o);
    
    always @(posedge clk) begin
        if (rst) begin
            bit_one_o  <= 0;
            bit_zero_o <= 0;
            end else if (done_i) begin
            if (data_i == 1'b1) begin
                bit_one_o <= bit_one_o + 1;
                end else begin
                bit_zero_o <= bit_zero_o + 1;
            end
        end
    end
    
    always @(posedge clk) begin
        if (rst) begin
            done_o <= 0;
            end  else begin
            done_o <= progress_done_i;
        end
    end
endmodule
