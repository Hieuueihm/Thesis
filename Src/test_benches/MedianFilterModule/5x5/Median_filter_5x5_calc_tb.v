module Median_filter_5x5_calc_tb;

  // Inputs
  reg clk;
  reg rst;
  reg done_i;
  reg [7:0] matrix[0:25];  // Array to hold the 7x7 matrix values
  reg [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15;
  reg [7:0] S16, S17, S18, S19, S20, S21, S22, S23, S24, S25;

  // Outputs
  wire [7:0] median_o;
  wire done_o;

  // Instantiate the Unit Under Test (UUT)
  Median_filter_5x5_calc uut (
      .clk(clk),
      .rst(rst),
      .done_i(done_i),
      .S1(S1),
      .S2(S2),
      .S3(S3),
      .S4(S4),
      .S5(S5),
      .S6(S6),
      .S7(S7),
      .S8(S8),
      .S9(S9),
      .S10(S10),
      .S11(S11),
      .S12(S12),
      .S13(S13),
      .S14(S14),
      .S15(S15),
      .S16(S16),
      .S17(S17),
      .S18(S18),
      .S19(S19),
      .S20(S20),
      .S21(S21),
      .S22(S22),
      .S23(S23),
      .S24(S24),
      .S25(S25),
      .median_o(median_o),
      .done_o(done_o)
  );

  // Clock generation
  always begin
    #5 clk = ~clk;  // Toggle clock every 5 time units
  end

  // Task to read the matrix from a file
  task read_matrix;
    integer i;
    integer file;
    reg [7:0] value;
    begin
      file = $fopen("D:\\Thesis\\Src\\test_benches\\MedianFilterModule\\5x5\\matrix.txt", "r");
      if (file == 0) begin
        $display("ERROR: Unable to open file: %s", "matrix.txt");
        $finish;
      end
      for (i = 0; i < 49; i = i + 1) begin
        if (!$feof(file)) begin
          $fscanf(file, "%d\n", value);  // Read decimal value
          matrix[i] = value;
        end
      end
      $fclose(file);
    end
  endtask
  integer i;
  // Initial block for stimulus
  initial begin
    // Initialize Inputs
    clk = 0;
    rst = 0;
    done_i = 0;

    // Read the matrix from file
    read_matrix;

    // Assign matrix values to S1 through S49
    // Loop to assign matrix values to S1 through S49

    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i];
        1:  S2 = matrix[i];
        2:  S3 = matrix[i];
        3:  S4 = matrix[i];
        4:  S5 = matrix[i];
        5:  S6 = matrix[i];
        6:  S7 = matrix[i];
        7:  S8 = matrix[i];
        8:  S9 = matrix[i];
        9:  S10 = matrix[i];
        10: S11 = matrix[i];
        11: S12 = matrix[i];
        12: S13 = matrix[i];
        13: S14 = matrix[i];
        14: S15 = matrix[i];
        15: S16 = matrix[i];
        16: S17 = matrix[i];
        17: S18 = matrix[i];
        18: S19 = matrix[i];
        19: S20 = matrix[i];
        20: S21 = matrix[i];
        21: S22 = matrix[i];
        22: S23 = matrix[i];
        23: S24 = matrix[i];
        24: S25 = matrix[i];

      endcase
    end

    // Apply reset
    rst = 1;
    #10;
    rst = 0;

    // Apply done signal
    #10;
    done_i = 1;
    #100;
    done_i = 0;

    // Check the outputs after some time
    #50;
    $display("Median: %d", median_o);
    $display("Done: %b", done_o);

    // Finish simulation
    $stop;
  end
endmodule
