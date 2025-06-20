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
  logic [2:0] current_state;

endinterface


class line_buffer_cv;

  bit [7:0] input_fifo[$];
  virtual interface line_buffer_if vif;
  int match_cnt;


  covergroup check_data_i_valid @(posedge vif.clk);
    option.per_instance = 1;
    data_i_match_all_cp: coverpoint vif.data_i {bins all_values[] = {[0:15], [16:31], [32:47], [48:63],
                                                [64:79], [80:95], [96:111], [112:127],
                                                [128:143], [144:159], [160:175], [176:191],
                                                [192:207], [208:223], [224:239], [240:255]}; }
    done_i_cp: coverpoint vif.done_i {bins value = {1};}

    cross done_i_cp, data_i_match_all_cp;
  endgroup
  covergroup check_data_o_valid @(posedge vif.clk);
    option.per_instance = 1;
    data_o_match_all_cp: coverpoint vif.data_o {bins all_values[] = {[0:15], [16:31], [32:47], [48:63],
                                                [64:79], [80:95], [96:111], [112:127],
                                                [128:143], [144:159], [160:175], [176:191],
                                                [192:207], [208:223], [224:239], [240:255]}; }
    done_o_cp: coverpoint vif.o_valid {bins value = {1};}
    cross done_o_cp, data_o_match_all_cp;

  endgroup


  covergroup match_data_i_o @(posedge vif.clk);

    match_cp: coverpoint match_cnt {bins match[] = {[0 : 128 * 128 - 1]};}

  endgroup


  covergroup cg_start_valid @(posedge vif.clk);

    option.per_instance = 1;
    match_cp: coverpoint vif.done_i {bins match = {1};}
    match_start_cp: coverpoint vif.o_start {bins match = {1};}

    cross match_cp, match_start_cp;
  endgroup

  covergroup cg_fsm_check @(posedge vif.clk);
    option.per_instance = 1;
    coverpoint vif.current_state {
      bins state_00[] = (0 => 0);
      bins state_11[] = (1 => 1);
      bins state_01[] = (0 => 1);
      bins state_12[] = (1 => 2);
      bins state_123[] = (1 => 2 => 3);
      bins state_34[] = (3 => 4);
      bins state_44[] = (4 => 4);
      bins state_450[] = (4 => 5 => 0);
    }

  endgroup




  function new(virtual interface line_buffer_if vif);
    this.vif = vif;
    check_data_i_valid = new();
    check_data_o_valid = new();
    match_data_i_o = new();
    cg_start_valid = new();
    cg_fsm_check = new();
  endfunction






  task monitor();
    forever begin
      @(posedge vif.clk);
      if (~vif.rst_n) begin
        match_cnt = 0;
      end
      if (vif.done_i) begin
        input_fifo.push_back(vif.data_i);
      end

      if (vif.o_valid) begin
        if (input_fifo.size() > 0) begin
          if (vif.data_o != input_fifo[0]) begin
            $display("[ERROR FIFO] Mismatch! Expect = %0d, Got = %0d", input_fifo[0], vif.data_o);
          end else begin
            match_cnt++;
          end
          input_fifo.pop_front();
        end else begin
          $display("[WARNING] Output arrived before input tracked.");
        end

      end
      if (vif.o_finish) begin
        match_cnt = 0;
      end





    end
  endtask


  function real report();
    real cov_i, cov_o, cov_match, cov_start, cov_fsm;
    real avg_cov;

    cov_i     = check_data_i_valid.get_coverage();
    cov_o     = check_data_o_valid.get_coverage();
    cov_match = match_data_i_o.get_coverage();
    cov_start = cg_start_valid.get_coverage();
    cov_fsm   = cg_fsm_check.get_coverage();

    avg_cov   = (cov_i + cov_o + cov_match + cov_start + cov_fsm) / 5.0;
    $display("======================================================");

    $display("Coverage Input:   %0.2f%%", cov_i);
    $display("Coverage Output:  %0.2f%%", cov_o);
    $display("Coverage Match:   %0.2f%%", cov_match);
    $display("Coverage Start:   %0.2f%%", cov_start);
    $display("Coverage FSM:     %0.2f%%", cov_fsm);
    $display("======================================================");
    $display("Average Module Coverage: %0.2f%%", avg_cov);
    $display("======================================================");

    return avg_cov;
  endfunction


endclass
