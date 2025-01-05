module Buffer_4_rows #(parameter DEPTH = 17)
                      (input clk,
                       input rst,
                       input done_i,
                       input [7:0] data_i,
                       output [7:0] data0_o,
                       output [7:0] data1_o,
                       output [7:0] data2_o,
                       output [7:0] data3_o,
                       output [7:0] data4_o,
                       output done_o);
    
    
    reg [9:0] counter;
    reg done_extended;
    
    // delay done_i
    always @(posedge clk) begin
        if (rst) begin
            counter       <= 0;
            done_extended <= 0;
            end else if (done_i) begin
            counter       <= 0;
            done_extended <= 1;
            end else if (done_extended && counter < DEPTH) begin
            counter       <= counter + 1;
            done_extended <= 1;
            end else begin
            counter       <= 0;
            done_extended <= 0;
        end
    end
    wire done_delayed = done_extended;
    wire [7:0] line_buffer_out[3:0];
    wire line_buffer_done[4:0];
    assign done_o  = line_buffer_done[3];  // line buffer 7 done
    assign data0_o = data_i;
    assign data1_o = line_buffer_out[0];
    assign data2_o = line_buffer_out[1];
    assign data3_o = line_buffer_out[2];
    assign data4_o = line_buffer_out[3];
    
    generate
    for (genvar i = 0; i < 4; i = i + 1) begin : gen_line_buffers
    Line_buffer #(
    .DEPTH(DEPTH)
    ) LINE_BUFFER (
    .clk(clk),
    .rst(rst),
    .data_i((i == 0) ? data_i : line_buffer_out[i-1]),
    .done_i((i == 0) ? (done_i | done_delayed) : line_buffer_done[i-1]),
    .data_o(line_buffer_out[i]),
    .done_o(line_buffer_done[i])
    );
    end
    endgenerate
    
    
    
endmodule
