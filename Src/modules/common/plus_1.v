module plus_1 #(parameter WIDTH = 10)
               (input rst,
                input clk,
                input en,
                input [WIDTH - 1:0] D,
                output [WIDTH - 1:0] Q);
    
    reg [9:0] counter_value;
    
    always @(posedge clk) begin
        if (rst) begin
            counter_value <= {10{1'b0}};
            counter_value <= 0;
            end else begin
            if (en) begin
                counter_value <= D + 1;
            end
        end
    end
    
    assign Q = counter_value;
    
endmodule
