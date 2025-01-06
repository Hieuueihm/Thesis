

module Line_buffer_datapath #(parameter DEPTH = 1024)
                             (input clk,
                              input rst,
                              input wr_en,
                              input rd_en,
                              input [7:0] data_i,
                              output [7:0] data_o,
                              output [9:0] i_counter);
    reg [7:0] mem[0:DEPTH - 1];
    wire [9:0] internal_wr_pointer, internal_wr_pointer_plus_1;
    wire [9:0] internal_rd_pointer, internal_rd_pointer_plus_1;
    wire [9:0] internal_i_counter_plus_1;
    
    
    
    //  output assignment
    assign data_o = (i_counter == DEPTH) ? mem[internal_rd_pointer] : 8'bz;
    
    plus_1 #(.WIDTH(10))
    COUNTER_I
    (
    .rst(rst),
    .clk(clk),
    .en(wr_en),
    .D(i_counter),
    .Q(internal_i_counter_plus_1)
    );
    assign i_counter = (internal_i_counter_plus_1 > DEPTH) ? i_counter : internal_i_counter_plus_1;
    
    plus_1 #(.WIDTH(10))
    
    COUNTER_WR_POINTER
    (
    .rst(rst),
    .clk(clk),
    .en(wr_en),
    .D(internal_wr_pointer),
    .Q(internal_wr_pointer_plus_1)
    );
    assign internal_wr_pointer = (internal_wr_pointer_plus_1 == DEPTH) ? 0 : internal_wr_pointer_plus_1;
    
    
    // Write process
    always @(posedge clk) begin
        if (rst) begin
            end else if (wr_en) begin
            mem[internal_wr_pointer] <= data_i;
        end
    end
    
    
    plus_1 #(.WIDTH(10))
    COUNTER_RD_POINTER
    (
    .rst(rst),
    .clk(clk),
    .en(rd_en),
    .D(internal_rd_pointer),
    .Q(internal_rd_pointer_plus_1)
    );
    assign internal_rd_pointer = (internal_rd_pointer_plus_1 == DEPTH) ? 0 : internal_rd_pointer_plus_1;
    
endmodule
