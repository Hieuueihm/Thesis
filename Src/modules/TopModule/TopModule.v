module TopModule #(parameter COLS = 128,
                   parameter ROWS = 128)
                  (input clk,
                   input rst,
                   input [7:0] grayscale_i,
                   input done_i,
                   output [15:0] cinird_r2,
                   output done_r2,
                   output [15:0] cinird_r4,
                   output done_r4,
                   output [15:0] cinird_r6,
                   output done_r6,
                   output [15:0] cinird_r8,
                   output done_r8,
                   output finish);
    
    wire [7:0]done_original_o, data_original_o;
    wire[7:0] m_3x3_o; wire done_m_3x3_o;
    wire [7:0] m_5x5_o; wire done_m_5x5_o;
    wire [7:0] m_7x7_o;wire  done_m_7x7_o;
    wire [7:0] m_9x9_o; wire done_m_9x9_o;
    Median_processing #(.ROWS(ROWS), .COLS(COLS))
    MEDIAN_PROCESSING
    (
    .clk(clk),
    .rst(rst),
    .data_i(grayscale_i),
    .done_i(done_i),
    .data_o(data_original_o),
    .done_o(done_original_o),
    .m_3x3_o(m_3x3_o),
    .done_3x3_o(done_m_3x3_o),
    .m_5x5_o(m_5x5_o),
    .done_5x5_o(done_m_5x5_o),
    .m_7x7_o(m_7x7_o),
    .done_7x7_o(done_m_7x7_o),
    .m_9x9_o(m_9x9_o),
    .done_9x9_o(done_m_9x9_o)
    );
    
    wire ci_r2_o, done_ci_r2, progress_done_ci_r2;
    wire ci_r4_o, done_ci_r4, progress_done_ci_r4;
    wire ci_r6_o, done_ci_r6, progress_done_ci_r6;
    wire ci_r8_o, done_ci_r8, progress_done_ci_r8;
    
    CI_top #(.ROWS(ROWS),
    .COLS(COLS)) CI_TOP
    (
    .clk(clk),
    .rst(rst),
    .m_3x3_i(m_3x3_o),
    .done_i(done_m_3x3_o),
    .ci_r2_o(ci_r2_o),
    .done_r2(done_ci_r2),
    .progress_done_r2(progress_done_ci_r2),
    .ci_r4_o(ci_r4_o),
    .done_r4(done_ci_r4),
    .progress_done_r4(progress_done_ci_r4),
    .ci_r6_o(ci_r6_o),
    .done_r6(done_ci_r6),
    .progress_done_r6(progress_done_ci_r6),
    .ci_r8_o(ci_r8_o),
    .done_r8(done_ci_r8),
    .progress_done_r8(progress_done_ci_r8));
    
    
    
    wire [3:0] ni_r2_o, rd_r2_o;
    wire done_r2_nird, progress_done_r2_nird;
    R2_NIRD #(.COLS(COLS),
    .ROWS(ROWS))
    R2_NI_RD
    (
    .clk(clk),
    .rst(rst),
    .m_3x3_i(m_3x3_o),
    .done_m_3x3_i(done_m_3x3_o),
    .data_original_i(data_original_o),
    .done_original_i(done_original_o),
    .ni_o(ni_r2_o),
    .rd_o(rd_r2_o),
    .done_o(done_r2_nird),
    .progress_done_o(progress_done_r2_nird));
    
    wire done_nird_r2_delay, progress_done_nird_r2_delay;
    wire [3:0] ni_r2_delay;
    wire [3:0] rd_r2_delay;
    
    Synchronize_cinird #(.CYCLE(12 * COLS - 3)) SYNCHRONIZE_R2
    (
    .clk(clk),
    .rst(rst),
    .done_nird(done_r2_nird),
    .progress_done_nird(progress_done_r2_nird),
    .ni_i(ni_r2_o),
    .rd_i(rd_r2_o),
    .done_delay(done_nird_r2_delay),
    .progress_delay(progress_done_nird_r2_delay),
    .ni_delay(ni_r2_delay),
    .rd_delay(rd_r2_delay));
    
    
    // Joint_histogram JOINT_R2 (
    // .clk(clk),
    // .rst(rst),
    // .ci_i(ci_r2_o),
    // .ni_i(ni_r2_delay),
    // .rd_i(rd_r2_delay),
    // .done_i(done_nird_r2_delay),
    // .progress_done_i(progress_done_nird_r2_delay),
    // .cinird_o(cinird_r2),
    // .done_o(done_r2),
    // .finish(finish));
    
    
    wire [3:0] ni_r4_o, rd_r4_o;
    wire done_r4_nird, progress_done_r4_nird;
    R4_NIRD #(.COLS(COLS),
    .ROWS(ROWS))
    R4_NI_RD
    (
    .clk(clk),
    .rst(rst),
    .m_3x3_i(m_3x3_o),
    .done_m_3x3_i(done_m_3x3_o),
    .m_5x5_i(m_5x5_o),
    .done_m_5x5_i(done_m_5x5_o),
    .ni_o(ni_r4_o),
    .rd_o(rd_r4_o),
    .done_o(done_r4_nird),
    .progress_done_o(progress_done_r4_nird));
    
    wire done_nird_r4_delay, progress_done_nird_r4_delay;
    wire [3:0] ni_r4_delay;
    wire [3:0] rd_r4_delay;
    
    
    Synchronize_cinird #(.CYCLE(8 * COLS - 14)) SYNCHRONIZE_R4
    (
    .clk(clk),
    .rst(rst),
    .done_nird(done_r4_nird),
    .progress_done_nird(progress_done_r4_nird),
    .ni_i(ni_r4_o),
    .rd_i(rd_r4_o),
    .done_delay(done_nird_r4_delay),
    .progress_delay(progress_done_nird_r4_delay),
    .ni_delay(ni_r4_delay),
    .rd_delay(rd_r4_delay));
    
    // Joint_histogram JOINT_R4 (
    // .clk(clk),
    // .rst(rst),
    // .ci_i(ci_r4_o),
    // .ni_i(ni_r4_delay),
    // .rd_i(rd_r4_delay),
    // .done_i(done_nird_r4_delay),
    // .progress_done_i(progress_done_nird_r4_delay),
    // .cinird_o(cinird_r4),
    // .done_o(done_r4),
    // .finish());
    
    
    
    wire [3:0] ni_r6_o, rd_r6_o;
    wire done_r6_nird, progress_done_r6_nird;
    R6_NIRD #(.COLS(COLS),
    .ROWS(ROWS))
    R6_NI_RD
    (
    .clk(clk),
    .rst(rst),
    .m_5x5_i(m_5x5_o),
    .done_m_5x5_i(done_m_5x5_o),
    .m_7x7_i(m_7x7_o),
    .done_m_7x7_i(done_m_7x7_o),
    .rd_o(rd_r6_o),
    .ni_o(ni_r6_o),
    .done_o(done_r6_nird),
    .progress_done_o(progress_done_r6_nird));
    
    wire done_nird_r6_delay, progress_done_nird_r6_delay;
    wire [3:0] ni_r6_delay;
    wire [3:0] rd_r6_delay;
    
    
    Synchronize_cinird #(.CYCLE(4 * COLS - 39)) SYNCHRONIZE_R6
    (
    .clk(clk),
    .rst(rst),
    .done_nird(done_r6_nird),
    .progress_done_nird(progress_done_r6_nird),
    .ni_i(ni_r6_o),
    .rd_i(rd_r6_o),
    .done_delay(done_nird_r6_delay),
    .progress_delay(progress_done_nird_r6_delay),
    .ni_delay(ni_r6_delay),
    .rd_delay(rd_r6_delay));
    
    // Joint_histogram JOINT_R6 (
    // .clk(clk),
    // .rst(rst),
    // .ci_i(ci_r6_o),
    // .ni_i(ni_r6_delay),
    // .rd_i(rd_r6_delay),
    // .done_i(done_nird_r6_delay),
    // .progress_done_i(progress_done_nird_r4_delay),
    // .cinird_o(cinird_r6),
    // .done_o(done_r6),
    // .finish());
    
    
    
    wire [3:0] ni_r8_o, rd_r8_o;
    wire done_r8_nird, progress_done_r8_nird;
    R8_NIRD #(.COLS(COLS),
    .ROWS(ROWS))
    R8_NI_RD
    (
    .clk(clk),
    .rst(rst),
    .m_7x7_i(m_7x7_o),
    .done_m_7x7_i(done_m_7x7_o),
    .m_9x9_i(m_9x9_o),
    .done_m_9x9_i(done_m_9x9_o),
    .rd_o(rd_r8_o),
    .ni_o(ni_r8_o),
    .done_o(done_r8_nird),
    .progress_done_o(progress_done_r8_nird));
    
    
    integer file1;
    always @(posedge clk) begin
        if (rst) begin
            file1 = $fopen("D:\\Thesis\\CodeTest\\python\\ni_r8.txt", "w");
            end else if (done_r8_nird) begin
            $fwrite(file1, "%d\n",ni_r8_o);
        end
        else if (progress_done_r8_nird) begin
            $fclose(file1);
        end
            
            end
            
            
            integer file2;
            always @(posedge clk) begin
                if (rst) begin
                    file2 = $fopen("D:\\Thesis\\CodeTest\\python\\rd_r8.txt", "w");
                    end else if (done_r8_nird) begin
                    $fwrite(file2,"%d\n",rd_r8_o);
                end
                else if (progress_done_r8_nird) begin
                    $fclose(file2);
                end
                    
                    end
                    
                    
                    `define CI_R8_CYCLE_DELAY 92
                    wire done_ci_r8_delay;
                    wire ci_r8_delay;
                    shift_registers #(.WIDTH(1), .CYCLE(`CI_R8_CYCLE_DELAY)) SHIFT_DONE_CI_R8
                    (
                    .clk(clk),
                    .rst(rst),
                    .data_i(done_ci_r8),
                    .data_o(done_ci_r8_delay));
                    
                    shift_registers #(.WIDTH(1), .CYCLE(`CI_R8_CYCLE_DELAY)) SHIFT_CI_R8 (
                    .clk(clk),
                    .rst(rst),
                    .data_i(ci_r8_o),
                    .data_o(ci_r8_delay));
                    
                    
                    Joint_histogram JOINT_R8 (
                    .clk(clk),
                    .rst(rst),
                    .ci_i(ci_r8_delay),
                    .ni_i(ni_r8_o),
                    .rd_i(rd_r8_o),
                    .done_i(done_r8_nird),
                    .progress_done_i(progress_done_r8_nird),
                    .cinird_o(cinird_r8),
                    .done_o(done_r8),
                    .finish());
                    
                    
                    
                    
                    endmodule
