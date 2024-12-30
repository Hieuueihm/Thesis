module sum_cumulative #(parameter WIDTH1 = 13,
                        parameter WIDTH2 = 13)
                       (input clk,
                        input rst,
                        input en,
                        input ld,
                        input [WIDTH1-1:0] data_in1,
                        input [WIDTH1 -1 : 0] data_in2,
                        output reg [WIDTH2 - 1:0] sum_out);
    
    always @(posedge clk) begin
        if (rst) begin
            sum_out <= 0;
            end else if (ld) begin
            sum_out <= data_in1;
            end else if (en) begin
            sum_out <= sum_out + data_in1 + data_in2;
        end
    end
endmodule
