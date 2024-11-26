module Sorting_network (
    input  [7:0] S1,
    input  [7:0] S2,
    input  [7:0] S3,
    output [7:0] max,
    output [7:0] med,
    output [7:0] min
);

  wire [7:0] max1, min1;
  wire [7:0] max2, min2;
  wire [7:0] max3, min3;


  // Nodes
  Node N1 (
      .A(S2),
      .B(S1),
      .min_o(min1),
      .max_o(max1)
  );
  Node N2 (
      .A(min1),
      .B(S3),
      .min_o(min2),
      .max_o(max2)
  );

  Node N3 (
      .A(max1),
      .B(max2),
      .min_o(med),
      .max_o(max3)
  );

  assign max = max3;
  assign min = min2;



endmodule
