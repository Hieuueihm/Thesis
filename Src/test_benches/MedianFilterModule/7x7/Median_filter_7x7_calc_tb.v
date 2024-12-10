module Median_filter_7x7_calc_tb;

  // Inputs
  reg clk;
  reg rst;
  reg done_i;
  reg [7:0] matrix[0:539];  // Array to hold the 7x7 matrix values
  reg [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15;
  reg [7:0] S16, S17, S18, S19, S20, S21, S22, S23, S24, S25, S26, S27, S28, S29;
  reg [7:0] S30, S31, S32, S33, S34, S35, S36, S37, S38, S39, S40, S41, S42;
  reg [7:0] S43, S44, S45, S46, S47, S48, S49;

  // Outputs
  wire [7:0] median_o;
  wire done_o;

  // Instantiate the Unit Under Test (UUT)
  Median_filter_7x7_calc uut (
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
      file = $fopen("D:\\Thesis\\Src\\test_benches\\MedianFilterModule\\7x7\\matrix.txt", "r");
      if (file == 0) begin
        $display("ERROR: Unable to open file: %s", "matrix.txt");
        $finish;
      end
      for (i = 0; i < 539; i = i + 1) begin
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
    #10;
    rst = 1;
    #10 rst = 0;
    done_i = 1;


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
      endcase
    end
    #10;
    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i+49];
        1:  S2 = matrix[i+49];
        2:  S3 = matrix[i+49];
        3:  S4 = matrix[i+49];
        4:  S5 = matrix[i+49];
        5:  S6 = matrix[i+49];
        6:  S7 = matrix[i+49];
        7:  S8 = matrix[i+49];
        8:  S9 = matrix[i+49];
        9:  S10 = matrix[i+49];
        10: S11 = matrix[i+49];
        11: S12 = matrix[i+49];
        12: S13 = matrix[i+49];
        13: S14 = matrix[i+49];
        14: S15 = matrix[i+49];
        15: S16 = matrix[i+49];
        16: S17 = matrix[i+49];
        17: S18 = matrix[i+49];
        18: S19 = matrix[i+49];
        19: S20 = matrix[i+49];
        20: S21 = matrix[i+49];
        21: S22 = matrix[i+49];
        22: S23 = matrix[i+49];
        23: S24 = matrix[i+49];
        24: S25 = matrix[i+49];
        25: S26 = matrix[i+49];
        26: S27 = matrix[i+49];
        27: S28 = matrix[i+49];
        28: S29 = matrix[i+49];
        29: S30 = matrix[i+49];
        30: S31 = matrix[i+49];
        31: S32 = matrix[i+49];
        32: S33 = matrix[i+49];
        33: S34 = matrix[i+49];
        34: S35 = matrix[i+49];
        35: S36 = matrix[i+49];
        36: S37 = matrix[i+49];
        37: S38 = matrix[i+49];
        38: S39 = matrix[i+49];
        39: S40 = matrix[i+49];
        40: S41 = matrix[i+49];
        41: S42 = matrix[i+49];
        42: S43 = matrix[i+49];
        43: S44 = matrix[i+49];
        44: S45 = matrix[i+49];
        45: S46 = matrix[i+49];
        46: S47 = matrix[i+49];
        47: S48 = matrix[i+49];
        48: S49 = matrix[i+49];
      endcase
    end
    #10;
    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i+98];
        1:  S2 = matrix[i+98];
        2:  S3 = matrix[i+98];
        3:  S4 = matrix[i+98];
        4:  S5 = matrix[i+98];
        5:  S6 = matrix[i+98];
        6:  S7 = matrix[i+98];
        7:  S8 = matrix[i+98];
        8:  S9 = matrix[i+98];
        9:  S10 = matrix[i+98];
        10: S11 = matrix[i+98];
        11: S12 = matrix[i+98];
        12: S13 = matrix[i+98];
        13: S14 = matrix[i+98];
        14: S15 = matrix[i+98];
        15: S16 = matrix[i+98];
        16: S17 = matrix[i+98];
        17: S18 = matrix[i+98];
        18: S19 = matrix[i+98];
        19: S20 = matrix[i+98];
        20: S21 = matrix[i+98];
        21: S22 = matrix[i+98];
        22: S23 = matrix[i+98];
        23: S24 = matrix[i+98];
        24: S25 = matrix[i+98];
        25: S26 = matrix[i+98];
        26: S27 = matrix[i+98];
        27: S28 = matrix[i+98];
        28: S29 = matrix[i+98];
        29: S30 = matrix[i+98];
        30: S31 = matrix[i+98];
        31: S32 = matrix[i+98];
        32: S33 = matrix[i+98];
        33: S34 = matrix[i+98];
        34: S35 = matrix[i+98];
        35: S36 = matrix[i+98];
        36: S37 = matrix[i+98];
        37: S38 = matrix[i+98];
        38: S39 = matrix[i+98];
        39: S40 = matrix[i+98];
        40: S41 = matrix[i+98];
        41: S42 = matrix[i+98];
        42: S43 = matrix[i+98];
        43: S44 = matrix[i+98];
        44: S45 = matrix[i+98];
        45: S46 = matrix[i+98];
        46: S47 = matrix[i+98];
        47: S48 = matrix[i+98];
        48: S49 = matrix[i+98];
      endcase
    end
    #10;
    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i+147];
        1:  S2 = matrix[i+147];
        2:  S3 = matrix[i+147];
        3:  S4 = matrix[i+147];
        4:  S5 = matrix[i+147];
        5:  S6 = matrix[i+147];
        6:  S7 = matrix[i+147];
        7:  S8 = matrix[i+147];
        8:  S9 = matrix[i+147];
        9:  S10 = matrix[i+147];
        10: S11 = matrix[i+147];
        11: S12 = matrix[i+147];
        12: S13 = matrix[i+147];
        13: S14 = matrix[i+147];
        14: S15 = matrix[i+147];
        15: S16 = matrix[i+147];
        16: S17 = matrix[i+147];
        17: S18 = matrix[i+147];
        18: S19 = matrix[i+147];
        19: S20 = matrix[i+147];
        20: S21 = matrix[i+147];
        21: S22 = matrix[i+147];
        22: S23 = matrix[i+147];
        23: S24 = matrix[i+147];
        24: S25 = matrix[i+147];
        25: S26 = matrix[i+147];
        26: S27 = matrix[i+147];
        27: S28 = matrix[i+147];
        28: S29 = matrix[i+147];
        29: S30 = matrix[i+147];
        30: S31 = matrix[i+147];
        31: S32 = matrix[i+147];
        32: S33 = matrix[i+147];
        33: S34 = matrix[i+147];
        34: S35 = matrix[i+147];
        35: S36 = matrix[i+147];
        36: S37 = matrix[i+147];
        37: S38 = matrix[i+147];
        38: S39 = matrix[i+147];
        39: S40 = matrix[i+147];
        40: S41 = matrix[i+147];
        41: S42 = matrix[i+147];
        42: S43 = matrix[i+147];
        43: S44 = matrix[i+147];
        44: S45 = matrix[i+147];
        45: S46 = matrix[i+147];
        46: S47 = matrix[i+147];
        47: S48 = matrix[i+147];
        48: S49 = matrix[i+147];
      endcase
    end
    #10;
    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i+196];
        1:  S2 = matrix[i+196];
        2:  S3 = matrix[i+196];
        3:  S4 = matrix[i+196];
        4:  S5 = matrix[i+196];
        5:  S6 = matrix[i+196];
        6:  S7 = matrix[i+196];
        7:  S8 = matrix[i+196];
        8:  S9 = matrix[i+196];
        9:  S10 = matrix[i+196];
        10: S11 = matrix[i+196];
        11: S12 = matrix[i+196];
        12: S13 = matrix[i+196];
        13: S14 = matrix[i+196];
        14: S15 = matrix[i+196];
        15: S16 = matrix[i+196];
        16: S17 = matrix[i+196];
        17: S18 = matrix[i+196];
        18: S19 = matrix[i+196];
        19: S20 = matrix[i+196];
        20: S21 = matrix[i+196];
        21: S22 = matrix[i+196];
        22: S23 = matrix[i+196];
        23: S24 = matrix[i+196];
        24: S25 = matrix[i+196];
        25: S26 = matrix[i+196];
        26: S27 = matrix[i+196];
        27: S28 = matrix[i+196];
        28: S29 = matrix[i+196];
        29: S30 = matrix[i+196];
        30: S31 = matrix[i+196];
        31: S32 = matrix[i+196];
        32: S33 = matrix[i+196];
        33: S34 = matrix[i+196];
        34: S35 = matrix[i+196];
        35: S36 = matrix[i+196];
        36: S37 = matrix[i+196];
        37: S38 = matrix[i+196];
        38: S39 = matrix[i+196];
        39: S40 = matrix[i+196];
        40: S41 = matrix[i+196];
        41: S42 = matrix[i+196];
        42: S43 = matrix[i+196];
        43: S44 = matrix[i+196];
        44: S45 = matrix[i+196];
        45: S46 = matrix[i+196];
        46: S47 = matrix[i+196];
        47: S48 = matrix[i+196];
        48: S49 = matrix[i+196];
      endcase
    end
    #10;
    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i+245];
        1:  S2 = matrix[i+245];
        2:  S3 = matrix[i+245];
        3:  S4 = matrix[i+245];
        4:  S5 = matrix[i+245];
        5:  S6 = matrix[i+245];
        6:  S7 = matrix[i+245];
        7:  S8 = matrix[i+245];
        8:  S9 = matrix[i+245];
        9:  S10 = matrix[i+245];
        10: S11 = matrix[i+245];
        11: S12 = matrix[i+245];
        12: S13 = matrix[i+245];
        13: S14 = matrix[i+245];
        14: S15 = matrix[i+245];
        15: S16 = matrix[i+245];
        16: S17 = matrix[i+245];
        17: S18 = matrix[i+245];
        18: S19 = matrix[i+245];
        19: S20 = matrix[i+245];
        20: S21 = matrix[i+245];
        21: S22 = matrix[i+245];
        22: S23 = matrix[i+245];
        23: S24 = matrix[i+245];
        24: S25 = matrix[i+245];
        25: S26 = matrix[i+245];
        26: S27 = matrix[i+245];
        27: S28 = matrix[i+245];
        28: S29 = matrix[i+245];
        29: S30 = matrix[i+245];
        30: S31 = matrix[i+245];
        31: S32 = matrix[i+245];
        32: S33 = matrix[i+245];
        33: S34 = matrix[i+245];
        34: S35 = matrix[i+245];
        35: S36 = matrix[i+245];
        36: S37 = matrix[i+245];
        37: S38 = matrix[i+245];
        38: S39 = matrix[i+245];
        39: S40 = matrix[i+245];
        40: S41 = matrix[i+245];
        41: S42 = matrix[i+245];
        42: S43 = matrix[i+245];
        43: S44 = matrix[i+245];
        44: S45 = matrix[i+245];
        45: S46 = matrix[i+245];
        46: S47 = matrix[i+245];
        47: S48 = matrix[i+245];
        48: S49 = matrix[i+245];
      endcase
    end
    #10;
    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i+294];
        1:  S2 = matrix[i+294];
        2:  S3 = matrix[i+294];
        3:  S4 = matrix[i+294];
        4:  S5 = matrix[i+294];
        5:  S6 = matrix[i+294];
        6:  S7 = matrix[i+294];
        7:  S8 = matrix[i+294];
        8:  S9 = matrix[i+294];
        9:  S10 = matrix[i+294];
        10: S11 = matrix[i+294];
        11: S12 = matrix[i+294];
        12: S13 = matrix[i+294];
        13: S14 = matrix[i+294];
        14: S15 = matrix[i+294];
        15: S16 = matrix[i+294];
        16: S17 = matrix[i+294];
        17: S18 = matrix[i+294];
        18: S19 = matrix[i+294];
        19: S20 = matrix[i+294];
        20: S21 = matrix[i+294];
        21: S22 = matrix[i+294];
        22: S23 = matrix[i+294];
        23: S24 = matrix[i+294];
        24: S25 = matrix[i+294];
        25: S26 = matrix[i+294];
        26: S27 = matrix[i+294];
        27: S28 = matrix[i+294];
        28: S29 = matrix[i+294];
        29: S30 = matrix[i+294];
        30: S31 = matrix[i+294];
        31: S32 = matrix[i+294];
        32: S33 = matrix[i+294];
        33: S34 = matrix[i+294];
        34: S35 = matrix[i+294];
        35: S36 = matrix[i+294];
        36: S37 = matrix[i+294];
        37: S38 = matrix[i+294];
        38: S39 = matrix[i+294];
        39: S40 = matrix[i+294];
        40: S41 = matrix[i+294];
        41: S42 = matrix[i+294];
        42: S43 = matrix[i+294];
        43: S44 = matrix[i+294];
        44: S45 = matrix[i+294];
        45: S46 = matrix[i+294];
        46: S47 = matrix[i+294];
        47: S48 = matrix[i+294];
        48: S49 = matrix[i+294];
      endcase
    end
    #10;
    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i+343];
        1:  S2 = matrix[i+343];
        2:  S3 = matrix[i+343];
        3:  S4 = matrix[i+343];
        4:  S5 = matrix[i+343];
        5:  S6 = matrix[i+343];
        6:  S7 = matrix[i+343];
        7:  S8 = matrix[i+343];
        8:  S9 = matrix[i+343];
        9:  S10 = matrix[i+343];
        10: S11 = matrix[i+343];
        11: S12 = matrix[i+343];
        12: S13 = matrix[i+343];
        13: S14 = matrix[i+343];
        14: S15 = matrix[i+343];
        15: S16 = matrix[i+343];
        16: S17 = matrix[i+343];
        17: S18 = matrix[i+343];
        18: S19 = matrix[i+343];
        19: S20 = matrix[i+343];
        20: S21 = matrix[i+343];
        21: S22 = matrix[i+343];
        22: S23 = matrix[i+343];
        23: S24 = matrix[i+343];
        24: S25 = matrix[i+343];
        25: S26 = matrix[i+343];
        26: S27 = matrix[i+343];
        27: S28 = matrix[i+343];
        28: S29 = matrix[i+343];
        29: S30 = matrix[i+343];
        30: S31 = matrix[i+343];
        31: S32 = matrix[i+343];
        32: S33 = matrix[i+343];
        33: S34 = matrix[i+343];
        34: S35 = matrix[i+343];
        35: S36 = matrix[i+343];
        36: S37 = matrix[i+343];
        37: S38 = matrix[i+343];
        38: S39 = matrix[i+343];
        39: S40 = matrix[i+343];
        40: S41 = matrix[i+343];
        41: S42 = matrix[i+343];
        42: S43 = matrix[i+343];
        43: S44 = matrix[i+343];
        44: S45 = matrix[i+343];
        45: S46 = matrix[i+343];
        46: S47 = matrix[i+343];
        47: S48 = matrix[i+343];
        48: S49 = matrix[i+343];
      endcase
    end
    #10;
    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i+392];
        1:  S2 = matrix[i+392];
        2:  S3 = matrix[i+392];
        3:  S4 = matrix[i+392];
        4:  S5 = matrix[i+392];
        5:  S6 = matrix[i+392];
        6:  S7 = matrix[i+392];
        7:  S8 = matrix[i+392];
        8:  S9 = matrix[i+392];
        9:  S10 = matrix[i+392];
        10: S11 = matrix[i+392];
        11: S12 = matrix[i+392];
        12: S13 = matrix[i+392];
        13: S14 = matrix[i+392];
        14: S15 = matrix[i+392];
        15: S16 = matrix[i+392];
        16: S17 = matrix[i+392];
        17: S18 = matrix[i+392];
        18: S19 = matrix[i+392];
        19: S20 = matrix[i+392];
        20: S21 = matrix[i+392];
        21: S22 = matrix[i+392];
        22: S23 = matrix[i+392];
        23: S24 = matrix[i+392];
        24: S25 = matrix[i+392];
        25: S26 = matrix[i+392];
        26: S27 = matrix[i+392];
        27: S28 = matrix[i+392];
        28: S29 = matrix[i+392];
        29: S30 = matrix[i+392];
        30: S31 = matrix[i+392];
        31: S32 = matrix[i+392];
        32: S33 = matrix[i+392];
        33: S34 = matrix[i+392];
        34: S35 = matrix[i+392];
        35: S36 = matrix[i+392];
        36: S37 = matrix[i+392];
        37: S38 = matrix[i+392];
        38: S39 = matrix[i+392];
        39: S40 = matrix[i+392];
        40: S41 = matrix[i+392];
        41: S42 = matrix[i+392];
        42: S43 = matrix[i+392];
        43: S44 = matrix[i+392];
        44: S45 = matrix[i+392];
        45: S46 = matrix[i+392];
        46: S47 = matrix[i+392];
        47: S48 = matrix[i+392];
        48: S49 = matrix[i+392];
      endcase
    end
    #10;
    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i+441];
        1:  S2 = matrix[i+441];
        2:  S3 = matrix[i+441];
        3:  S4 = matrix[i+441];
        4:  S5 = matrix[i+441];
        5:  S6 = matrix[i+441];
        6:  S7 = matrix[i+441];
        7:  S8 = matrix[i+441];
        8:  S9 = matrix[i+441];
        9:  S10 = matrix[i+441];
        10: S11 = matrix[i+441];
        11: S12 = matrix[i+441];
        12: S13 = matrix[i+441];
        13: S14 = matrix[i+441];
        14: S15 = matrix[i+441];
        15: S16 = matrix[i+441];
        16: S17 = matrix[i+441];
        17: S18 = matrix[i+441];
        18: S19 = matrix[i+441];
        19: S20 = matrix[i+441];
        20: S21 = matrix[i+441];
        21: S22 = matrix[i+441];
        22: S23 = matrix[i+441];
        23: S24 = matrix[i+441];
        24: S25 = matrix[i+441];
        25: S26 = matrix[i+441];
        26: S27 = matrix[i+441];
        27: S28 = matrix[i+441];
        28: S29 = matrix[i+441];
        29: S30 = matrix[i+441];
        30: S31 = matrix[i+441];
        31: S32 = matrix[i+441];
        32: S33 = matrix[i+441];
        33: S34 = matrix[i+441];
        34: S35 = matrix[i+441];
        35: S36 = matrix[i+441];
        36: S37 = matrix[i+441];
        37: S38 = matrix[i+441];
        38: S39 = matrix[i+441];
        39: S40 = matrix[i+441];
        40: S41 = matrix[i+441];
        41: S42 = matrix[i+441];
        42: S43 = matrix[i+441];
        43: S44 = matrix[i+441];
        44: S45 = matrix[i+441];
        45: S46 = matrix[i+441];
        46: S47 = matrix[i+441];
        47: S48 = matrix[i+441];
        48: S49 = matrix[i+441];
      endcase
    end
    #10;
    for (i = 0; i < 49; i = i + 1) begin
      case (i)
        0:  S1 = matrix[i+490];
        1:  S2 = matrix[i+490];
        2:  S3 = matrix[i+490];
        3:  S4 = matrix[i+490];
        4:  S5 = matrix[i+490];
        5:  S6 = matrix[i+490];
        6:  S7 = matrix[i+490];
        7:  S8 = matrix[i+490];
        8:  S9 = matrix[i+490];
        9:  S10 = matrix[i+490];
        10: S11 = matrix[i+490];
        11: S12 = matrix[i+490];
        12: S13 = matrix[i+490];
        13: S14 = matrix[i+490];
        14: S15 = matrix[i+490];
        15: S16 = matrix[i+490];
        16: S17 = matrix[i+490];
        17: S18 = matrix[i+490];
        18: S19 = matrix[i+490];
        19: S20 = matrix[i+490];
        20: S21 = matrix[i+490];
        21: S22 = matrix[i+490];
        22: S23 = matrix[i+490];
        23: S24 = matrix[i+490];
        24: S25 = matrix[i+490];
        25: S26 = matrix[i+490];
        26: S27 = matrix[i+490];
        27: S28 = matrix[i+490];
        28: S29 = matrix[i+490];
        29: S30 = matrix[i+490];
        30: S31 = matrix[i+490];
        31: S32 = matrix[i+490];
        32: S33 = matrix[i+490];
        33: S34 = matrix[i+490];
        34: S35 = matrix[i+490];
        35: S36 = matrix[i+490];
        36: S37 = matrix[i+490];
        37: S38 = matrix[i+490];
        38: S39 = matrix[i+490];
        39: S40 = matrix[i+490];
        40: S41 = matrix[i+490];
        41: S42 = matrix[i+490];
        42: S43 = matrix[i+490];
        43: S44 = matrix[i+490];
        44: S45 = matrix[i+490];
        45: S46 = matrix[i+490];
        46: S47 = matrix[i+490];
        47: S48 = matrix[i+490];
        48: S49 = matrix[i+490];
      endcase
    end


    #10 done_i = 0;

    // Check the outputs after some time
    #500;
    $display("Median: %d", median_o);
    $display("Done: %b", done_o);

    // Finish simulation
    $stop;
  end
endmodule
