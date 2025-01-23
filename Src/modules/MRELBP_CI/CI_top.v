module CI_top #(parameter ROWS = 30,
                parameter COLS = 30)
               (input clk,
                input rst,
                input [7:0] m_3x3_i,
                input done_i,
                output ci_r2_o,
                output done_r2,
                output progress_done_r2,
                output ci_r4_o,
                output done_r4,
                output progress_done_r4,
                output ci_r6_o,
                output done_r6,
                output progress_done_r6,
                output ci_r8_o,
                output done_r8,
                output progress_done_r8);
    
    wire [7:0] data0_o;
    wire [7:0] data1_o;
    wire [7:0] data2_o;
    wire [7:0] data3_o;
    wire [7:0] data4_o;
    wire [7:0] data5_o;
    wire [7:0] data6_o;
    wire [7:0] data7_o;
    wire [7:0] data8_o;
    wire [7:0] data9_o, data10_o, data11_o, data12_o, data13_o, data14_o, data15_o, data16_o;
    wire buffer_16_done_o;
    Buffer_16_rows #(
    .DEPTH(COLS)
    ) BUFFER_16_ROWS (
    .clk(clk),
    .rst(rst),
    .done_i(done_i),
    .data_i(m_3x3_i),
    .data0_o(data0_o),
    .data1_o(data1_o),
    .data2_o(data2_o),
    .data3_o(data3_o),
    .data4_o(data4_o),
    .data5_o(data5_o),
    .data6_o(data6_o),
    .data7_o(data7_o),
    .data8_o(data8_o),
    .data9_o(data9_o),
    .data10_o(data10_o),
    .data11_o(data11_o),
    .data12_o(data12_o),
    .data13_o(data13_o),
    .data14_o(data14_o),
    .data15_o(data15_o),
    .data16_o(data16_o),
    .done_o(buffer_16_done_o)
    );
    
    
    
    // // ci calculation
    MRELBP_CI_R2 #(.COLS(COLS),
    .ROWS(ROWS))
    R2_TOP
    (
    .clk(clk),
    .rst(rst),
    .done_i(buffer_16_done_o),
    .S1(data12_o),
    .S2(data13_o),
    .S3(data14_o),
    .S4(data15_o),
    .S5(data16_o),
    .done_o(done_r2),
    .ci_o(ci_r2_o),
    .progress_done_o(progress_done_r2));
    
    MRELBP_CI_R4 #(.COLS(COLS),
    .ROWS(ROWS))
    R4_TOP
    (
    .clk(clk),
    .rst(rst),
    .done_i(buffer_16_done_o),
    .S1(data8_o),
    .S2(data9_o),
    .S3(data10_o),
    .S4(data11_o),
    .S5(data12_o),
    .S6(data13_o),
    .S7(data14_o),
    .S8(data15_o),
    .S9(data16_o),
    .done_o(done_r4),
    .ci_o(ci_r4_o),
    .progress_done_o(progress_done_r4));
    
    MRELBP_CI_R6 #(.COLS(COLS),
    .ROWS(ROWS))
    R6_TOP
    (
    .clk(clk),
    .rst(rst),
    .done_i(buffer_16_done_o),
    .S1(data4_o),
    .S2(data5_o),
    .S3(data6_o),
    .S4(data7_o),
    .S5(data8_o),
    .S6(data9_o),
    .S7(data10_o),
    .S8(data11_o),
    .S9(data12_o),
    .S10(data13_o),
    .S11(data14_o),
    .S12(data15_o),
    .S13(data16_o),
    .done_o(done_r6),
    .ci_o(ci_r6_o),
    .progress_done_o(progress_done_r6));
    
    MRELBP_CI_R8 #(.COLS(COLS),
    .ROWS(ROWS))
    R8_TOP
    (
    .clk(clk),
    .rst(rst),
    .done_i(buffer_16_done_o),
    .S1(data0_o),
    .S2(data1_o),
    .S3(data2_o),
    .S4(data3_o),
    .S5(data4_o),
    .S6(data5_o),
    .S7(data6_o),
    .S8(data7_o),
    .S9(data8_o),
    .S10(data9_o),
    .S11(data10_o),
    .S12(data11_o),
    .S13(data12_o),
    .S14(data13_o),
    .S15(data14_o),
    .S16(data15_o),
    .S17(data16_o),
    .done_o(done_r8),
    .ci_o(ci_r8_o),
    .progress_done_o(progress_done_r8));
    
    integer file1;
    always @(posedge clk) begin
        if (rst) begin
            file1 = $fopen("D:\\Thesis\\CodeTest\\python\\ci_r4.txt", "w");
            end else if (done_r4) begin
            if (file1) begin
                $fwrite(file1, "%d\n", ci_r4_o);
            end
            end else if (progress_done_r4) begin
            $fclose(file1);
        end
    end
    
endmodule
