`timescale 1ns/1ps
`define clk_period 10
`define half_clk_period 5
`define SIZE 30

module CI_top_tb ();
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
    wire [15:0] R2_bit_one_o;
    wire [15:0] R2_bit_zero_o;
    wire done_R2;
    wire [15:0] R4_bit_one_o;
    wire [15:0] R4_bit_zero_o;
    wire done_R4;
    wire [15:0] R6_bit_one_o;
    wire [15:0] R6_bit_zero_o;
    wire done_R6;
    wire [15:0] R8_bit_one_o;
    wire [15:0] R8_bit_zero_o;
    wire done_R8;
    
    CI_top #(.COLS(`SIZE), .ROWS(`SIZE))
    DUT
    (
    .clk(clk),
    .rst(rst),
    .grayscale_i(grayscale_i),
    .done_i(done_i),
    .R2_bit_one_o(R2_bit_one_o),
    .R2_bit_zero_o(R2_bit_zero_o),
    .done_R2(done_R2),
    .R4_bit_one_o(R4_bit_one_o),
    .R4_bit_zero_o(R4_bit_zero_o),
    .done_R4(done_R4),
    .R6_bit_one_o(R6_bit_one_o),
    .R6_bit_zero_o(R6_bit_zero_o),
    .done_R6(done_R6),
    .R8_bit_one_o(R8_bit_one_o),
    .R8_bit_zero_o(R8_bit_zero_o),
    .done_R8(done_R8)
    );
    
    initial begin
        clk <= 1'b0;
    end
    
    always #(`half_clk_period) clk = ~clk;
    
    integer row, col;
    integer file;
    
    initial begin
        // Initialize clock and reset
        clk         <= 1'b0;
        rst         <= 1'b1;
        done_i      <= 1'b0;
        grayscale_i <= 8'b0;
        file = $fopen("D:\\Thesis\\Src\\test_benches\\test\\random_matrix.txt", "r");
        
        if (file == 0) begin
            $display("Error: Cannot open file.");
            $finish;
        end
        
        read_matrix(file);
        
        $fclose(file);
        
        
        // Reset release after some delay
        #(`clk_period * 2);
        rst    <= 1'b0;
        done_i <= 1'b1;
        
        // Initialize the matrix with given data
        // Example: Assign values (can be automated or read from a file)
        
        // Iterate through each row and column to send grayscale data
        for (row = 0; row < `SIZE; row = row + 1) begin
            for (col = 0; col < `SIZE; col = col + 1) begin
                grayscale_i <= matrix[row][col]; // Send one pixel
                #(`clk_period);
            end
        end
        done_i <= 1'b0;
        wait (done_R2);
        #(`clk_period * 5);
        
        $stop;  // End simulation
    end
endmodule
