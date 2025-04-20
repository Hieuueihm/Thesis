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
  bit match_value;
  logic [7:0] median_fifo[$];
  logic [7:0] m;

  covergroup cg_check_data_i_valid;
    option.per_instance = 1;
    coverpoint vif.S1 {bins value = {[0 : 255]};}
    coverpoint vif.S2 {bins value = {[0 : 255]};}
    coverpoint vif.S3 {bins value = {[0 : 255]};}
    coverpoint vif.S4 {bins value = {[0 : 255]};}
    coverpoint vif.S5 {bins value = {[0 : 255]};}
    coverpoint vif.S6 {bins value = {[0 : 255]};}
    coverpoint vif.S7 {bins value = {[0 : 255]};}
    coverpoint vif.S8 {bins value = {[0 : 255]};}
    coverpoint vif.S9 {bins value = {[0 : 255]};}
  endgroup

  covergroup cg_check_data_o_valid;
    option.per_instance = 1;
    coverpoint vif.median_o {bins value = {[0 : 255]};}

  endgroup
  covergroup cg_match_data;
    option.per_instance = 1;
    coverpoint match_value {bins match = {1};}
  endgroup





  function new(virtual interface median_calc_3x3_if vif);
    this.vif = vif;
    cg_check_data_i_valid = new();
    cg_check_data_o_valid = new();
    cg_match_data = new();
  endfunction
  task monitor();
    forever begin
      @(posedge vif.clk);
      match_value = 0;
      // if (!vif.rst_n) $display("time=%0t\n", $time);
      if (vif.done_i) begin
        cg_check_data_i_valid.sample();
        m = calculate_median(vif.S1, vif.S2, vif.S3, vif.S4, vif.S5, vif.S6, vif.S7, vif.S8,
                             vif.S9);

        median_fifo.push_back(m);
      end
      if (vif.done_o) begin
        cg_check_data_o_valid.sample();
        if (median_fifo.size() > 0) begin
          if (vif.median_o == median_fifo[0]) begin
            match_value = 1;
            cg_match_data.sample();
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

    $display("MedianCalc 3x3 Coverage Input:   %0.2f%%", cov_i);
    $display("MedianCalc 3x3 Coverage Output:  %0.2f%%", cov_o);
    $display("MedianCalc 3x3 Coverage Match:   %0.2f%%", cov_match);
    $display("=====================================");
    $display("MedianCalc 3x3 Average Module Coverage: %0.2f%%", avg_cov);
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
