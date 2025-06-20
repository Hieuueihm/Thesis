interface nird_r2_if (
    input logic clk,
    rst_n
);
  logic [7:0] data_r1;
  logic [7:0] data_r2;
  logic r1_valid;
  logic r2_valid;
  logic [3:0] ni_o;
  logic [3:0] rd_o;
  logic done_o;
  logic progress_done_o;




endinterface


class nird_r2_cv;
  virtual interface nird_r2_if vif;
  logic i_en;


  covergroup cg_check_data_i_valid @(posedge vif.clk);
    option.per_instance = 1;
    S1_cp: coverpoint vif.data_r1 {bins all_values[] = {[0 : 255]};}
    S2_cp: coverpoint vif.data_r2 {bins all_values[] = {[0 : 255]};}
    done_i_cp: coverpoint i_en {bins value = {1};}
    cross S1_cp, done_i_cp;
    cross S2_cp, done_i_cp;
  endgroup

  covergroup cg_check_data_o_valid @(posedge vif.clk);
    option.per_instance = 1;
    ni_o_cp: coverpoint vif.ni_o {bins all_values[] = {[0 : 9]};}
    rd_o_cp: coverpoint vif.rd_o {bins all_values[] = {[0 : 9]};}
    done_o_cp: coverpoint vif.done_o {bins value = {1};}
    cross done_o_cp, ni_o_cp;
    cross done_o_cp, rd_o_cp;

  endgroup


  covergroup cg_check_finish @(posedge vif.clk);
    option.per_instance = 1;

    done_o_cp: coverpoint vif.done_o {bins value_10[] = (1 => 0);}
    pd_o_cp: coverpoint vif.progress_done_o {bins value_01[] = (0 => 1);}

    cross done_o_cp, pd_o_cp;
  endgroup









  function new(virtual interface nird_r2_if vif);
    this.vif = vif;
    cg_check_data_i_valid = new();
    cg_check_data_o_valid = new();
    cg_check_finish = new();
  endfunction
  task monitor();

    forever begin
      @(posedge vif.clk);
      if (vif.r1_valid) i_en = 1;
      if (vif.progress_done_o) i_en = 0;




    end
  endtask
  function real report(string r);
    real cov_i, cov_sig, cov_o;
    real avg_cov;

    cov_i   = cg_check_data_i_valid.get_coverage();
    cov_sig = cg_check_finish.get_coverage();
    cov_o   = cg_check_data_o_valid.get_coverage();
    avg_cov = (cov_i + cov_sig + cov_o) / 3.0;

    $display("======================================================");

    $display("NIRD %s Coverage Input:   %0.2f%%", r, cov_i);
    $display("NIRD %s Coverage Signal:   %0.2f%%", r, cov_sig);
    $display("NIRD %s Coverage Output:   %0.2f%%", r, cov_o);
    $display("======================================================");
    $display("NIRD %s Average Module Coverage: %0.2f%%", r, avg_cov);
    $display("======================================================");

    return avg_cov;

  endfunction







endclass
