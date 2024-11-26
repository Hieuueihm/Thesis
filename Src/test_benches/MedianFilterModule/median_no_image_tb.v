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

  // Test data: 5x5 matrix
  reg [7:0] input_matrix[0:24];  // 5x5 matrix flattened into an array

  integer i;
  reg [3:0] row, col;  // For iterating over the matrix

  // Clock generation
  always begin
    #5 clk = ~clk;  // 100MHz clock
  end

  // Test sequence
  initial begin
    // Initialize signals
    clk = 0;
    rst = 0;
    done_i = 0;

    // Initialize the input matrix (5x5)
    input_matrix[0] = 12;
    input_matrix[1] = 24;
    input_matrix[2] = 35;
    input_matrix[3] = 47;
    input_matrix[4] = 58;
    input_matrix[5] = 61;
    input_matrix[6] = 72;
    input_matrix[7] = 83;
    input_matrix[8] = 94;
    input_matrix[9] = 105;
    input_matrix[10] = 106;
    input_matrix[11] = 117;
    input_matrix[12] = 128;
    input_matrix[13] = 139;
    input_matrix[14] = 150;
    input_matrix[15] = 151;
    input_matrix[16] = 162;
    input_matrix[17] = 173;
    input_matrix[18] = 184;
    input_matrix[19] = 195;
    input_matrix[20] = 196;
    input_matrix[21] = 207;
    input_matrix[22] = 218;
    input_matrix[23] = 229;
    input_matrix[24] = 240;

    // Apply reset
    rst = 1;
    #10 rst = 0;

    // Simulate the input feeding process
    row = 0;
    col = 0;
    done_i = 1;  // Indicate that input is ready

    for (i = 0; i < 25; i = i + 1) begin
      grayscale_i = input_matrix[i];
      #10;  // Wait for a clock cycle to simulate input change


    end

    #1000 done_i = 0;


    // Apply the done signal and check the median output
    #10;

    // Wait for the operation to complete and check the final output
    #10;
    $display("Final median value: %d", median_o);
    $stop;
  end

  initial begin
    $monitor("%d\n", median_o);
  end

endmodule
