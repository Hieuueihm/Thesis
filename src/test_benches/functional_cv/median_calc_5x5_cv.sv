interface median_calc_5x5_if (
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
  logic [7:0] median_o;

endinterface


class median_calc_5x5_cv;
  virtual interface median_calc_5x5_if vif;
  int match_cnt;
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




  endgroup

  covergroup cg_check_data_o_valid @(posedge vif.clk);
    option.per_instance = 1;
    data_o_cp: coverpoint vif.median_o {bins value[] = {[0 : 255]};}
    done_o_cp: coverpoint vif.done_o {bins value = {1};}
    cross done_o_cp, data_o_cp;

  endgroup
  covergroup cg_match_data @(posedge vif.clk);
    option.per_instance = 1;
    coverpoint match_cnt {bins match[] = {[0 : 128 * 128 - 1]};}
  endgroup





  function new(virtual interface median_calc_5x5_if vif);
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
            vif.S25
        );

        median_fifo.push_back(m);
      end
      if (vif.done_o) begin
        done_o_prev <= vif.done_o;
        if (median_fifo.size() > 0) begin
          if (vif.median_o == median_fifo[0]) begin
            match_cnt++;
          end else begin
            $display("Median value mismatch: expected %0d, got %0d", median_fifo[0], vif.median_o);
          end
          median_fifo.pop_front();
        end

      end
    end
  endtask
  function void report();
    real cov_i, cov_o, cov_match;
    real avg_cov;

    cov_i = cg_check_data_i_valid.get_coverage();
    cov_o = cg_check_data_o_valid.get_coverage();
    cov_match = cg_match_data.get_coverage();

    avg_cov = (cov_i + cov_o + cov_match) / 3.0;

    $display("MedianCalc 5x5 Coverage Input:   %0.2f%%", cov_i);
    $display("MedianCalc 5x5 Coverage Output:  %0.2f%%", cov_o);
    $display("MedianCalc 5x5 Coverage Match:   %0.2f%%", cov_match);
    $display("=====================================");
    $display("MedianCalc 5x5 Average Module Coverage: %0.2f%%", avg_cov);
  endfunction

  function logic [7:0] calculate_median(logic [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11,
                                        S12, S13, S14, S15, S16, S17, S18, S19, S20, S21, S22, S23,
                                        S24, S25);
    logic [7:0] sorted[0:24];
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

    for (i = 0; i < 24; i++) begin
      for (j = 0; j < 24 - i; j++) begin
        if (sorted[j] > sorted[j+1]) begin
          temp = sorted[j];
          sorted[j] = sorted[j+1];
          sorted[j+1] = temp;
        end
      end
    end

    return sorted[12];
  endfunction





endclass
