`timescale 1ns / 1ps
`define clk_period 10
`define half_clk_period 5
`define SIZE 30
module test_top_tb ();
  reg [7:0] matrix[0:`SIZE-1][0:`SIZE-1];

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
  reg rst_n;
  reg [7:0] grayscale_i;
  reg i_valid;
  reg start_i;
  reg i_data_ready;


  wire [31:0] histogram_o;
  wire o_valid;
  wire o_intr;
  wire o_data_ready;



  top_module #(
      .COLS(`SIZE),
      .ROWS(`SIZE)
  ) DUT (
      .clk(clk),
      .rst_n(rst_n),
      .grayscale_i(grayscale_i),
      .i_valid(i_valid),
      .o_data_ready(o_data_ready),
      .start_i(start_i),
      .histogram_o(histogram_o),
      .o_valid(o_valid),
      .i_data_ready(i_data_ready),
      .o_intr(o_intr)
  );

  initial begin
    clk <= 1'b0;
  end

  always #(`half_clk_period) clk = ~clk;

  integer row, col;
  integer file_out;
  integer file;
  integer file_out1;
  initial begin
    clk         <= 1'b1;
    rst_n       <= 1'b0;
    i_valid     <= 1'b0;
    grayscale_i <= 8'b0;
    i_data_ready = 1'b0;

    start_i <= 0;
    file = $fopen("D:\\Thesis\\Src\\test_benches\\test\\random_matrix.txt", "r");
    if (file == 0) begin
      $display("Error: Cannot open file.");
      $finish;
    end

    file_out = $fopen("D:\\Thesis\\codetest\\python\\histogram_verilog.txt", "w");
file_out1 =  $fopen("D:\\Thesis\\codetest\\python\\histogram_verilog_1.txt", "w");
    if (file_out == 0) begin
      $display("Error: Could not open output files.");
      $finish;
    end



    read_matrix(file);
    $fclose(file);

    #(`clk_period * 2);
    rst_n <= 1'b1;
    i_data_ready = 1'b1;


    #(`clk_period);
    start_i <= 1'b1;
    #(`clk_period);
    start_i <= 1'b0;
    i_valid <= 1'b1;

    for (row = 0; row < `SIZE; row = row + 1) begin
      for (col = 0; col < `SIZE; col = col + 1) begin
        grayscale_i <= matrix[row][col];
        #(`clk_period);
      end
    end
    i_valid <= 1'b0;

    wait(o_intr);

    $fclose(file_out);

        #(`clk_period);
    start_i <= 1'b1;
    #(`clk_period);
    start_i <= 1'b0;
        i_valid <= 1'b1;

   for (row = 0; row < `SIZE; row = row + 1) begin
      for (col = 0; col < `SIZE; col = col + 1) begin
        grayscale_i <= matrix[row][col];
        #(`clk_period);
      end
    end
    i_valid <= 1'b0;
    wait(o_intr);
    $fclose(file_out1);

    #100;
    $stop;
  end

  always @(posedge clk) begin
    if (o_valid) $fwrite(file_out, "%d\n", histogram_o);
    if (o_valid ) $fwrite(file_out1, "%d\n", histogram_o);
  end
endmodule
