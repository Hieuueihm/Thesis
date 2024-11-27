module SortAscending5 (
    input  [7:0] S1,
    S2,
    S3,
    S4,
    S5,
    output [7:0] min,
    out2,
    mid,
    out4,
    max
);
  wire [7:0] max1, min1, med1;
  wire [7:0] max2, min2, med2;
  wire [7:0] max3, min3, med3;
  wire [7:0] max4, min4, med4;
  Sorting_network SN1 (
      .S1 (S1),
      .S2 (S2),
      .S3 (S3),
      .max(max1),
      .med(med1),
      .min(min1)
  );
  Sorting_network SN2 (
      .S1 (max1),
      .S2 (S4),
      .S3 (S5),
      .max(max),
      .med(med2),
      .min(min2)
  );
  Sorting_network SN3 (
      .S1 (med1),
      .S2 (med2),
      .S3 (min2),
      .max(out4),
      .med(med3),
      .min(min3)
  );
  Sorting_network SN4 (
      .S1 (min1),
      .S2 (med3),
      .S3 (min3),
      .max(mid),
      .med(out2),
      .min(min)
  );



endmodule
