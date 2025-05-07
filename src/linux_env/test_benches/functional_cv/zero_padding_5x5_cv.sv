interface zero_padding_5x5_if (
    input logic clk,
    rst_n
);
  logic done_i, done_o;
  logic [7:0] d0_i, d1_i, d2_i, d3_i, d4_i;
  logic [7:0] d0_o;
  logic [7:0] d1_o;
  logic [7:0] d2_o;
  logic [7:0] d3_o;
  logic [7:0] d4_o;
  logic [7:0] d5_o;
  logic [7:0] d6_o;
  logic [7:0] d7_o;
  logic [7:0] d8_o;
  logic [7:0] d9_o;
  logic [7:0] d10_o;
  logic [7:0] d11_o;
  logic [7:0] d12_o;
  logic [7:0] d13_o;
  logic [7:0] d14_o;
  logic [7:0] d15_o;
  logic [7:0] d16_o;
  logic [7:0] d17_o;
  logic [7:0] d18_o;
  logic [7:0] d19_o;
  logic [7:0] d20_o;
  logic [7:0] d21_o;
  logic [7:0] d22_o;
  logic [7:0] d23_o;
  logic [7:0] d24_o;
  logic [1:0] current_state;
endinterface

class zero_padding_5x5_cv;
  virtual interface zero_padding_5x5_if vif;
  int template_id;
  int match_cnt;
    int i = 0;
  logic i_en;

  logic [7:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12;
  logic [7:0] d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24;
  logic [7:0] dx1, dx2, dx3, dx4, dx5;


  covergroup cg_check_data_i_valid @(posedge vif.clk);
    option.per_instance = 1;
    d0_cp: coverpoint vif.d0_i {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d1_cp: coverpoint vif.d1_i {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d2_cp: coverpoint vif.d2_i {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d3_cp: coverpoint vif.d3_i {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d4_cp: coverpoint vif.d4_i {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}

    done_i_cp: coverpoint i_en {bins value = {1};}
    cross d0_cp, done_i_cp;
    cross d1_cp, done_i_cp;
    cross d2_cp, done_i_cp;
    cross d3_cp, done_i_cp;
    cross d4_cp, done_i_cp;
  endgroup

  covergroup cg_check_data_o_valid @(posedge vif.clk);
    option.per_instance = 1;
    d0_cp: coverpoint vif.d0_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d1_cp: coverpoint vif.d1_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d2_cp: coverpoint vif.d2_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d3_cp: coverpoint vif.d3_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d4_cp: coverpoint vif.d4_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d5_cp: coverpoint vif.d5_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d6_cp: coverpoint vif.d6_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d7_cp: coverpoint vif.d7_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d8_cp: coverpoint vif.d8_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d9_cp: coverpoint vif.d9_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d10_cp: coverpoint vif.d10_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d11_cp: coverpoint vif.d11_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d12_cp: coverpoint vif.d12_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d13_cp: coverpoint vif.d13_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d14_cp: coverpoint vif.d14_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d15_cp: coverpoint vif.d15_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d16_cp: coverpoint vif.d16_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d17_cp: coverpoint vif.d17_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d18_cp: coverpoint vif.d18_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d19_cp: coverpoint vif.d19_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d20_cp: coverpoint vif.d20_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d21_cp: coverpoint vif.d21_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d22_cp: coverpoint vif.d22_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d23_cp: coverpoint vif.d23_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}
    d24_cp: coverpoint vif.d24_o {bins all_values[] = {
    [0:31], [32:63], [64:95], [96:127],
    [128:159], [160:191], [192:223], [224:255]
};}

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
    cross d9_cp, done_o_cp;
    cross d10_cp, done_o_cp;
    cross d11_cp, done_o_cp;
    cross d12_cp, done_o_cp;
    cross d13_cp, done_o_cp;
    cross d14_cp, done_o_cp;
    cross d15_cp, done_o_cp;
    cross d16_cp, done_o_cp;
    cross d17_cp, done_o_cp;
    cross d18_cp, done_o_cp;
    cross d19_cp, done_o_cp;
    cross d20_cp, done_o_cp;
    cross d21_cp, done_o_cp;
    cross d22_cp, done_o_cp;
    cross d23_cp, done_o_cp;
    cross d24_cp, done_o_cp;


  endgroup
  covergroup cg_zero_match_template;
    option.per_instance = 1;

    coverpoint template_id {bins template[] = {[0 : 24]};}
  endgroup

  covergroup cg_zero_match_trans_template;
    option.per_instance = 1;
    coverpoint template_id {
      bins seq_012[] = (0 => 1 => 2);
      bins seq_22[] = (2 => 2);
      bins seq_234[] = (2 => 3 => 4);
      bins seq_45[] = (4 => 5);
      bins seq_567[] = (5 => 6 => 7);
      bins seq_77[] = (7 => 7);
      bins seq_789[] = (7 => 8 => 9);
      bins seq_910[] = (9 => 10);
      bins seq_101112[] = (10 => 11 => 12);
      bins seq_1212[] = (12 => 12);
      bins seq_121314[] = (12 => 13 => 14);
      bins seq_1415[] = (14 => 15);
      bins seq_151617[] = (15 => 16 => 17);
      bins seq_1717[] = (17 => 17);
      bins seq_171819[] = (17 => 18 => 19);
      bins seq_1920[] = (19 => 20);
      bins seq_202122[] = (20 => 21 => 22);
      bins seq_2222[] = (22 => 22);
      bins seq_222324[] = (22 => 23 => 24);


    }

  endgroup
  covergroup cg_fsm_check @(posedge vif.clk);
    option.per_instance = 1;
    coverpoint vif.current_state {
      bins state_00[] = (0 => 0);
      bins state_01[] = (0 => 1);
      bins state_11[] = (1 => 1);
      bins state_12[] = (1 => 2);
      bins state_22[] = (2 => 2);
      bins state_230[] = (2 => 3 => 0);
    }

  endgroup
  covergroup cg_match_value;
    option.per_instance = 1;
    coverpoint match_cnt {bins match[] = {[0 : (128*128 - 1) - 6 * 128]};}
  endgroup


  function new(virtual interface zero_padding_5x5_if vif);
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
        match_cnt = 0;
      end
      if (vif.done_i) begin
        i_en = 1;
      end
      if (done_o_prev == 1 && vif.done_o == 0) begin
        match_cnt = 0;
        i_en = 0;
      end
      if (i_en == 1) begin
        dx1 <= vif.d4_i;
        dx2 <= vif.d3_i;
        dx3 <= vif.d2_i;
        dx4 <= vif.d1_i;
        dx5 <= vif.d0_i;



        d4  <= dx1;
        d9  <= dx2;
        d14 <= dx3;
        d19 <= dx4;
        d24 <= dx5;

        d3  <= d4;
        d2  <= d3;
        d1  <= d2;
        d0  <= d1;

        d8  <= d9;
        d7  <= d8;
        d6  <= d7;
        d5  <= d6;

        d13 <= d14;
        d12 <= d13;
        d11 <= d12;
        d10 <= d11;

        d18 <= d19;
        d17 <= d18;
        d16 <= d17;
        d15 <= d16;

        d23 <= d24;
        d22 <= d23;
        d21 <= d22;
        d20 <= d21;
        // if (i < 3) begin
        //   $display(" inp %d %d %d %d %d\n", vif.d4_i, vif.d3_i, vif.d2_i, vif.d1_i, vif.d0_i);
        // end

      end
      if (vif.done_o) begin
        done_o_prev <= vif.done_o;

        template_id = get_template_id();
        cg_zero_match_template.sample();
        cg_zero_match_trans_template.sample();
        // if (i < 3) begin
        //   i++;
        //   $display(" match %d %d %d %d %d\n", d4, d9, d14, d19, d24);
        // end


        if (
        d0 == vif.d0_o &&
        d1 == vif.d1_o &&
        d2 == vif.d2_o &&
        d3 == vif.d3_o &&
        d4 == vif.d4_o &&
        d5 == vif.d5_o &&
        d6 == vif.d6_o &&
        d7 == vif.d7_o &&
        d8 == vif.d8_o &&
        d9 == vif.d9_o &&
        d10 == vif.d10_o &&
        d11 == vif.d11_o &&
        d12 == vif.d12_o &&
        d13 == vif.d13_o &&
        d14 == vif.d14_o &&
        d15 == vif.d15_o &&
        d16 == vif.d16_o &&
        d17 == vif.d17_o &&
        d18 == vif.d18_o &&
        d19 == vif.d19_o &&
        d20 == vif.d20_o &&
        d21 == vif.d21_o &&
        d22 == vif.d22_o &&
        d23 == vif.d23_o &&
        d24 == vif.d24_o
        ) begin
          match_cnt++;
        end
        cg_match_value.sample();


      end
    end
  endtask
  function real report();
    real cov_i, cov_o, cov_match, cov_trans, cov_match_val, cov_fsm;
    real avg_cov;

    cov_i = cg_check_data_i_valid.get_coverage();
    cov_o = cg_check_data_o_valid.get_coverage();
    cov_match = cg_zero_match_template.get_coverage();
    cov_trans = cg_zero_match_trans_template.get_coverage();
    cov_match_val = cg_match_value.get_coverage();
    cov_fsm = cg_fsm_check.get_coverage();
    avg_cov = (cov_i + cov_o + cov_match + cov_trans + cov_match_val + cov_fsm) / 6.0;
    $display("======================================================");

    $display("ZeroPadding 5x5 Coverage Input:   %0.2f%%", cov_i);
    $display("ZeroPadding 5x5 Coverage Output:  %0.2f%%", cov_o);
    $display("ZeroPadding 5x5 Coverage Match:   %0.2f%%", cov_match);
    $display("ZeroPadding 5x5 Coverage Trans:   %0.2f%%", cov_trans);
    $display("ZeroPadding 5x5 Coverage Match Value:   %0.2f%%", cov_match_val);
    $display("ZeroPadding 5x5 Coverage FSM:   %0.2f%%", cov_fsm);
    $display("======================================================");
    $display("ZeroPadding 5x5 Average Module Coverage: %0.2f%%", avg_cov);
    $display("======================================================");

    return avg_cov;
  endfunction

  function int get_template_id();
    // Template 0 - Center (0,0)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o == 0 &&
      vif.d11_o == 0 &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]}
  )
      return 0;

    // Template 4 - Center (0,6)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 4;

    // Template 20 - Center (6,0)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o == 0 &&
      vif.d11_o == 0 &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o == 0 &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 20;

    // Template 24 - Center (6,6)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o == 0 &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 24;

    // Template 1 - Center (0,1)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o == 0 &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]}
  )
      return 1;

    // Template 3 - Center (0,5)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o == 0 &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o == 0
  )
      return 3;

    // Template 5 - Center (1,0)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o == 0 &&
      vif.d11_o == 0 &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]}
  )
      return 5;

    // Template 9 - Center (1,6)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 9;

    // Template 15 - Center (5,0)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o == 0 &&
      vif.d11_o == 0 &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 15;

    // Template 19 - Center (5,6)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 19;

    // Template 21 - Center (6,1)
    if (
      vif.d0_o == 0 &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o == 0 &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o == 0 &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o == 0 &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 21;

    // Template 23 - Center (6,5)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o == 0 &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o == 0 &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 23;

    // Template 2 - Center (0,2)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]}
  )
      return 2;

    // Template 10 - Center (2,0)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o == 0 &&
      vif.d11_o == 0 &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]}
  )
      return 10;

    // Template 14 - Center (2,6)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 14;

    // Template 22 - Center (6,2)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o == 0 &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 22;

    // Template 6 - Center (1,1)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o == 0 &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]}
  )
      return 6;

    // Template 8 - Center (1,5)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o == 0 &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o == 0
  )
      return 8;

    // Template 16 - Center (5,1)
    if (
      vif.d0_o == 0 &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o == 0 &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o == 0 &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 16;

    // Template 18 - Center (5,5)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o == 0 &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 18;

    // Template 7 - Center (1,2)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]}
  )
      return 7;

    // Template 11 - Center (2,1)
    if (
      vif.d0_o == 0 &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o == 0 &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o == 0 &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o == 0 &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]}
  )
      return 11;

    // Template 13 - Center (2,5)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o == 0 &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o == 0 &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o == 0
  )
      return 13;

    // Template 17 - Center (5,2)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o == 0
  )
      return 17;

    // Template 12 - Center (2,2)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]}
  )
      return 12;

    else return -1;
  endfunction




endclass
