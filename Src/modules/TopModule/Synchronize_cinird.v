module Synchronize_cinird #(parameter CYCLE = 100)
                           (input clk,
                            input rst,
                            input done_nird,
                            input progress_done_nird,
                            input [3:0] ni_i,
                            input [3:0] rd_i,
                            output done_delay,
                            output progress_delay,
                            output [3:0] ni_delay,
                            output [3:0] rd_delay);
    
    wire done_o_ni_rd_delay, progress_done_nird_delay;
    shift_registers #(.WIDTH(1), .CYCLE(CYCLE))
    SHIFT_DONE_O_delay (
    .clk(clk),
    .rst(rst),
    .data_i(done_nird),
    .data_o(done_delay)
    );
    shift_registers #(.WIDTH(1), .CYCLE(CYCLE))
    SHIFT_finish_O_delay (
    .clk(clk),
    .rst(rst),
    .data_i(progress_done_nird),
    .data_o(progress_delay)
    );
    shift_registers #(.WIDTH(4), .CYCLE(CYCLE))
    SHIFT_NI (
    .clk(clk),
    .rst(rst),
    .data_i(ni_i),
    .data_o(ni_delay)
    );
    shift_registers #(.WIDTH(4), .CYCLE(CYCLE))
    SHIFT_RD (
    .clk(clk),
    .rst(rst),
    .data_i(rd_i),
    .data_o(rd_delay)
    );
endmodule
