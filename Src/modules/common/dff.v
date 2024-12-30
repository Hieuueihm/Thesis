module dff(input clk,
           input rst,
           input en,
           input [7:0] D,
           output [7:0] Q);
    reg [7:0] data_out;
    assign Q = data_out;
    always @(posedge clk) begin
        if (rst) begin
            data_out <= 0;
            end else if (en) begin
            data_out <= D;
        end
    end
    
endmodule
