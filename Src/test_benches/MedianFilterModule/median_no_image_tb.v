module median_no_image_tb;

  // Inputs
  reg clk;
  reg rst;
  reg [7:0] grayscale_i;
  reg done_i;

  // Outputs
  wire [7:0] median_o;
  wire done_o;

  // Instantiate the median_no_image module
  median_no_image uut (
      .clk(clk),
      .rst(rst),
      .grayscale_i(grayscale_i),
      .done_i(done_i),
      .median_o(median_o),
      .done_o(done_o)
  );

  // Registers for 9x9 matrix
  reg [7:0] S[1:121];  // Array for 81 elements of the 9x9 matrix
  reg [7:0] matrix[0:120];  // Flattened input matrix

  // Clock generation
  always begin
    #5 clk = ~clk;  // 100MHz clock
  end

  // Task to read the matrix from a file
  task read_matrix;
    integer i;
    integer file;
    reg [7:0] value;
    begin
      file = $fopen("D:\\Thesis\\Src\\test_benches\\MedianFilterModule\\matrix_9x9.txt", "r");
      if (file == 0) begin
        $display("ERROR: Unable to open file: %s", "matrix_5x5.txt");
        $finish;
      end
      for (i = 0; i < 121; i = i + 1) begin
        if (!$feof(file)) begin
          $fscanf(file, "%d\n", value);  // Read decimal value
          matrix[i] = value;
        end
      end
      $fclose(file);
    end
  endtask

  integer i;

  // Test sequence
  initial begin
    clk = 0;
    rst = 0;
    done_i = 0;

    // Read the matrix from file
    read_matrix;

    // Assign matrix values to S1 through S81
    for (i = 0; i < 121; i = i + 1) begin
      S[i+1] = matrix[i];
    end

    // Apply reset
    rst = 1;
    #10;
    rst = 0;

    // Apply done signal
    #10;
    done_i = 1;
    for (i = 0; i < 121; i = i + 1) begin
      grayscale_i = matrix[i];
      #10;
    end
    #300;
    done_i = 0;

    // Check the outputs after some time
    #10000;

    // Finish simulation
    $stop;
  end

  initial begin
    $monitor("%d\n", median_o);
  end

endmodule
