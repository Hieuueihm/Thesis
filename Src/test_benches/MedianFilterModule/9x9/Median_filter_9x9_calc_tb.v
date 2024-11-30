module Median_filter_9x9_calc_tb;

  // Inputs
  reg clk;
  reg rst;
  reg done_i;
  reg [7:0] matrix[0:80];
  reg [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15;
  reg [7:0] S16, S17, S18, S19, S20, S21, S22, S23, S24, S25, S26, S27, S28, S29;
  reg [7:0] S30, S31, S32, S33, S34, S35, S36, S37, S38, S39, S40, S41, S42;
  reg [7:0] S43, S44, S45, S46, S47, S48, S49, S50, S51, S52, S53, S54, S55, S56;
  reg [7:0] S57, S58, S59, S60, S61, S62, S63, S64, S65, S66, S67, S68, S69, S70;
  reg [7:0] S71, S72, S73, S74, S75, S76, S77, S78, S79, S80, S81;

  // Outputs
  wire [7:0] median_o;
  wire done_o;

  // Instantiate the Unit Under Test (UUT)
  Median_filter_9x9_calc uut (
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

      .S9 (S9),
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
      .S26(S26),
      .S27(S27),
      .S28(S28),
      .S29(S29),
      .S30(S30),
      .S31(S31),
      .S32(S32),
      .S33(S33),
      .S34(S34),
      .S35(S35),
      .S36(S36),
      .S37(S37),
      .S38(S38),
      .S39(S39),
      .S40(S40),
      .S41(S41),
      .S42(S42),
      .S43(S43),
      .S44(S44),
      .S45(S45),
      .S46(S46),
      .S47(S47),
      .S48(S48),
      .S49(S49),
      .S50(S50),
      .S51(S51),
      .S52(S52),
      .S53(S53),
      .S54(S54),
      .S55(S55),
      .S56(S56),
      .S57(S57),
      .S58(S58),
      .S59(S59),
      .S60(S60),
      .S61(S61),
      .S62(S62),
      .S63(S63),
      .S64(S64),
      .S65(S65),
      .S66(S66),
      .S67(S67),
      .S68(S68),
      .S69(S69),
      .S70(S70),
      .S71(S71),
      .S72(S72),
      .S73(S73),
      .S74(S74),
      .S75(S75),
      .S76(S76),
      .S77(S77),
      .S78(S78),
      .S79(S79),
      .S80(S80),
      .S81(S81),

      .median_o(median_o),
      .done_o  (done_o)
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
      file = $fopen("D:\\Thesis\\Src\\test_benches\\MedianFilterModule\\9x9\\matrix.txt", "r");
      if (file == 0) begin
        $display("ERROR: Unable to open file: %s", "matrix.txt");
        $finish;
      end
      for (i = 0; i < 81; i = i + 1) begin
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

    #10

    // Read the matrix from file
    read_matrix;

    done_i = 1;
    // Assign matrix values to S1 through S49
    // Loop to assign matrix values to S1 through S49

    for (i = 0; i < 81; i = i + 1) begin
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
        25: S26 = matrix[i];
        26: S27 = matrix[i];
        27: S28 = matrix[i];
        28: S29 = matrix[i];
        29: S30 = matrix[i];
        30: S31 = matrix[i];
        31: S32 = matrix[i];
        32: S33 = matrix[i];
        33: S34 = matrix[i];
        34: S35 = matrix[i];
        35: S36 = matrix[i];
        36: S37 = matrix[i];
        37: S38 = matrix[i];
        38: S39 = matrix[i];
        39: S40 = matrix[i];
        40: S41 = matrix[i];
        41: S42 = matrix[i];
        42: S43 = matrix[i];
        43: S44 = matrix[i];
        44: S45 = matrix[i];
        45: S46 = matrix[i];
        46: S47 = matrix[i];
        47: S48 = matrix[i];
        48: S49 = matrix[i];
        49: S50 = matrix[i];
        50: S51 = matrix[i];
        51: S52 = matrix[i];
        52: S53 = matrix[i];
        53: S54 = matrix[i];
        54: S55 = matrix[i];
        55: S56 = matrix[i];
        56: S57 = matrix[i];
        57: S58 = matrix[i];
        58: S59 = matrix[i];
        59: S60 = matrix[i];
        60: S61 = matrix[i];
        61: S62 = matrix[i];
        62: S63 = matrix[i];
        63: S64 = matrix[i];
        64: S65 = matrix[i];
        65: S66 = matrix[i];
        66: S67 = matrix[i];
        67: S68 = matrix[i];
        68: S69 = matrix[i];
        69: S70 = matrix[i];
        70: S71 = matrix[i];
        71: S72 = matrix[i];
        72: S73 = matrix[i];
        73: S74 = matrix[i];
        74: S75 = matrix[i];
        75: S76 = matrix[i];
        76: S77 = matrix[i];
        77: S78 = matrix[i];
        78: S79 = matrix[i];
        79: S80 = matrix[i];
        80: S81 = matrix[i];

      endcase
    end

    #1000;
    done_i = 0;

    // Check the outputs after some time
    #5000;
    $display("Median: %d", median_o);
    $display("Done: %b", done_o);

    // Finish simulation
    $stop;
  end
endmodule
