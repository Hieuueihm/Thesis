interface median_calc_3x3_if (
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
  logic [7:0] median_o;

endinterface


class median_calc_3x3_cv;
  virtual interface median_calc_3x3_if vif;
  int match_cnt;
  logic [7:0] median_fifo[$];
  logic [7:0] m;

  covergroup cg_check_data_i_valid @(posedge vif.clk);
    option.per_instance = 1;
    S1_cp: coverpoint vif.S1 {bins all_values[] = {[0 : 255]};}
    S2_cp: coverpoint vif.S2 {bins all_values[] = {[0 : 255]};}
    S3_cp: coverpoint vif.S3 {bins all_values[] = {[0 : 255]};}
    S4_cp: coverpoint vif.S4 {bins all_values[] = {[0 : 255]};}
    S5_cp: coverpoint vif.S5 {bins all_values[] = {[0 : 255]};}
    S6_cp: coverpoint vif.S6 {bins all_values[] = {[0 : 255]};}
    S7_cp: coverpoint vif.S7 {bins all_values[] = {[0 : 255]};}
    S8_cp: coverpoint vif.S8 {bins all_values[] = {[0 : 255]};}
    S9_cp: coverpoint vif.S9 {bins all_values[] = {[0 : 255]};}


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
  endgroup

  covergroup cg_check_data_o_valid @(posedge vif.clk);
    option.per_instance = 1;
    median_o_cp: coverpoint vif.median_o {bins all_values[] = {[0 : 255]};}
    done_o_cp: coverpoint vif.done_o {bins value = {1};}


    cross done_o_cp, median_o_cp;

  endgroup
  covergroup cg_match_data;
    option.per_instance = 1;
    coverpoint match_cnt {bins match[] = {[0 : 128 * 128 - 1]};}
  endgroup





  function new(virtual interface median_calc_3x3_if vif);
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
      // if (!vif.rst_n) $display("time=%0t\n", $time);
      if (vif.done_i) begin
        cg_check_data_i_valid.sample();
        m = calculate_median(vif.S1, vif.S2, vif.S3, vif.S4, vif.S5, vif.S6, vif.S7, vif.S8,
                             vif.S9);

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
    $display("MedianCalc 3x3 Coverage Input:   %0.2f%%", cov_i);
    $display("MedianCalc 3x3 Coverage Output:  %0.2f%%", cov_o);
    $display("MedianCalc 3x3 Coverage Match:   %0.2f%%", cov_match);
    $display("======================================================");
    $display("MedianCalc 3x3 Average Module Coverage: %0.2f%%", avg_cov);
    $display("======================================================");

    return avg_cov;
  endfunction

  function logic [7:0] calculate_median(logic [7:0] S1, S2, S3, S4, S5, S6, S7, S8, S9);
    logic [7:0] sorted[0:8];
    logic [7:0] temp;
    int i, j;

    sorted[0] = S1;
    sorted[1] = S2;
    sorted[2] = S3;
    sorted[3] = S4;
    sorted[4] = S5;
    sorted[5] = S6;
    sorted[6] = S7;
    sorted[7] = S8;
    sorted[8] = S9;

    // Bubble sort
    for (i = 0; i < 8; i++) begin
      for (j = 0; j < 8 - i; j++) begin
        if (sorted[j] > sorted[j+1]) begin
          temp = sorted[j];
          sorted[j] = sorted[j+1];
          sorted[j+1] = temp;
        end
      end
    end

    return sorted[4];
  endfunction




endclass
