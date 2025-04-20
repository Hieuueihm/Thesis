interface zero_padding_7x7_if (
    input logic clk,
    rst_n
);
  logic done_i, done_o;
  logic [7:0] d0_i, d1_i, d2_i, d3_i, d4_i, d5_i, d6_i;
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
  logic [7:0] d25_o;
  logic [7:0] d26_o;
  logic [7:0] d27_o;
  logic [7:0] d28_o;
  logic [7:0] d29_o;
  logic [7:0] d30_o;
  logic [7:0] d31_o;
  logic [7:0] d32_o;
  logic [7:0] d33_o;
  logic [7:0] d34_o;
  logic [7:0] d35_o;
  logic [7:0] d36_o;
  logic [7:0] d37_o;
  logic [7:0] d38_o;
  logic [7:0] d39_o;
  logic [7:0] d40_o;
  logic [7:0] d41_o;
  logic [7:0] d42_o;
  logic [7:0] d43_o;
  logic [7:0] d44_o;
  logic [7:0] d45_o;
  logic [7:0] d46_o;
  logic [7:0] d47_o;
  logic [7:0] d48_o;

endinterface

class zero_padding_7x7_cv;
  virtual interface zero_padding_7x7_if vif;
  int template_id;
  bit match_value;

  logic [7:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12;
  logic [7:0] d13, d14, d15, d16, d17, d18, d19, d20, d21, d22, d23, d24;
  logic [7:0] d25, d26, d27, d28, d29, d30, d31, d32, d33, d34, d35, d36;
  logic [7:0] d37, d38, d39, d40, d41, d42, d43, d44, d45, d46, d47, d48;
  logic [7:0] dx1, dx2, dx3, dx4, dx5, dx6, dx7;



  logic i_en;


  covergroup cg_check_data_i_valid;
    option.per_instance = 1;
    coverpoint vif.d0_i {bins value = {[0 : 255]};}
    coverpoint vif.d1_i {bins value = {[0 : 255]};}
    coverpoint vif.d2_i {bins value = {[0 : 255]};}
    coverpoint vif.d3_i {bins value = {[0 : 255]};}
    coverpoint vif.d4_i {bins value = {[0 : 255]};}
    coverpoint vif.d5_i {bins value = {[0 : 255]};}
    coverpoint vif.d6_i {bins value = {[0 : 255]};}
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
    coverpoint vif.d9_o {bins value = {[0 : 255]};}
    coverpoint vif.d10_o {bins value = {[0 : 255]};}
    coverpoint vif.d11_o {bins value = {[0 : 255]};}
    coverpoint vif.d12_o {bins value = {[0 : 255]};}
    coverpoint vif.d13_o {bins value = {[0 : 255]};}
    coverpoint vif.d14_o {bins value = {[0 : 255]};}
    coverpoint vif.d15_o {bins value = {[0 : 255]};}
    coverpoint vif.d16_o {bins value = {[0 : 255]};}
    coverpoint vif.d17_o {bins value = {[0 : 255]};}
    coverpoint vif.d18_o {bins value = {[0 : 255]};}
    coverpoint vif.d19_o {bins value = {[0 : 255]};}
    coverpoint vif.d20_o {bins value = {[0 : 255]};}
    coverpoint vif.d21_o {bins value = {[0 : 255]};}
    coverpoint vif.d22_o {bins value = {[0 : 255]};}
    coverpoint vif.d23_o {bins value = {[0 : 255]};}
    coverpoint vif.d24_o {bins value = {[0 : 255]};}
    coverpoint vif.d25_o {bins value = {[0 : 255]};}
    coverpoint vif.d26_o {bins value = {[0 : 255]};}
    coverpoint vif.d27_o {bins value = {[0 : 255]};}
    coverpoint vif.d28_o {bins value = {[0 : 255]};}
    coverpoint vif.d29_o {bins value = {[0 : 255]};}
    coverpoint vif.d30_o {bins value = {[0 : 255]};}
    coverpoint vif.d31_o {bins value = {[0 : 255]};}
    coverpoint vif.d32_o {bins value = {[0 : 255]};}
    coverpoint vif.d33_o {bins value = {[0 : 255]};}
    coverpoint vif.d34_o {bins value = {[0 : 255]};}
    coverpoint vif.d35_o {bins value = {[0 : 255]};}
    coverpoint vif.d36_o {bins value = {[0 : 255]};}
    coverpoint vif.d37_o {bins value = {[0 : 255]};}
    coverpoint vif.d38_o {bins value = {[0 : 255]};}
    coverpoint vif.d39_o {bins value = {[0 : 255]};}
    coverpoint vif.d40_o {bins value = {[0 : 255]};}
    coverpoint vif.d41_o {bins value = {[0 : 255]};}
    coverpoint vif.d42_o {bins value = {[0 : 255]};}
    coverpoint vif.d43_o {bins value = {[0 : 255]};}
    coverpoint vif.d44_o {bins value = {[0 : 255]};}
    coverpoint vif.d45_o {bins value = {[0 : 255]};}
    coverpoint vif.d46_o {bins value = {[0 : 255]};}
    coverpoint vif.d47_o {bins value = {[0 : 255]};}
    coverpoint vif.d48_o {bins value = {[0 : 255]};}



  endgroup
  covergroup cg_zero_match_template;
    option.per_instance = 1;

    coverpoint template_id {bins template = {[0 : 48]};}
  endgroup

  covergroup cg_zero_match_trans_template;
    option.per_instance = 1;
    coverpoint template_id {
      bins seq_0123[] = (0 => 1 => 2 => 3);
      bins seq_33[] = (3 => 3);
      bins seq_3456[] = (3 => 4 => 5 => 6);
      bins seq_67[] = (6 => 7);
      bins seq_78910[] = (7 => 8 => 9 => 10);
      bins seq_1010[] = (10 => 10);
      bins seq_10111213[] = (10 => 11 => 12 => 13);
      bins seq_1314[] = (13 => 14);
      bins seq_14151617[] = (14 => 15 => 16 => 17);
      bins seq_1717[] = (17 => 17);
      bins seq_17181920[] = (17 => 18 => 19 => 20);
      bins seq_2021[] = (20 => 21);
      bins seq_21222324[] = (21 => 22 => 23 => 24);
      bins seq_2424[] = (24 => 24);
      bins seq_24252627[] = (24 => 25 => 26 => 27);
      bins seq_2728[] = (27 => 28);
      bins seq_28293031[] = (28 => 29 => 30 => 31);
      bins seq_3131[] = (31 => 31);
      bins seq_31323334[] = (31 => 32 => 33 => 34);
      bins seq_3435[] = (34 => 35);
      bins seq_35363738[] = (35 => 36 => 37 => 38);
      bins seq_3838[] = (38 => 38);
      bins seq_38394041[] = (38 => 39 => 40 => 41);
      bins seq_4142[] = (41 => 42);
      bins seq_42434445[] = (42 => 43 => 44 => 45);
      bins seq_4545[] = (45 => 45);
      bins seq_45464748[] = (45 => 46 => 47 => 48);





    }

  endgroup

  covergroup cg_match_value;
    option.per_instance = 1;
    coverpoint match_value {bins match = {1};}
  endgroup


  function new(virtual interface zero_padding_7x7_if vif);
    this.vif = vif;
    cg_check_data_i_valid = new();
    cg_check_data_o_valid = new();
    cg_zero_match_template = new();
    cg_zero_match_trans_template = new();
    cg_match_value = new();
  endfunction
  logic done_o_prev;

  task monitor();
    forever begin
      @(posedge vif.clk);
      match_value = 0;
      // if (!vif.rst_n) $display("time=%0t\n", $time);
      if (vif.done_i) begin
        i_en = 1;
      end
      if (done_o_prev == 1 && vif.done_o == 0) begin
        i_en = 0;
      end
      if (i_en == 1) begin
        // $display("time %d i_en = 1\n", $time);
        cg_check_data_i_valid.sample();

        dx1 <= vif.d6_i;
        dx2 <= vif.d5_i;
        dx3 <= vif.d4_i;
        dx4 <= vif.d3_i;
        dx5 <= vif.d2_i;
        dx6 <= vif.d1_i;
        dx7 <= vif.d0_i;



        d6  <= dx1;
        d13 <= dx2;
        d20 <= dx3;
        d27 <= dx4;
        d34 <= dx5;
        d41 <= dx6;
        d48 <= dx7;

        d5  <= d6;
        d4  <= d5;
        d3  <= d4;
        d2  <= d3;
        d1  <= d2;
        d0  <= d1;

        d12 <= d13;
        d11 <= d12;
        d10 <= d11;
        d9  <= d10;
        d8  <= d9;
        d7  <= d8;

        d19 <= d20;
        d18 <= d19;
        d17 <= d18;
        d16 <= d17;
        d15 <= d16;
        d14 <= d15;

        d26 <= d27;
        d25 <= d26;
        d24 <= d25;
        d23 <= d24;
        d22 <= d23;
        d21 <= d22;


        d33 <= d34;
        d32 <= d33;
        d31 <= d32;
        d30 <= d31;
        d29 <= d30;
        d28 <= d29;

        d40 <= d41;
        d39 <= d40;
        d38 <= d39;
        d37 <= d38;
        d36 <= d37;
        d35 <= d36;

        d47 <= d48;
        d46 <= d47;
        d45 <= d46;
        d44 <= d45;
        d43 <= d44;
        d42 <= d43;



      end
      if (vif.done_o) begin
        done_o_prev <= vif.done_o;

        template_id = get_template_id();

        cg_zero_match_template.sample();
        cg_check_data_o_valid.sample();
        cg_zero_match_trans_template.sample();
        if (
    d0  == vif.d0_o  &&
    d1  == vif.d1_o  &&
    d2  == vif.d2_o  &&
    d3  == vif.d3_o  &&
    d4  == vif.d4_o  &&
    d5  == vif.d5_o  &&
    d6  == vif.d6_o  &&
    d7  == vif.d7_o  &&
    d8  == vif.d8_o  &&
    d9  == vif.d9_o  &&
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
    d24 == vif.d24_o &&
    d25 == vif.d25_o &&
    d26 == vif.d26_o &&
    d27 == vif.d27_o &&
    d28 == vif.d28_o &&
    d29 == vif.d29_o &&
    d30 == vif.d30_o &&
    d31 == vif.d31_o &&
    d32 == vif.d32_o &&
    d33 == vif.d33_o &&
    d34 == vif.d34_o &&
    d35 == vif.d35_o &&
    d36 == vif.d36_o &&
    d37 == vif.d37_o &&
    d38 == vif.d38_o &&
    d39 == vif.d39_o &&
    d40 == vif.d40_o &&
    d41 == vif.d41_o &&
    d42 == vif.d42_o &&
    d43 == vif.d43_o &&
    d44 == vif.d44_o &&
    d45 == vif.d45_o &&
    d46 == vif.d46_o &&
    d47 == vif.d47_o &&
    d48 == vif.d48_o
)
begin
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

    $display("ZeroPadding 7x7 Coverage Input:   %0.2f%%", cov_i);
    $display("ZeroPadding 7x7 Coverage Output:  %0.2f%%", cov_o);
    $display("ZeroPadding 7x7 Coverage Match:   %0.2f%%", cov_match);
    $display("ZeroPadding 7x7 Coverage Trans:   %0.2f%%", cov_trans);
    $display("ZeroPadding 7x7 Coverage Match Value:   %0.2f%%", cov_match_val);
    $display("=====================================");
    $display("ZeroPadding 7x7 Average Module Coverage: %0.2f%%", avg_cov);
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
      vif.d12_o == 0 &&
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
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 0;

    // Template 6 - Center (0,8)
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
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o == 0 &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o == 0 &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 6;

    // Template 42 - Center (8,0)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o == 0 &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 42;

    // Template 48 - Center (8,8)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o == 0 &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o == 0 &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o == 0 &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 48;

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
      vif.d11_o == 0 &&
      vif.d12_o == 0 &&
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
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 1;

    // Template 5 - Center (0,7)
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
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o == 0 &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 5;

    // Template 7 - Center (1,0)
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
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 7;

    // Template 13 - Center (1,8)
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
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o == 0 &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 13;

    // Template 35 - Center (7,0)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 35;

    // Template 41 - Center (7,8)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o == 0 &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o == 0 &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 41;

    // Template 43 - Center (8,1)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o == 0 &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 43;

    // Template 47 - Center (8,7)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o == 0 &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 47;

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
      vif.d10_o == 0 &&
      vif.d11_o == 0 &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o == 0 &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o == 0 &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 2;

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
      vif.d10_o == 0 &&
      vif.d11_o == 0 &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o == 0 &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o == 0
  )
      return 4;

    // Template 14 - Center (2,0)
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
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 14;

    // Template 20 - Center (2,8)
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
      vif.d10_o inside {[0:255]} &&
      vif.d11_o == 0 &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o == 0 &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 20;

    // Template 28 - Center (6,0)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 28;

    // Template 34 - Center (6,8)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o == 0 &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o == 0 &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 34;

    // Template 44 - Center (8,2)
    if (
      vif.d0_o == 0 &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o == 0 &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 44;

    // Template 46 - Center (8,6)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o == 0 &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o == 0 &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 46;

    // Template 8 - Center (1,1)
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
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 8;

    // Template 12 - Center (1,7)
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
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 12;

    // Template 36 - Center (7,1)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 36;

    // Template 40 - Center (7,7)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 40;

    // Template 3 - Center (0,3)
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
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o == 0 &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 3;

    // Template 21 - Center (3,0)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o == 0 &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o == 0 &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o == 0 &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 21;

    // Template 27 - Center (3,8)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o == 0 &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o == 0 &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o == 0 &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 27;

    // Template 45 - Center (8,3)
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
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o == 0 &&
      vif.d31_o == 0 &&
      vif.d32_o == 0 &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 45;

    // Template 9 - Center (1,2)
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
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 9;

    // Template 11 - Center (1,6)
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
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o == 0
  )
      return 11;

    // Template 15 - Center (2,1)
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
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 15;

    // Template 19 - Center (2,7)
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
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 19;

    // Template 29 - Center (6,1)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 29;

    // Template 33 - Center (6,7)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 33;

    // Template 37 - Center (7,2)
    if (
      vif.d0_o == 0 &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 37;

    // Template 39 - Center (7,6)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o == 0 &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 39;

    // Template 10 - Center (1,3)
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
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
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
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 10;

    // Template 22 - Center (3,1)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o == 0 &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o == 0 &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o == 0 &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o == 0 &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 22;

    // Template 26 - Center (3,7)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o == 0 &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o == 0 &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o == 0 &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o == 0 &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 26;

    // Template 38 - Center (7,3)
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
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o == 0 &&
      vif.d37_o == 0 &&
      vif.d38_o == 0 &&
      vif.d39_o == 0 &&
      vif.d40_o == 0 &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 38;

    // Template 16 - Center (2,2)
    if (
      vif.d0_o == 0 &&
      vif.d1_o == 0 &&
      vif.d2_o == 0 &&
      vif.d3_o == 0 &&
      vif.d4_o == 0 &&
      vif.d5_o == 0 &&
      vif.d6_o == 0 &&
      vif.d7_o == 0 &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 16;

    // Template 18 - Center (2,6)
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
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o == 0
  )
      return 18;

    // Template 30 - Center (6,2)
    if (
      vif.d0_o == 0 &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 30;

    // Template 32 - Center (6,6)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o == 0 &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 32;

    // Template 17 - Center (2,3)
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
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 17;

    // Template 23 - Center (3,2)
    if (
      vif.d0_o == 0 &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o inside {[0:255]} &&
      vif.d7_o == 0 &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o inside {[0:255]} &&
      vif.d14_o == 0 &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o inside {[0:255]} &&
      vif.d21_o == 0 &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o == 0 &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o == 0 &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 23;

    // Template 25 - Center (3,6)
    if (
      vif.d0_o inside {[0:255]} &&
      vif.d1_o inside {[0:255]} &&
      vif.d2_o inside {[0:255]} &&
      vif.d3_o inside {[0:255]} &&
      vif.d4_o inside {[0:255]} &&
      vif.d5_o inside {[0:255]} &&
      vif.d6_o == 0 &&
      vif.d7_o inside {[0:255]} &&
      vif.d8_o inside {[0:255]} &&
      vif.d9_o inside {[0:255]} &&
      vif.d10_o inside {[0:255]} &&
      vif.d11_o inside {[0:255]} &&
      vif.d12_o inside {[0:255]} &&
      vif.d13_o == 0 &&
      vif.d14_o inside {[0:255]} &&
      vif.d15_o inside {[0:255]} &&
      vif.d16_o inside {[0:255]} &&
      vif.d17_o inside {[0:255]} &&
      vif.d18_o inside {[0:255]} &&
      vif.d19_o inside {[0:255]} &&
      vif.d20_o == 0 &&
      vif.d21_o inside {[0:255]} &&
      vif.d22_o inside {[0:255]} &&
      vif.d23_o inside {[0:255]} &&
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o == 0 &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o == 0 &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o == 0 &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o == 0
  )
      return 25;

    // Template 31 - Center (6,3)
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
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o == 0 &&
      vif.d43_o == 0 &&
      vif.d44_o == 0 &&
      vif.d45_o == 0 &&
      vif.d46_o == 0 &&
      vif.d47_o == 0 &&
      vif.d48_o == 0
  )
      return 31;

    // Template 24 - Center (3,3)
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
      vif.d24_o inside {[0:255]} &&
      vif.d25_o inside {[0:255]} &&
      vif.d26_o inside {[0:255]} &&
      vif.d27_o inside {[0:255]} &&
      vif.d28_o inside {[0:255]} &&
      vif.d29_o inside {[0:255]} &&
      vif.d30_o inside {[0:255]} &&
      vif.d31_o inside {[0:255]} &&
      vif.d32_o inside {[0:255]} &&
      vif.d33_o inside {[0:255]} &&
      vif.d34_o inside {[0:255]} &&
      vif.d35_o inside {[0:255]} &&
      vif.d36_o inside {[0:255]} &&
      vif.d37_o inside {[0:255]} &&
      vif.d38_o inside {[0:255]} &&
      vif.d39_o inside {[0:255]} &&
      vif.d40_o inside {[0:255]} &&
      vif.d41_o inside {[0:255]} &&
      vif.d42_o inside {[0:255]} &&
      vif.d43_o inside {[0:255]} &&
      vif.d44_o inside {[0:255]} &&
      vif.d45_o inside {[0:255]} &&
      vif.d46_o inside {[0:255]} &&
      vif.d47_o inside {[0:255]} &&
      vif.d48_o inside {[0:255]}
  )
      return 24;

    else return -1;
  endfunction



endclass
