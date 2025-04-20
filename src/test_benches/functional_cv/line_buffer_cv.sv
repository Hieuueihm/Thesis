interface line_buffer_if (
    input logic clk,
    rst_n
);

  logic done_i;
  logic [7:0] data_i;
  logic [7:0] data_o;
  logic o_valid;
  logic o_finish;
  logic o_start;

endinterface


class line_buffer_cv;

  bit [7:0] input_fifo[$];
  virtual interface line_buffer_if vif;
  bit match_flag;
  bit match_valid_and_start;


  covergroup check_data_i_valid;
    option.per_instance = 1;
    coverpoint vif.data_i {bins value = {[0 : 255]};}
  endgroup
  covergroup check_data_o_valid;
    option.per_instance = 1;
    coverpoint vif.data_o {bins value = {[0 : 255]};}
  endgroup


  covergroup match_data_i_o;
    option.per_instance = 1;
    match_cp: coverpoint match_flag {bins match = {1};}
  endgroup


  covergroup cg_start_valid;
    option.per_instance = 1;

    match_cp: coverpoint match_valid_and_start {bins match = {1};}

  endgroup




  function new(virtual interface line_buffer_if vif);
    this.vif = vif;
    check_data_i_valid = new();
    check_data_o_valid = new();
    match_data_i_o = new();
    cg_start_valid = new();
  endfunction






  task monitor();
    forever begin
      @(posedge vif.clk);
      match_flag = 0;
      match_valid_and_start = 0;
      if (!vif.rst_n) continue;
      if (vif.done_i) begin
        input_fifo.push_back(vif.data_i);
        check_data_i_valid.sample();
      end
      if (vif.o_start) begin
        if (vif.o_valid) begin
          match_valid_and_start = 1;
        end else begin
          match_valid_and_start = 0;
        end
        cg_start_valid.sample();
      end
      if (vif.o_valid) begin
        check_data_o_valid.sample();

        if (input_fifo.size() > 0) begin
          if (vif.data_o != input_fifo[0]) begin
            $display("[ERROR] Mismatch! Expect = %0d, Got = %0d", input_fifo[0], vif.data_o);
            $fatal;
          end else begin
            match_flag = 1;
          end
          match_data_i_o.sample();
          input_fifo.pop_front();
        end else begin
          $display("[WARNING] Output arrived before input tracked.");
        end

      end





    end
  endtask


  function void report();
    real cov_i, cov_o, cov_match, cov_start;
    real avg_cov;

    cov_i     = check_data_i_valid.get_coverage();
    cov_o     = check_data_o_valid.get_coverage();
    cov_match = match_data_i_o.get_coverage();
    cov_start = cg_start_valid.get_coverage();

    avg_cov   = (cov_i + cov_o + cov_match + cov_start) / 4.0;

    $display("Coverage Input:   %0.2f%%", cov_i);
    $display("Coverage Output:  %0.2f%%", cov_o);
    $display("Coverage Match:   %0.2f%%", cov_match);
    $display("Coverage Start:   %0.2f%%", cov_start);
    $display("=====================================");
    $display("Average Module Coverage: %0.2f%%", avg_cov);
  endfunction


endclass
