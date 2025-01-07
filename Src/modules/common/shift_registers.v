module shift_registers #(parameter WIDTH = 8,
                         parameter CYCLE = 5)
                        (input clk,
                         input rst,
                         input [WIDTH - 1 : 0] data_i,
                         output [WIDTH - 1: 0] data_o);
    
    reg [WIDTH-1:0] shift_reg [CYCLE - 1:0];
    
    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; i < CYCLE; i = i + 1) begin
                shift_reg[i] <= 0;
            end
            end else begin
            shift_reg[0] <= data_i;
            for (i = 1; i < CYCLE; i = i + 1) begin
                shift_reg[i] <= shift_reg[i-1];
            end
        end
    end
    
    assign data_o = shift_reg[CYCLE - 1];
    
    
    
endmodule
