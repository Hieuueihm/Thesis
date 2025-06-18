interface joint_r6_if (
    input logic clk,
    rst_n
);
  logic ci_i;
  logic [3:0] ni_i;
  logic [3:0] rd_i;
  logic done_i;
  logic [15:0] cinird_o;
  logic done_o;
  logic finish;
  logic read_en;

  logic [2:0] current_state;





endinterface


class joint_r6_cv;

  string name;
  virtual interface joint_r6_if vif;


  covergroup cg_check_data_i_valid @(posedge vif.clk);
    option.per_instance = 1;
    ci_cp: coverpoint vif.ci_i {bins all_values[] = {[0 : 1]};}
    ni_cp: coverpoint vif.ni_i {bins all_values[] = {[0 : 9]};}
    rd_cp: coverpoint vif.rd_i {bins all_values[] = {[0 : 9]};}
    done_i_cp: coverpoint vif.done_i {bins value = {1};}
    cross ci_cp, done_i_cp, rd_cp, ni_cp;
  endgroup

  covergroup cg_check_data_o_valid @(posedge vif.clk);
    option.per_instance = 1;
    histogram_cp: coverpoint vif.cinird_o {bins all_values[] = {[0 : 65535]};}
    done_o_cp: coverpoint vif.done_o {bins value = {1};}
    cross done_o_cp, histogram_cp;
  endgroup

  covergroup cg_check_condition_read @(posedge vif.clk);
    option.per_instance = 1;
    read_en_cp: coverpoint vif.read_en {bins value[] = (0 => 1 => 1 => 1);}
    done_o_cp: coverpoint vif.done_o {bins value[] = (0 => 0 => 0 => 1);}
    cross read_en_cp, done_o_cp;

  endgroup

  covergroup cg_check_finish @(posedge vif.clk);
    option.per_instance = 1;
    done_o_cp: coverpoint vif.done_o {bins value_10[] = (1 => 0);}
    pd_o_cp: coverpoint vif.finish {bins value_01[] = (0 => 1);}

    cross done_o_cp, pd_o_cp;
  endgroup

  covergroup cg_check_fsm @(posedge vif.clk);
    option.per_instance = 1;

    fsm_cp: coverpoint vif.current_state {
      bins RESET = {3'b000};
      bins IDLE = {3'b001};
      bins COUNTING = {3'b010};
      bins READING = {3'b011};
      bins FINISH = {3'b100};
    }

    fsm_trans_cp: coverpoint vif.current_state {
      bins state_00 = (3'b000 => 3'b000);
      bins state_01 = (3'b000 => 3'b001);
      bins state_11 = (3'b001 => 3'b001);
      bins state_12 = (3'b001 => 3'b010);
      bins state_22 = (3'b010 => 3'b010);
      bins state_23 = (3'b010 => 3'b011);
      bins state_33 = (3'b011 => 3'b011);
      bins state_340 = (3'b011 => 3'b100 => 3'b000);
    }


  endgroup










  function new(virtual interface joint_r6_if vif, string name);
    this.vif = vif;
    cg_check_data_i_valid = new();
    cg_check_data_o_valid = new();
    cg_check_finish = new();
    cg_check_condition_read = new();
    cg_check_fsm = new();
    this.name = name;
  endfunction
  task monitor();

    forever begin
      @(posedge vif.clk);


    end
  endtask
  function real report(string r);
    real cov_i, cov_sig, cov_o, cov_cond, cov_fsm;
    real avg_cov;

    cov_i = cg_check_data_i_valid.get_coverage();
    cov_sig = cg_check_finish.get_coverage();
    cov_o = cg_check_data_o_valid.get_coverage();
    cov_cond = cg_check_condition_read.get_coverage();
    cov_fsm = cg_check_fsm.get_coverage();
    avg_cov = (cov_i + cov_sig + cov_o + cov_cond + cov_fsm) / 5.0;

    $display("======================================================");

    $display("Joint Histogram %s Coverage Input:   %0.2f%%", r, cov_i);
    $display("Joint Histogram %s Coverage Signal:   %0.2f%%", r, cov_sig);
    $display("Joint Histogram %s Coverage Output:   %0.2f%%", r, cov_o);
    $display("Joint Histogram %s Coverage Condition:   %0.2f%%", r, cov_cond);
    $display("Joint Histogram %s Coverage FSM:   %0.2f%%", r, cov_fsm);
    $display("======================================================");
    $display("Joint Histogram %s Average Module Coverage: %0.2f%%", r, avg_cov);
    $display("======================================================");

    return avg_cov;
  endfunction







endclass
