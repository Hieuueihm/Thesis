interface zero_padding_3x3_if (
    input logic clk,
    rst_n
);
  logic done_i, done_o;
  logic [7:0] d0_i, d1_i, d2_i;
  logic [7:0] d0_o, d1_o, d2_o, d3_o, d4_o, d5_o, d6_o, d7_o, d8_o;
endinterface


class zero_padding_3x3_cv;
  virtual interface zero_padding_3x3_if vif;
  int template_id;
  bit match_value;

  logic [7:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11;
  logic i_en;

  covergroup cg_check_data_i_valid;
    option.per_instance = 1;
    coverpoint vif.d0_i {bins value = {[0 : 255]};}
    coverpoint vif.d1_i {bins value = {[0 : 255]};}
    coverpoint vif.d2_i {bins value = {[0 : 255]};}
  endgroup

  covergroup cg_check_data_o_valid;
    option.per_instance = 1;
    coverpoint vif.d0_o {bins value = {[0 : 255]};}
    coverpoint vif.d1_o {bins value = {[0 : 255]};}
    coverpoint vif.d2_o {bins value = {[0 : 255]};}
    coverpoint vif.d3_o {bins value = {[0 : 255]};}
    coverpoint vif.d4_o {bins value = {[0 : 255]};}
    coverpoint vif.d5_o {bins value = {[0 : 255]};}
    coverpoint vif.d6_o {bins value = {[0 : 255]};}
    coverpoint vif.d7_o {bins value = {[0 : 255]};}
    coverpoint vif.d8_o {bins value = {[0 : 255]};}
  endgroup
  covergroup cg_zero_match_template;
    option.per_instance = 1;

    coverpoint template_id {bins template = {[0 : 8]};}
  endgroup

  covergroup cg_zero_match_trans_template;
    option.per_instance = 1;
    coverpoint template_id {
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
    coverpoint match_value {bins match = {1};}
  endgroup


  function new(virtual interface zero_padding_3x3_if vif);
    this.vif = vif;
    cg_check_data_i_valid = new();
    cg_check_data_o_valid = new();
    cg_zero_match_template = new();
    cg_zero_match_trans_template = new();
    cg_match_value = new();
  endfunction
  task monitor();
    forever begin
      @(posedge vif.clk);
      match_value = 0;
      // if (!vif.rst_n) $display("time=%0t\n", $time);
      i_en = vif.done_i | vif.done_o;
      if (i_en == 1) begin
        cg_check_data_i_valid.sample();
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

        template_id = get_template_id();

        cg_zero_match_template.sample();
        cg_check_data_o_valid.sample();
        cg_zero_match_trans_template.sample();
        if(d0 == vif.d0_o && d1 == vif.d1_o && d2 == vif.d2_o  && d3 == vif.d3_o  && d4 == vif.d4_o  && d5 == vif.d5_o  && d6 == vif.d6_o  && d7 == vif.d7_o  && d8 == vif.d8_o ) begin
          match_value = 1;
          cg_match_value.sample();


        end
      end
    end
  endtask
  function void report();
    real cov_i, cov_o, cov_match, cov_trans, cov_match_val;
    real avg_cov;

    cov_i = cg_check_data_i_valid.get_coverage();
    cov_o = cg_check_data_o_valid.get_coverage();
    cov_match = cg_zero_match_template.get_coverage();
    cov_trans = cg_zero_match_trans_template.get_coverage();
    cov_match_val = cg_match_value.get_coverage();

    avg_cov = (cov_i + cov_o + cov_match + cov_trans + cov_match_val) / 5.0;

    $display("ZeroPadding 3x3 Coverage Input:   %0.2f%%", cov_i);
    $display("ZeroPadding 3x3 Coverage Output:  %0.2f%%", cov_o);
    $display("ZeroPadding 3x3 Coverage Match:   %0.2f%%", cov_match);
    $display("ZeroPadding 3x3 Coverage Trans:   %0.2f%%", cov_trans);
    $display("ZeroPadding 3x3 Coverage Match Value:   %0.2f%%", cov_match_val);
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
