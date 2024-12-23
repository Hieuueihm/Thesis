module RGB2Gray_controller (input clk,
                            input rst,
                            input done_i,
                            output done_o);
    
    always @(posedge clk) begin
        if (rst) begin
            done_o <= 0;
            end else begin
            done_o <= done_i;
        end
    end
    
endmodule
