interface mrelbp_ci_r2_if (
    input logic clk,
    rst_n
);
  logic done_i, done_o;
  logic [7:0] S1;
  logic [7:0] S2;
  logic [7:0] S3;
  logic [7:0] S4;
  logic [7:0] S5;
  logic ci_o;
  logic progress_done_o;


endinterface


class mrelbp_ci_r2_cv;
  virtual interface mrelbp_ci_r2_if vif;
  bit match_value;
  bit ci_fifo[$];
  logic done_o_prev;
  logic i_en;
  logic [7:0] window[0:4][0:4];
  int i = 0;
  bit s1_valid, s2_valid, s3_valid, s4_valid, s5_valid;
  bit is_inp_sample;
  bit is_oup_sample;
  covergroup cg_check_data_i_valid;
    option.per_instance = 1;

    coverpoint s1_valid {bins yes = {1};}
    coverpoint s2_valid {bins yes = {1};}
    coverpoint s3_valid {bins yes = {1};}
    coverpoint s4_valid {bins yes = {1};}
    coverpoint s5_valid {bins yes = {1};}


    coverpoint is_inp_sample {bins yes = {1};}

    cross s1_valid, is_inp_sample;
    cross s2_valid, is_inp_sample;
    cross s3_valid, is_inp_sample;
    cross s4_valid, is_inp_sample;
    cross s5_valid, is_inp_sample;

  endgroup


  covergroup cg_check_data_o_valid;
    option.per_instance = 1;
    coverpoint vif.ci_o {bins value = {[0 : 1]};}
    coverpoint is_oup_sample {bins yes = {1};}
    cross vif.ci_o, is_oup_sample;

  endgroup

  covergroup cg_match_data;
    option.per_instance = 1;

    coverpoint match_value {bins match = {1};}

    coverpoint is_oup_sample {bins yes = {1};}

    cross match_value, is_oup_sample;

  endgroup





  bit ci;
  function new(virtual interface mrelbp_ci_r2_if vif);
    this.vif = vif;
    cg_check_data_i_valid = new();
    cg_check_data_o_valid = new();
    cg_match_data = new();
  endfunction
  task monitor();
    forever begin
      @(posedge vif.clk);
      if (~vif.rst_n) begin
        i = 0;
      end
      match_value   = 0;
      is_inp_sample = 0;
      is_oup_sample = 0;
      if (vif.done_i) i_en = 1'b1;
      if (vif.done_o == 0 && done_o_prev == 1) begin
        i_en = 1'b0;
        i = 0;
      end
      // if (!vif.rst_n) $display("time=%0t\n", $time);
      if (i_en) begin
        i++;
        is_inp_sample = 1;
        s1_valid = (vif.S1 inside {[0 : 255]}) ? 1 : 0;
        s2_valid = (vif.S2 inside {[0 : 255]}) ? 1 : 0;
        s3_valid = (vif.S3 inside {[0 : 255]}) ? 1 : 0;
        s4_valid = (vif.S4 inside {[0 : 255]}) ? 1 : 0;
        s5_valid = (vif.S5 inside {[0 : 255]}) ? 1 : 0;
        cg_check_data_i_valid.sample();
        window[0][0] <= vif.S1;
        window[0][1] <= vif.S2;
        window[0][2] <= vif.S3;
        window[0][3] <= vif.S4;
        window[0][4] <= vif.S5;

        window[1][0] <= window[0][0];
        window[1][1] <= window[0][1];
        window[1][2] <= window[0][2];
        window[1][3] <= window[0][3];
        window[1][4] <= window[0][4];

        window[2][0] <= window[1][0];
        window[2][1] <= window[1][1];
        window[2][2] <= window[1][2];
        window[2][3] <= window[1][3];
        window[2][4] <= window[1][4];

        window[3][0] <= window[2][0];
        window[3][1] <= window[2][1];
        window[3][2] <= window[2][2];
        window[3][3] <= window[2][3];
        window[3][4] <= window[2][4];

        window[4][0] <= window[3][0];
        window[4][1] <= window[3][1];
        window[4][2] <= window[3][2];
        window[4][3] <= window[3][3];
        window[4][4] <= window[3][4];
        if (i > 5) begin
          ci = ci_calc(window);
          //   $display("ci value: %0d\n", ci);
          ci_fifo.push_back(ci);
        end
        // if (i > 20) $finish;




      end

      if (vif.done_o) begin
        is_oup_sample = 1'b1;
        done_o_prev <= vif.done_o;
        cg_check_data_o_valid.sample();
        if (ci_fifo.size() > 0) begin
          if (vif.ci_o == ci_fifo[0]) begin
            match_value = 1;
          end else begin
            // $display("ci value mismatch: expected %0d, got %0d - MATCH VALUE %d", ci_fifo[0],
            //  vif.ci_o, match_value);
          end
          ci_fifo.pop_front();
        end
        cg_match_data.sample();

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

    $display("CI r2 Coverage Input:   %0.2f%%", cov_i);
    $display("CI r2 Coverage Output:  %0.2f%%", cov_o);
    $display("CI r2 Coverage Match:   %0.2f%%", cov_match);
    $display("=====================================");
    $display("CI r2 Average Module Coverage: %0.2f%%", avg_cov);
  endfunction

  function logic [7:0] ci_calc(logic [7:0] window[0:4][0:4]);
    int unsigned sum = 0;
    logic [7:0] center;
    int unsigned avg;

    foreach (window[i, j]) begin
      sum += window[i][j];
    end

    center = window[2][2];

    if ((center * 25) < sum) return 0;
    return 1;
  endfunction





endclass
