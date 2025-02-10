`timescale 1ns/1ps
`define clk_period 10
`define half_clk_period 5
`define SIZE 30
module test_top_tb ();
    reg [7:0] matrix [0:`SIZE-1][0:`SIZE-1];
    
    task read_matrix;
        input integer file_id;
        reg [7:0] temp_value;
        integer i, j;
        
        begin
            for (i = 0; i < `SIZE; i = i + 1) begin
                for (j = 0; j < `SIZE; j = j + 1) begin
                    if (!$fscanf(file_id, "%d", temp_value)) begin
                        $display("Error: Not enough data in the file.");
                        disable read_matrix;
                    end
                    matrix[i][j] = temp_value;
                end
            end
        end
        
    endtask
    reg clk;
    reg rst;
    reg [7:0] grayscale_i;
    reg done_i;
    wire [15:0] cinird_r2;
    wire [15:0] cinird_r4;
    wire [15:0] cinird_r6;
    wire done_r6;
    wire done_r4;
    wire done_r2;
    wire finish;
    
    TopModule #(.COLS(`SIZE), .ROWS(`SIZE)) DUT
    (
    .clk(clk),
    .rst(rst),
    .grayscale_i(grayscale_i),
    .done_i(done_i),
    .cinird_r2(cinird_r2),
    .done_r2(done_r2),
    .cinird_r4(cinird_r4),
    .done_r4(done_r4),
    .cinird_r6(cinird_r6),
    .done_r6(done_r6),
    .finish(finish)
    );
    
    initial begin
        clk <= 1'b0;
    end
    
    always #(`half_clk_period) clk = ~clk;
    
    integer row, col;
    integer file, file_id_r2, file_id_r4, file_id_r6;
    
    initial begin
        clk         <= 1'b0;
        rst         <= 1'b1;
        done_i      <= 1'b0;
        grayscale_i <= 8'b0;
        file = $fopen("D:\\Thesis\\Src\\test_benches\\test\\random_matrix.txt", "r");
        
        if (file == 0) begin
            $display("Error: Cannot open file.");
            $finish;
        end
        
        file_id_r2 = $fopen("D:\\Thesis\\CodeTest\\python\\cinird_r2_verilog.txt", "w");
        file_id_r4 = $fopen("D:\\Thesis\\CodeTest\\python\\cinird_r4_verilog.txt", "w");
        file_id_r6 = $fopen("D:\\Thesis\\CodeTest\\python\\cinird_r6_verilog.txt", "w");
        
        if (file_id_r2 == 0 || file_id_r4 == 0 || file_id_r6 == 0) begin
            $display("Error: Could not open output files.");
            $finish;
        end
        
        read_matrix(file);
        $fclose(file);
        
        #(`clk_period * 2);
        rst    <= 1'b0;
        done_i <= 1'b1;
        
        for (row = 0; row < `SIZE; row = row + 1) begin
            for (col = 0; col < `SIZE; col = col + 1) begin
                grayscale_i <= matrix[row][col];
                #(`clk_period);
            end
        end
        done_i <= 1'b0;
        
        #50000;
        $fclose(file_id_r2);
        $fclose(file_id_r4);
        $fclose(file_id_r6);
        
        #100;
        $stop;
    end
    
    always @(posedge clk) begin
        if (done_r2) $fwrite(file_id_r2, "%d\n", cinird_r2);
        if (done_r4) $fwrite(file_id_r4, "%d\n", cinird_r4);
        if (done_r6) $fwrite(file_id_r6, "%d\n", cinird_r6);
    end
endmodule
