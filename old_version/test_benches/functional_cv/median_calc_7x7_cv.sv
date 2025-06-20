interface median_calc_7x7_if (
    input logic clk,
    rst_n
);
  logic done_i, done_o;

  logic [7:0] S1;
  logic [7:0] S2;
  logic [7:0] S3;
  logic [7:0] S4;
  logic [7:0] S5;
  logic [7:0] S6;
  logic [7:0] S7;
  logic [7:0] S8;
  logic [7:0] S9;
  logic [7:0] S10;
  logic [7:0] S11;
  logic [7:0] S12;
  logic [7:0] S13;
  logic [7:0] S14;
  logic [7:0] S15;
  logic [7:0] S16;
  logic [7:0] S17;
  logic [7:0] S18;
  logic [7:0] S19;
  logic [7:0] S20;
  logic [7:0] S21;
  logic [7:0] S22;
  logic [7:0] S23;
  logic [7:0] S24;
  logic [7:0] S25;
  logic [7:0] S26;
  logic [7:0] S27;
  logic [7:0] S28;
  logic [7:0] S29;
  logic [7:0] S30;
  logic [7:0] S31;
  logic [7:0] S32;
  logic [7:0] S33;
  logic [7:0] S34;
  logic [7:0] S35;
  logic [7:0] S36;
  logic [7:0] S37;
  logic [7:0] S38;
  logic [7:0] S39;
  logic [7:0] S40;
  logic [7:0] S41;
  logic [7:0] S42;
  logic [7:0] S43;
  logic [7:0] S44;
  logic [7:0] S45;
  logic [7:0] S46;
  logic [7:0] S47;
  logic [7:0] S48;
  logic [7:0] S49;
  logic [7:0] median_o;

endinterface


