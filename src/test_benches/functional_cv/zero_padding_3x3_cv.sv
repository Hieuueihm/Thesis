interface zero_padding_3x3_if (
    input logic clk,
    rst_n
);
  logic done_i, done_o;
  logic [7:0] d0_i, d1_i, d2_i;
  logic [7:0] d0_o, d1_o, d2_o, d3_o, d4_o, d5_o, d6_o, d7_o, d8_o;
  logic [1:0] current_state;
endinterface


class zero_padding_3x3_cv;
  virtual interface zero_padding_3x3_if vif;
  int template_id;
  int match_cnt;

  logic [7:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11;
  logic i_en;

  covergroup cg_check_data_i_valid @(posedge vif.clk);
    option.per_instance = 1;
    d0_cp: coverpoint vif.d0_i {bins value[] = {[0 : 255]};}
    d1_cp: coverpoint vif.d1_i {bins value[] = {[0 : 255]};}
    d2_cp: coverpoint vif.d2_i {bins value[] = {[0 : 255]};}

    en_cp: coverpoint i_en {bins value = {1};}

    cross d0_cp, en_cp;
    cross d1_cp, en_cp;
    cross d2_cp, en_cp;

  endgroup


  covergroup cg_fsm_check @(posedge vif.clk);
    option.per_instance = 1;
    coverpoint vif.current_state {
      bins state_00[] = (0 => 0);
      bins state_01[] = (0 => 1);
      // bins state_11[] = (1 => 1);
      bins state_12[] = (1 => 2);
      bins state_22[] = (2 => 2);
      bins state_230[] = (2 => 3 => 0);
    }

  endgroup

  covergroup cg_check_data_o_valid @(posedge vif.clk);
    option.per_instance = 1;
    d0_cp: coverpoint vif.d0_o {bins value[] = {[0 : 255]};}
    d1_cp: coverpoint vif.d1_o {bins value[] = {[0 : 255]};}
    d2_cp: coverpoint vif.d2_o {bins value[] = {[0 : 255]};}
    d3_cp: coverpoint vif.d3_o {bins value[] = {[0 : 255]};}
    d4_cp: coverpoint vif.d4_o {bins value[] = {[0 : 255]};}
    d5_cp: coverpoint vif.d5_o {bins value[] = {[0 : 255]};}
    d6_cp: coverpoint vif.d6_o {bins value[] = {[0 : 255]};}
    d7_cp: coverpoint vif.d7_o {bins value[] = {[0 : 255]};}
    d8_cp: coverpoint vif.d8_o {bins value[] = {[0 : 255]};}

    done_o_cp: coverpoint vif.done_o {bins value = {1};}
    cross d0_cp, done_o_cp;
    cross d1_cp, done_o_cp;
    cross d2_cp, done_o_cp;
    cross d3_cp, done_o_cp;
    cross d4_cp, done_o_cp;
    cross d5_cp, done_o_cp;
    cross d6_cp, done_o_cp;
    cross d7_cp, done_o_cp;
    cross d8_cp, done_o_cp;
  endgroup
  covergroup cg_zero_match_template @(posedge vif.clk);
    option.per_instance = 1;

    coverpoint template_id {bins template[] = {[0 : 8]};}
  endgroup

  covergroup cg_zero_match_trans_template @(posedge vif.clk);
    option.per_instance = 1;
    trans_cp: coverpoint template_id {
      bins seq_01[] = (0 => 1);
      bins seq_12[] = (1 => 2);
      bins seq_11[] = (1 => 1);
      bins seq_23[] = (2 => 3);
      bins seq_34[] = (3 => 4);
      bins seq_44[] = (4 => 4);
      bins seq_45[] = (4 => 5);
      bins seq_56[] = (5 => 6);
      bins seq_67[] = (6 => 7);
      bins seq_77[] = (7 => 7);
      bins seq_78[] = (7 => 8);
    }


  endgroup

  covergroup cg_match_value;
    option.per_instance = 1;
    coverpoint match_cnt {bins match[] = {[0 : 15999]};}
  endgroup


  function new(virtual interface zero_padding_3x3_if vif);
    this.vif = vif;
    cg_check_data_i_valid = new();
    cg_check_data_o_valid = new();
    cg_zero_match_template = new();
    cg_zero_match_trans_template = new();
    cg_match_value = new();
    cg_fsm_check = new();
  endfunction
  logic done_o_prev;
  task monitor();
    forever begin
      @(posedge vif.clk);
      if (~vif.rst_n) begin
        match_cnt   = 0;
        template_id = 0;
      end
      if (done_o_prev == 1 && vif.done_o == 0) begin
        match_cnt = 0;
      end
      i_en = vif.done_i | vif.done_o;
      if (i_en == 1) begin
        d9  <= vif.d2_i;
        d10 <= vif.d1_i;
        d11 <= vif.d0_i;
        d2  <= d9;
        d5  <= d10;
        d8  <= d11;
        d1  <= d2;
        d4  <= d5;
        d7  <= d8;
        d0  <= d1;
        d3  <= d4;
        d6  <= d7;
      end
      if (vif.done_o) begin
        done_o_prev <= vif.done_o;
        template_id = get_template_id();
        if(d0 == vif.d0_o && d1 == vif.d1_o && d2 == vif.d2_o  && d3 == vif.d3_o  && d4 == vif.d4_o  && d5 == vif.d5_o  && d6 == vif.d6_o  && d7 == vif.d7_o  && d8 == vif.d8_o ) begin
          match_cnt++;

        end
        cg_match_value.sample();

      end
    end
  endtask
  function void report();
    real cov_i, cov_o, cov_match, cov_trans, cov_match_val, cov_fsm;
    real avg_cov;

    cov_i = cg_check_data_i_valid.get_coverage();
    cov_o = cg_check_data_o_valid.get_coverage();
    cov_match = cg_zero_match_template.get_coverage();
    cov_trans = cg_zero_match_trans_template.get_coverage();
    cov_match_val = cg_match_value.get_coverage();
    cov_fsm = cg_fsm_check.get_coverage();

    avg_cov = (cov_i + cov_o + cov_match + cov_trans + cov_match_val + cov_fsm) / 6.0;

    $display("ZeroPadding 3x3 Coverage Input:   %0.2f%%", cov_i);
    $display("ZeroPadding 3x3 Coverage Output:  %0.2f%%", cov_o);
    $display("ZeroPadding 3x3 Coverage Match:   %0.2f%%", cov_match);
    $display("ZeroPadding 3x3 Coverage Trans:   %0.2f%%", cov_trans);
    $display("ZeroPadding 3x3 Coverage Match Value:   %0.2f%%", cov_match_val);
    $display("ZeroPadding 3x3 Coverage FSM:   %0.2f%%", cov_fsm);
    $display("=====================================");
    $display("ZeroPadding 3x3 Average Module Coverage: %0.2f%%", avg_cov);
  endfunction


  function int get_template_id();

    // Template 6 - Center (4,0)
    if (
    vif.d0_o == 0 &&
    vif.d1_o inside {[0:255]} &&
    vif.d2_o inside {[0:255]} &&
    vif.d3_o == 0 &&
    vif.d4_o inside {[0:255]} &&
    vif.d5_o inside {[0:255]} &&
    vif.d6_o == 0 &&
    vif.d7_o == 0 &&
    vif.d8_o == 0
)
      return 6;

    // Template 8 - Center (4,4)

    if (
    vif.d0_o inside {[0:255]} &&
    vif.d1_o inside {[0:255]} &&
    vif.d2_o == 0 &&
    vif.d3_o inside {[0:255]} &&
    vif.d4_o inside {[0:255]} &&
    vif.d5_o == 0 &&
    vif.d6_o == 0 &&
    vif.d7_o == 0 &&
    vif.d8_o == 0
)
      return 8;





    // Template 0 - Center (0,0)

    if (
    vif.d0_o == 0 &&
    vif.d1_o == 0 &&
    vif.d2_o == 0 &&
    vif.d3_o == 0 &&
    vif.d4_o inside {[0:255]} &&
    vif.d5_o inside {[0:255]} &&
    vif.d6_o == 0 &&
    vif.d7_o inside {[0:255]} &&
    vif.d8_o inside {[0:255]}
)
      return 0;




    // Template 2 - Center (0,4)

    if (
    vif.d0_o == 0 &&
    vif.d1_o == 0 &&
    vif.d2_o == 0 &&
    vif.d3_o inside {[0:255]} &&
    vif.d4_o inside {[0:255]} &&
    vif.d5_o == 0 &&
    vif.d6_o inside {[0:255]} &&
    vif.d7_o inside {[0:255]} &&
    vif.d8_o == 0
)
      return 2;
    // Template 3 - Center (1,0)
    if (
    vif.d0_o == 0 &&
    vif.d1_o inside {[0:255]} &&
    vif.d2_o inside {[0:255]} &&
    vif.d3_o == 0 &&
    vif.d4_o inside {[0:255]} &&
    vif.d5_o inside {[0:255]} &&
    vif.d6_o == 0 &&
    vif.d7_o inside {[0:255]} &&
    vif.d8_o inside {[0:255]}
)
      return 3;



    // Template 5 - Center (1,4)
    if (
    vif.d0_o inside {[0:255]} &&
    vif.d1_o inside {[0:255]} &&
    vif.d2_o == 0 &&
    vif.d3_o inside {[0:255]} &&
    vif.d4_o inside {[0:255]} &&
    vif.d5_o == 0 &&
    vif.d6_o inside {[0:255]} &&
    vif.d7_o inside {[0:255]} &&
    vif.d8_o == 0
)
      return 5;



    // Template 7 - Center (4,1)
    if (
    vif.d0_o inside {[0:255]} &&
    vif.d1_o inside {[0:255]} &&
    vif.d2_o inside {[0:255]} &&
    vif.d3_o inside {[0:255]} &&
    vif.d4_o inside {[0:255]} &&
    vif.d5_o inside {[0:255]} &&
    vif.d6_o == 0 &&
    vif.d7_o == 0 &&
    vif.d8_o == 0
)
      return 7;

    // Template 1 - Center (0,1)
    if (
    vif.d0_o == 0 &&
    vif.d1_o == 0 &&
    vif.d2_o == 0 &&
    vif.d3_o inside {[0:255]} &&
    vif.d4_o inside {[0:255]} &&
    vif.d5_o inside {[0:255]} &&
    vif.d6_o inside {[0:255]} &&
    vif.d7_o inside {[0:255]} &&
    vif.d8_o inside {[0:255]}
)
      return 1;

    // Template 4 - Center (1,1)
    if (
    vif.d0_o inside {[0:255]} &&
    vif.d1_o inside {[0:255]} &&
    vif.d2_o inside {[0:255]} &&
    vif.d3_o inside {[0:255]} &&
    vif.d4_o inside {[0:255]} &&
    vif.d5_o inside {[0:255]} &&
    vif.d6_o inside {[0:255]} &&
    vif.d7_o inside {[0:255]} &&
    vif.d8_o inside {[0:255]}
)

      return 4;

    else return -1;
  endfunction



endclass
