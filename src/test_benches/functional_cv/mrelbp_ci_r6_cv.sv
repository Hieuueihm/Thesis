interface mrelbp_ci_r6_if (
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
  logic ci_o;
  logic progress_done_o;
  logic [2:0] current_state;


endinterface


class mrelbp_ci_r6_cv;
  virtual interface mrelbp_ci_r6_if vif;
  logic i_en;


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
    S10_cp: coverpoint vif.S10 {bins all_values[] = {[0 : 255]};}
    S11_cp: coverpoint vif.S11 {bins all_values[] = {[0 : 255]};}

    done_i_cp: coverpoint i_en {bins value = {1};}

    cross S1_cp, done_i_cp;
    cross S2_cp, done_i_cp;
    cross S3_cp, done_i_cp;
    cross S4_cp, done_i_cp;
    cross S5_cp, done_i_cp;
    cross S6_cp, done_i_cp;
    cross S7_cp, done_i_cp;
    cross S8_cp, done_i_cp;
    cross S9_cp, done_i_cp;
    cross S10_cp, done_i_cp;
    cross S11_cp, done_i_cp;


  endgroup

  covergroup cg_fsm_check @(posedge vif.clk);
    option.per_instance = 1;
    coverpoint vif.current_state {
      bins state_00[] = (0 => 0);
      bins state_01[] = (0 => 1);
      bins state_11[] = (1 => 1);
      bins state_123[] = (1 => 2 => 3);
      bins state_34[] = (3 => 4);
      bins state_44[] = (4 => 4);
      bins state_450[] = (4 => 5 => 0);
      bins state_423[] = (4 => 2 => 3);

    }

  endgroup

  covergroup cg_check_finish @(posedge vif.clk);
    option.per_instance = 1;

    done_o_cp: coverpoint vif.done_o {bins value_10[] = (1 => 0);}
    pd_o_cp: coverpoint vif.progress_done_o {bins value_01[] = (0 => 1);}

    cross done_o_cp, pd_o_cp;
  endgroup









  function new(virtual interface mrelbp_ci_r6_if vif);
    this.vif = vif;
    cg_check_data_i_valid = new();
    cg_fsm_check = new();
    cg_check_finish = new();
  endfunction
  task monitor();

    forever begin
      @(posedge vif.clk);
      if (vif.done_i) i_en = 1;
      if (vif.progress_done_o) i_en = 0;




    end
  endtask
  function void report();
    real cov_i, cov_fsm, cov_sig;
    real avg_cov;

    cov_i   = cg_check_data_i_valid.get_coverage();
    cov_fsm = cg_fsm_check.get_coverage();
    cov_sig = cg_check_finish.get_coverage();

    avg_cov = (cov_i + cov_fsm + cov_sig) / 3.0;

    $display("CI r6 Coverage Input:   %0.2f%%", cov_i);
    $display("CI r6 Coverage FSM:   %0.2f%%", cov_fsm);
    $display("CI r6 Coverage Signal:   %0.2f%%", cov_sig);
    $display("=====================================");
    $display("CI r6 Average Module Coverage: %0.2f%%", avg_cov);
  endfunction







endclass