class median_calc_7x7_cv;
  virtual interface median_calc_7x7_if vif;
  bit match_cnt;
  logic [7:0] median_fifo[$];
  logic [7:0] m;

  covergroup cg_check_data_i_valid @(posedge vif.clk);
    option.per_instance = 1;
    S1_cp: coverpoint vif.S1 {bins value[] = {[0 : 255]};}
    S2_cp: coverpoint vif.S2 {bins value[] = {[0 : 255]};}
    S3_cp: coverpoint vif.S3 {bins value[] = {[0 : 255]};}
    S4_cp: coverpoint vif.S4 {bins value[] = {[0 : 255]};}
    S5_cp: coverpoint vif.S5 {bins value[] = {[0 : 255]};}
    S6_cp: coverpoint vif.S6 {bins value[] = {[0 : 255]};}
    S7_cp: coverpoint vif.S7 {bins value[] = {[0 : 255]};}
    S8_cp: coverpoint vif.S8 {bins value[] = {[0 : 255]};}
    S9_cp: coverpoint vif.S9 {bins value[] = {[0 : 255]};}
    S10_cp: coverpoint vif.S10 {bins value[] = {[0 : 255]};}
    S11_cp: coverpoint vif.S11 {bins value[] = {[0 : 255]};}
    S12_cp: coverpoint vif.S12 {bins value[] = {[0 : 255]};}
    S13_cp: coverpoint vif.S13 {bins value[] = {[0 : 255]};}
    S14_cp: coverpoint vif.S14 {bins value[] = {[0 : 255]};}
    S15_cp: coverpoint vif.S15 {bins value[] = {[0 : 255]};}
    S16_cp: coverpoint vif.S16 {bins value[] = {[0 : 255]};}
    S17_cp: coverpoint vif.S17 {bins value[] = {[0 : 255]};}
    S18_cp: coverpoint vif.S18 {bins value[] = {[0 : 255]};}
    S19_cp: coverpoint vif.S19 {bins value[] = {[0 : 255]};}
    S20_cp: coverpoint vif.S20 {bins value[] = {[0 : 255]};}
    S21_cp: coverpoint vif.S21 {bins value[] = {[0 : 255]};}
    S22_cp: coverpoint vif.S22 {bins value[] = {[0 : 255]};}
    S23_cp: coverpoint vif.S23 {bins value[] = {[0 : 255]};}
    S24_cp: coverpoint vif.S24 {bins value[] = {[0 : 255]};}
    S25_cp: coverpoint vif.S25 {bins value[] = {[0 : 255]};}
    S26_cp: coverpoint vif.S26 {bins value[] = {[0 : 255]};}
    S27_cp: coverpoint vif.S27 {bins value[] = {[0 : 255]};}
    S28_cp: coverpoint vif.S28 {bins value[] = {[0 : 255]};}
    S29_cp: coverpoint vif.S29 {bins value[] = {[0 : 255]};}
    S30_cp: coverpoint vif.S30 {bins value[] = {[0 : 255]};}
    S31_cp: coverpoint vif.S31 {bins value[] = {[0 : 255]};}
    S32_cp: coverpoint vif.S32 {bins value[] = {[0 : 255]};}
    S33_cp: coverpoint vif.S33 {bins value[] = {[0 : 255]};}
    S34_cp: coverpoint vif.S34 {bins value[] = {[0 : 255]};}
    S35_cp: coverpoint vif.S35 {bins value[] = {[0 : 255]};}
    S36_cp: coverpoint vif.S36 {bins value[] = {[0 : 255]};}
    S37_cp: coverpoint vif.S37 {bins value[] = {[0 : 255]};}
    S38_cp: coverpoint vif.S38 {bins value[] = {[0 : 255]};}
    S39_cp: coverpoint vif.S39 {bins value[] = {[0 : 255]};}
    S40_cp: coverpoint vif.S40 {bins value[] = {[0 : 255]};}
    S41_cp: coverpoint vif.S41 {bins value[] = {[0 : 255]};}
    S42_cp: coverpoint vif.S42 {bins value[] = {[0 : 255]};}
    S43_cp: coverpoint vif.S43 {bins value[] = {[0 : 255]};}
    S44_cp: coverpoint vif.S44 {bins value[] = {[0 : 255]};}
    S45_cp: coverpoint vif.S45 {bins value[] = {[0 : 255]};}
    S46_cp: coverpoint vif.S46 {bins value[] = {[0 : 255]};}
    S47_cp: coverpoint vif.S47 {bins value[] = {[0 : 255]};}
    S48_cp: coverpoint vif.S48 {bins value[] = {[0 : 255]};}
    S49_cp: coverpoint vif.S49 {bins value[] = {[0 : 255]};}

    done_i_cp: coverpoint vif.done_i {bins value = {1};}

    cross done_i_cp, S1_cp;

    cross done_i_cp, S2_cp;
    cross done_i_cp, S3_cp;
    cross done_i_cp, S4_cp;
    cross done_i_cp, S5_cp;
    cross done_i_cp, S6_cp;
    cross done_i_cp, S7_cp;
    cross done_i_cp, S8_cp;
    cross done_i_cp, S9_cp;
    cross done_i_cp, S10_cp;
    cross done_i_cp, S11_cp;
    cross done_i_cp, S12_cp;
    cross done_i_cp, S13_cp;
    cross done_i_cp, S14_cp;
    cross done_i_cp, S15_cp;
    cross done_i_cp, S16_cp;
    cross done_i_cp, S17_cp;
    cross done_i_cp, S18_cp;
    cross done_i_cp, S19_cp;
    cross done_i_cp, S20_cp;
    cross done_i_cp, S21_cp;
    cross done_i_cp, S22_cp;
    cross done_i_cp, S23_cp;
    cross done_i_cp, S24_cp;
    cross done_i_cp, S25_cp;
    cross done_i_cp, S26_cp;
    cross done_i_cp, S27_cp;
    cross done_i_cp, S28_cp;
    cross done_i_cp, S29_cp;
    cross done_i_cp, S30_cp;
    cross done_i_cp, S31_cp;
    cross done_i_cp, S32_cp;
    cross done_i_cp, S33_cp;
    cross done_i_cp, S34_cp;
    cross done_i_cp, S35_cp;
    cross done_i_cp, S36_cp;
    cross done_i_cp, S37_cp;
    cross done_i_cp, S38_cp;
    cross done_i_cp, S39_cp;
    cross done_i_cp, S40_cp;
    cross done_i_cp, S41_cp;
    cross done_i_cp, S42_cp;
    cross done_i_cp, S43_cp;
    cross done_i_cp, S44_cp;
    cross done_i_cp, S45_cp;
    cross done_i_cp, S46_cp;
    cross done_i_cp, S47_cp;
    cross done_i_cp, S48_cp;
    cross done_i_cp, S49_cp;

  endgroup

  covergroup cg_check_data_o_valid @(posedge vif.clk);
    option.per_instance = 1;
    data_o_cp: coverpoint vif.median_o {bins value[] = {[0 : 255]};}
    done_o_cp: coverpoint vif.done_o {bins value = {1};}
    cross done_o_cp, data_o_cp;

  endgroup
  covergroup cg_match_data;
    option.per_instance = 1;
    coverpoint match_cnt {bins match[] = {[0 : (128 * 128) - 1]};}
  endgroup





  function new(virtual interface median_calc_7x7_if vif);
    this.vif = vif;
    cg_check_data_i_valid = new();
    cg_check_data_o_valid = new();
    cg_match_data = new();
  endfunction

  logic done_o_prev;

  task monitor();
    forever begin
      @(posedge vif.clk);
      if (~vif.rst_n) begin
        median_fifo.delete();
        match_cnt = 0;
      end
      if (done_o_prev == 1 && vif.done_o == 0) begin
        match_cnt = 0;
        median_fifo.delete();
      end
      if (vif.done_i) begin
        m = calculate_median(
            vif.S1,
            vif.S2,
            vif.S3,
            vif.S4,
            vif.S5,
            vif.S6,
            vif.S7,
            vif.S8,
            vif.S9,
            vif.S10,
            vif.S11,
            vif.S12,
            vif.S13,
            vif.S14,
            vif.S15,
            vif.S16,
            vif.S17,
            vif.S18,
            vif.S19,
            vif.S20,
            vif.S21,
            vif.S22,
            vif.S23,
            vif.S24,
            vif.S25,
            vif.S26,
            vif.S27,
            vif.S28,
            vif.S29,
            vif.S30,
            vif.S31,
            vif.S32,
            vif.S33,
            vif.S34,
            vif.S35,
            vif.S36,
            vif.S37,
            vif.S38,
            vif.S39,
            vif.S40,
            vif.S41,
            vif.S42,
            vif.S43,
            vif.S44,
            vif.S45,
            vif.S46,
            vif.S47,
            vif.S48,
            vif.S49
        );
        median_fifo.push_back(m);
      end
      if (vif.done_o) begin
        done_o_prev <= vif.done_o;
        if (median_fifo.size() > 0) begin
          if (vif.median_o == median_fifo[0]) begin
            match_cnt++;
          end
          median_fifo.pop_front();
        end
        cg_match_data.sample();

      end
    end
  endtask
  function real report();
    real cov_i, cov_o, cov_match;
    real avg_cov;

    cov_i = cg_check_data_i_valid.get_coverage();
    cov_o = cg_check_data_o_valid.get_coverage();
    cov_match = cg_match_data.get_coverage();

    avg_cov = (cov_i + cov_o + cov_match) / 3.0;
    $display("======================================================");

    $display("MedianCalc 7x7 Coverage Input:   %0.2f%%", cov_i);
    $display("MedianCalc 7x7 Coverage Output:  %0.2f%%", cov_o);
    $display("MedianCalc 7x7 Coverage Match:   %0.2f%%", cov_match);
    $display("======================================================");
    $display("MedianCalc 7x7 Average Module Coverage: %0.2f%%", avg_cov);
    $display("======================================================");

    return avg_cov;
  endfunction

  function logic [7:0] calculate_median(
      logic [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18,
      S19, S20, S21, S22, S23, S24, S25, S26, S27, S28, S29, S30, S31, S32, S33, S34, S35, S36, S37,
      S38, S39, S40, S41, S42, S43, S44, S45, S46, S47, S48, S49);
    logic [7:0] sorted[0:48];
    logic [7:0] temp;
    int i, j;

    sorted[0]  = S1;
    sorted[1]  = S2;
    sorted[2]  = S3;
    sorted[3]  = S4;
    sorted[4]  = S5;
    sorted[5]  = S6;
    sorted[6]  = S7;
    sorted[7]  = S8;
    sorted[8]  = S9;
    sorted[9]  = S10;
    sorted[10] = S11;
    sorted[11] = S12;
    sorted[12] = S13;
    sorted[13] = S14;
    sorted[14] = S15;
    sorted[15] = S16;
    sorted[16] = S17;
    sorted[17] = S18;
    sorted[18] = S19;
    sorted[19] = S20;
    sorted[20] = S21;
    sorted[21] = S22;
    sorted[22] = S23;
    sorted[23] = S24;
    sorted[24] = S25;
    sorted[25] = S26;
    sorted[26] = S27;
    sorted[27] = S28;
    sorted[28] = S29;
    sorted[29] = S30;
    sorted[30] = S31;
    sorted[31] = S32;
    sorted[32] = S33;
    sorted[33] = S34;
    sorted[34] = S35;
    sorted[35] = S36;
    sorted[36] = S37;
    sorted[37] = S38;
    sorted[38] = S39;
    sorted[39] = S40;
    sorted[40] = S41;
    sorted[41] = S42;
    sorted[42] = S43;
    sorted[43] = S44;
    sorted[44] = S45;
    sorted[45] = S46;
    sorted[46] = S47;
    sorted[47] = S48;
    sorted[48] = S49;

    // Bubble sort
    for (i = 0; i < 48; i++) begin
      for (j = 0; j < 48 - i; j++) begin
        if (sorted[j] > sorted[j+1]) begin
          temp = sorted[j];
          sorted[j] = sorted[j+1];
          sorted[j+1] = temp;
        end
      end
    end

    return sorted[24];
  endfunction






endclass
