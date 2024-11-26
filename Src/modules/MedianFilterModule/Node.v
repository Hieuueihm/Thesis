// File: Node.v
module Node (
    input  [7:0] A,
    input  [7:0] B,
    output [7:0] min_o,
    output [7:0] max_o
);

  assign min_o = (A < B) ? A : B;

  assign max_o = (A > B) ? A : B;

endmodule
