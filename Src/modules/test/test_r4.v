module test_r4(input clk,
            input rst,
            input [7:0] grayscale_i,
            input done_i);
    
    wire done_original_o;
    wire [7:0] data_o;
    wire done_3x3_o;
    wire [7:0] m_3x3_o;
    wire [7:0] m_5x5_o;
    wire done_5x5_o;
    
    Median_processing #(.ROWS(30), .COLS(30))
    MEDIAN_PROCESSING
    (
    .clk(clk),
    .rst(rst),
    .data_i(grayscale_i),
    .done_i(done_i),
    .data_o(data_o),
    .done_o(done_original_o),
    .m_3x3_o(m_3x3_o),
    .done_3x3_o(done_3x3_o),
    .m_5x5_o(m_5x5_o),
    .done_5x5_o(done_5x5_o),
    .m_7x7_o(),
    .done_7x7_o(),
    .m_9x9_o(),
    .done_9x9_o()
    );
    
    wire [7:0] data0_3x3_o, data1_3x3_o, data2_3x3_o, data3_3x3_o, data4_3x3_o, data5_3x3_o, data6_3x3_o, data7_3x3_o, data8_3x3_o;
    wire done_buffer_3x3_o;
    Buffer_8_rows #(.DEPTH(30)) BUFFER_8_ROWS_3X3 (
    .clk(clk),
    .rst(rst),
    .done_i(done_3x3_o),
    .data_i(m_3x3_o),
    .data0_o(data0_3x3_o),
    .data1_o(data1_3x3_o),
    .data2_o(data2_3x3_o),
    .data3_o(data3_3x3_o),
    .data4_o(data4_3x3_o),
    .data5_o(data5_3x3_o),
    .data6_o(data6_3x3_o),
    .data7_o(data7_3x3_o),
    .data8_o(data8_3x3_o),
    .done_o(done_buffer_3x3_o)
    );
    wire [7:0] data0_5x5_o, data1_5x5_o, data2_5x5_o, data3_5x5_o, data4_5x5_o;
    wire [7:0] data5_5x5_o, data6_5x5_o, data7_5x5_o, data8_5x5_o;
    wire done_buffer_5x5_o;
    Buffer_8_rows #(.DEPTH(30)) BUFFER_8_ROWS_5x5 (
    .clk(clk),
    .rst(rst),
    .done_i(done_5x5_o),
    .data_i(m_5x5_o),
    .data0_o(data0_5x5_o),
    .data1_o(data1_5x5_o),
    .data2_o(data2_5x5_o),
    .data3_o(data3_5x5_o),
    .data4_o(data4_5x5_o),
    .data5_o(data5_5x5_o),
    .data6_o(data6_5x5_o),
    .data7_o(data7_5x5_o),
    .data8_o(data8_5x5_o),
    .done_o(done_buffer_5x5_o)
    );
    wire done_buffer_3x3_delay;
    wire[7:0] data0_3x3_delay, data1_3x3_delay, data2_3x3_delay, data3_3x3_delay, data4_3x3_delay, data5_3x3_delay;
    wire[7:0] data6_3x3_delay, data7_3x3_delay, data8_3x3_delay;

    `define CYCLE_DELAY 11

    shift_registers #(.WIDTH(1), .CYCLE(`CYCLE_DELAY))
    SHIFT_DONE_3x3_O (
    .clk(clk),
    .rst(rst),
    .data_i(done_buffer_3x3_o),
    .data_o(done_buffer_3x3_delay)
    );
    
    shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA0_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data0_3x3_o),
    .data_o(data0_3x3_delay)
    );
     shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA1_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data1_3x3_o),
    .data_o(data1_3x3_delay)
    );
     shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA2_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data2_3x3_o),
    .data_o(data2_3x3_delay)
    );
     shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA3_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data3_3x3_o),
    .data_o(data3_3x3_delay)
    );
     shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA4_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data4_3x3_o),
    .data_o(data4_3x3_delay)
    );
     shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA5_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data5_3x3_o),
    .data_o(data5_3x3_delay)
    );
     shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA6_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data6_3x3_o),
    .data_o(data6_3x3_delay)
    );
     shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA7_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data7_3x3_o),
    .data_o(data7_3x3_delay)
    );
     shift_registers #(.WIDTH(8), .CYCLE(`CYCLE_DELAY))
    SHIFT_DATA8_3x3 (
    .clk(clk),
    .rst(rst),
    .data_i(data8_3x3_o),
    .data_o(data8_3x3_delay)
    );
    
    
    
   
    
endmodule
