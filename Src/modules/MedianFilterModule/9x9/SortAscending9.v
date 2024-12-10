module SortAscending9 (
    input clk,
    input rst,
    input done_i,
    output done_o,
    input [7:0] S1,
    S2,
    S3,
    S4,
    S5,
    S6,
    S7,
    S8,
    S9,
    output [7:0] min,
    out2,
    out3,
    out4,
    mid,
    out6,
    out7,
    out8,
    max
);
  // a b c d e f g
  // S1 S2 S3 S4 S5 S6 S7

  // sort 5 first values S1 S2 S3 S4 S5
  wire [7:0] sa1_min, sa1_out2, sa1_out3, sa1_mid, sa1_out5, sa1_out6, sa1_max;
  wire sa1_done_o;
  SortAscending7 SA1 (
      .clk(clk),
      .rst(rst),
      .done_i(done_i),
      .done_o(sa1_done_o),
      .S1(S1),
      .S2(S2),
      .S3(S3),
      .S4(S4),
      .S5(S5),
      .S6(S6),
      .S7(S7),
      .min(sa1_min),
      .out2(sa1_out2),
      .out3(sa1_out3),
      .mid(sa1_mid),
      .out5(sa1_out5),
      .out6(sa1_out6),
      .max(sa1_max)
  );
  reg [7:0] p1_S8[0:9], p1_S9[0:9];
  integer i;

  always @(posedge clk) begin
    if (rst) begin
      for (i = 0; i < 10; i = i + 1) begin
        p1_S8[i] <= 0;
        p1_S9[i] <= 0;
      end

    end else begin
      for (i = 0; i < 10; i = i + 1) begin
        p1_S8[i] <= (i == 0) ? S8 : p1_S8[i-1];
        p1_S9[i] <= (i == 0) ? S9 : p1_S9[i-1];
      end
    end
  end

  reg [7:0] p1_S8_o, p1_S9_o;
  reg [7:0] p1_sa1_min, p1_sa1_out2, p1_sa1_out3, p1_sa1_mid, p1_sa1_out5, p1_sa1_out6, p1_sa1_max;
  reg p1_done_o;
  always @(posedge clk) begin
    if (rst) begin
      p1_S8_o <= 0;
      p1_S9_o <= 0;
      p1_sa1_min <= 0;
      p1_sa1_out2 <= 0;
      p1_sa1_out3 <= 0;
      p1_sa1_mid <= 0;
      p1_sa1_out5 <= 0;
      p1_sa1_out6 <= 0;
      p1_sa1_max <= 0;
      p1_done_o <= 0;
    end else begin
      p1_S8_o <= p1_S8[9];
      p1_S9_o <= p1_S9[9];
      p1_sa1_min <= sa1_min;
      p1_sa1_out2 <= sa1_out2;
      p1_sa1_out3 <= sa1_out3;
      p1_sa1_mid <= sa1_mid;
      p1_sa1_out5 <= sa1_out5;
      p1_sa1_out6 <= sa1_out6;
      p1_sa1_max <= sa1_max;
      p1_done_o <= sa1_done_o;
    end
  end


  wire [7:0] sa2_min, sa2_out2, sa2_out3, sa2_mid, sa2_out5, sa2_out6, sa2_max;
  // sort 5 last values S5 S6 sa1_max, sa1_out4, sa1_mid

  reg [7:0] sa1_min_delay[0:9], sa1_out2_delay[0:9];
  always @(posedge clk) begin
    if (rst) begin
      for (i = 0; i < 10; i = i + 1) begin
        sa1_min_delay[i]  <= 0;
        sa1_out2_delay[i] <= 0;
      end

    end else begin
      for (i = 0; i < 10; i = i + 1) begin
        sa1_min_delay[i]  <= (i == 0) ? p1_sa1_min : sa1_min_delay[i-1];
        sa1_out2_delay[i] <= (i == 0) ? p1_sa1_out2 : sa1_out2_delay[i-1];
      end
    end
  end
  wire sa2_done_o;

  SortAscending7 SA2 (
      .clk(clk),
      .rst(rst),
      .done_i(p1_done_o),
      .done_o(sa2_done_o),
      .S1(p1_S8_o),
      .S2(p1_S9_o),
      .S3(p1_sa1_max),
      .S4(p1_sa1_out6),
      .S5(p1_sa1_out5),
      .S6(p1_sa1_mid),
      .S7(p1_sa1_out3),
      .min(sa2_min),
      .out2(sa2_out2),
      .out3(sa2_out3),
      .mid(sa2_mid),
      .out5(sa2_out5),
      .out6(sa2_out6),
      .max(sa2_max)
  );

  reg [7:0] p2_sa1_min, p2_sa1_out2;
  reg [7:0] p2_sa2_min, p2_sa2_out2, p2_sa2_out3, p2_sa2_mid, p2_sa2_out5, p2_sa2_out6, p2_sa2_max;
  reg p2_done_o;
  always @(posedge clk) begin
    if (rst) begin
      p2_sa1_min  <= 0;
      p2_sa1_out2 <= 0;
      p2_sa2_min  <= 0;
      p2_sa2_out2 <= 0;
      p2_sa2_out3 <= 0;
      p2_sa2_mid  <= 0;
      p2_sa2_out5 <= 0;
      p2_sa2_out6 <= 0;
      p2_sa2_max  <= 0;
      p2_done_o   <= 0;
    end else begin
      p2_sa1_min  <= sa1_min_delay[9];
      p2_sa1_out2 <= sa1_out2_delay[9];
      p2_sa2_min  <= sa2_min;
      p2_sa2_out2 <= sa2_out2;
      p2_sa2_out3 <= sa2_out3;
      p2_sa2_mid  <= sa2_mid;
      p2_sa2_out5 <= sa2_out5;
      p2_sa2_out6 <= sa2_out6;
      p2_sa2_max  <= sa2_max;
      p2_done_o   <= sa2_done_o;

    end
  end

  wire [7:0] sn1_max, sn1_med, sn1_min;
  Sorting_network SN1 (
      .S1 (p2_sa1_min),
      .S2 (p2_sa1_out2),
      .S3 (p2_sa2_min),
      .max(sn1_max),
      .med(sn1_med),
      .min(sn1_min)
  );

  reg p3_done_o;
  reg [7:0] p3_sa2_out2, p3_sa2_out3, p3_sa2_mid, p3_sa2_out5, p3_sa2_out6, p3_sa2_max;
  reg [7:0] p3_sn1_max, p3_sn1_med, p3_sn1_min;

  always @(posedge clk) begin
    if (rst) begin
      p3_done_o   <= 0;
      p3_sa2_out2 <= 0;
      p3_sa2_out3 <= 0;
      p3_sa2_mid  <= 0;
      p3_sa2_out5 <= 0;
      p3_sa2_out6 <= 0;
      p3_sa2_max  <= 0;
      p3_sn1_max  <= 0;
      p3_sn1_med  <= 0;
      p3_sn1_min  <= 0;
    end else begin
      p3_done_o   <= p2_done_o;
      p3_sa2_out2 <= p2_sa2_out2;
      p3_sa2_out3 <= p2_sa2_out3;
      p3_sa2_mid  <= p2_sa2_mid;
      p3_sa2_out5 <= p2_sa2_out5;
      p3_sa2_out6 <= p2_sa2_out6;
      p3_sa2_max  <= p2_sa2_max;
      p3_sn1_max  <= sn1_max;
      p3_sn1_med  <= sn1_med;
      p3_sn1_min  <= sn1_min;
    end
  end

  wire [7:0] sn2_max, sn2_med, sn2_min;
  Sorting_network SN2 (
      .S1 (p3_sn1_med),
      .S2 (p3_sn1_max),
      .S3 (p3_sa2_out2),
      .max(sn2_max),
      .med(sn2_med),
      .min(sn2_min)
  );
  reg p4_done_o;
  reg [7:0] p4_sa2_out3, p4_sa2_mid, p4_sa2_out5, p4_sa2_out6, p4_sa2_max;
  reg [7:0] p4_sn2_max, p4_sn2_med, p4_sn2_min;
  reg [7:0] p4_sn1_min;

  always @(posedge clk) begin
    if (rst) begin
      p4_done_o   <= 0;
      p4_sa2_out3 <= 0;
      p4_sa2_mid  <= 0;
      p4_sa2_out5 <= 0;
      p4_sa2_out6 <= 0;
      p4_sa2_max  <= 0;
      p4_sn2_max  <= 0;
      p4_sn2_med  <= 0;
      p4_sn2_min  <= 0;
      p4_sn1_min  <= 0;
    end else begin
      p4_done_o   <= p3_done_o;
      p4_sa2_out3 <= p3_sa2_out3;
      p4_sa2_mid  <= p3_sa2_mid;
      p4_sa2_out5 <= p3_sa2_out5;
      p4_sa2_out6 <= p3_sa2_out6;
      p4_sa2_max  <= p3_sa2_max;
      p4_sn2_max  <= sn2_max;
      p4_sn2_med  <= sn2_med;
      p4_sn2_min  <= sn2_min;
      p4_sn1_min  <= p3_sn1_min;
    end
  end

  Sorting_network SN3 (
      .S1 (p4_sn1_min),
      .S2 (p4_sn2_med),
      .S3 (p4_sn2_min),
      .max(out3),
      .med(out2),
      .min(min)
  );
  assign out4 = p4_sn2_max;
  assign mid = p4_sa2_out3;
  assign out6 = p4_sa2_mid;
  assign out7 = p4_sa2_out5;
  assign out8 = p4_sa2_out6;
  assign max = p4_sa2_max;
  assign done_o = p4_done_o;



endmodule
