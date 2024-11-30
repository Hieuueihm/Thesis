module SortAscending9 (
    input  [7:0] S1,
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
  SortAscending7 SA1 (
      .S1  (S1),
      .S2  (S2),
      .S3  (S3),
      .S4  (S4),
      .S5  (S5),
      .S6  (S6),
      .S7  (S7),
      .min (sa1_min),
      .out2(sa1_out2),
      .out3(sa1_out3),
      .mid (sa1_mid),
      .out5(sa1_out5),
      .out6(sa1_out6),
      .max (sa1_max)
  );
  wire [7:0] sa2_min, sa2_out2, sa2_out3, sa2_mid, sa2_out5, sa2_out6, sa2_max;
  // sort 5 last values S5 S6 sa1_max, sa1_out4, sa1_mid

  SortAscending7 SA2 (
      .S1  (S8),
      .S2  (S9),
      .S3  (sa1_max),
      .S4  (sa1_out6),
      .S5  (sa1_out5),
      .S6  (sa1_mid),
      .S7  (sa1_out3),
      .min (sa2_min),
      .out2(sa2_out2),
      .out3(mid),
      .mid (out6),
      .out5(out7),
      .out6(out8),
      .max (max)

  );

  wire [7:0] sn1_max, sn1_med, sn1_min;
  Sorting_network SN1 (
      .S1 (sa1_min),
      .S2 (sa1_out2),
      .S3 (sa2_min),
      .max(sn1_max),
      .med(sn1_med),
      .min(sn1_min)
  );
  wire [7:0] sn2_max, sn2_med, sn2_min;
  Sorting_network SN2 (
      .S1 (sn1_med),
      .S2 (sn1_max),
      .S3 (sa2_out2),
      .max(out4),
      .med(sn2_med),
      .min(sn2_min)
  );
  Sorting_network SN3 (
      .S1 (sn1_min),
      .S2 (sn2_med),
      .S3 (sn2_min),
      .max(out3),
      .med(out2),
      .min(min)
  );


endmodule
