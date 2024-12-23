module sum_cumulative(input clk,
                      input rst,
                      input done_i,
                      input [2:0] o_select_i,
                      input [7:0] S1,
                      S2,
                      S3,
                      S4,
                      S5,
                      output [12:0] sum_o,
                      output done_o);
    
    reg [7:0] st1_S1, st1_S2, st1_S3, st1_S4, st1_S5;
    reg [7:0] st2_S1, st2_S2, st2_S3, st2_S4, st2_S5;
    reg [7:0] st3_S1, st3_S2, st3_S3, st3_S4, st3_S5;
    reg [7:0] st4_S1, st4_S2, st4_S3, st4_S4, st4_S5;
    reg [7:0] st5_S1, st5_S2, st5_S3, st5_S4, st5_S5;
    reg [7:0] st6_S1, st6_S2, st6_S3, st6_S4, st6_S5;
    
    reg done_i_d1, done_i_d2;
    
    always @(posedge clk) begin
        if (rst) begin
            done_i_d1 <= 0;
            done_i_d2 <= 0;
            end else begin
            done_i_d1 <= done_i;
            done_i_d2 <= done_i_d1;
        end
    end
    
    always @(posedge clk) begin
        if (rst) begin
            st1_S1 <= 0;
            st1_S2 <= 0;
            st1_S3 <= 0;
            st1_S4 <= 0;
            st1_S5 <= 0;
            
            st2_S1 <= 0;
            st2_S2 <= 0;
            st2_S3 <= 0;
            st2_S4 <= 0;
            st2_S5 <= 0;
            
            st3_S1 <= 0;
            st3_S2 <= 0;
            st3_S3 <= 0;
            st3_S4 <= 0;
            st3_S5 <= 0;
            
            st4_S1 <= 0;
            st4_S2 <= 0;
            st4_S3 <= 0;
            st4_S4 <= 0;
            st4_S5 <= 0;
            
            st5_S1 <= 0;
            st5_S2 <= 0;
            st5_S3 <= 0;
            st5_S4 <= 0;
            st5_S5 <= 0;
            
            st6_S1 <= 0;
            st6_S2 <= 0;
            st6_S3 <= 0;
            st6_S4 <= 0;
            st6_S5 <= 0;
            end else if (done_i) begin
            st1_S1 <= S1;
            st1_S2 <= S2;
            st1_S3 <= S3;
            st1_S4 <= S4;
            st1_S5 <= S5;
            
            st2_S1 <= st1_S1;
            st2_S2 <= st1_S2;
            st2_S3 <= st1_S3;
            st2_S4 <= st1_S4;
            st2_S5 <= st1_S5;
            
            st3_S1 <= st2_S1;
            st3_S2 <= st2_S2;
            st3_S3 <= st2_S3;
            st3_S4 <= st2_S4;
            st3_S5 <= st2_S5;
            
            st4_S1 <= st3_S1;
            st4_S2 <= st3_S2;
            st4_S3 <= st3_S3;
            st4_S4 <= st3_S4;
            st4_S5 <= st3_S5;
            
            st5_S1 <= st4_S1;
            st5_S2 <= st4_S2;
            st5_S3 <= st4_S3;
            st5_S4 <= st4_S4;
            st5_S5 <= st4_S5;
            
            
            st6_S1 <= st5_S1;
            st6_S2 <= st5_S2;
            st6_S3 <= st5_S3;
            st6_S4 <= st5_S4;
            st6_S5 <= st5_S5;
        end
    end
    
    wire [10:0] sum1, sum2, sum3, sum4, sum5, sum6;
    
    assign sum1 = (rst) ?  0 : st1_S1 + st1_S2 + st1_S3 + st1_S4 + st1_S5;
    assign sum2 = (rst) ? 0 : st2_S1 + st2_S2 + st2_S3 + st2_S4 + st2_S5;
    assign sum3 = (rst) ? 0:  st3_S1 + st3_S2 + st3_S3 + st3_S4 + st3_S5;
    assign sum4 = (rst) ? 0 : st4_S1 + st4_S2 + st4_S3 + st4_S4 + st4_S5;
    assign sum5 = (rst) ? 0 :st5_S1 + st5_S2 + st5_S3 + st5_S4 + st5_S5;
    assign sum6 = (rst) ? 0 : st6_S1 + st6_S2 + st6_S3 + st6_S4 + st6_S5;
    
    reg [12:0] sum_o_reg;
    assign done_o = (done_i_d2 == 1'b1 &&  (o_select_i > 5)) ? 1'b1 : 1'b0;
    assign sum_o  = (done_o == 1'b1) ? sum_o_reg : 8'd0;
    
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum_o_reg <= 0;
            end else if (done_i_d2) begin
            if (o_select_i == 5) begin
                sum_o_reg = sum1 + sum2 + sum3 + sum4 + sum5;
                end else if (o_select_i > 5) begin
                sum_o_reg = sum_o_reg + sum1 - sum6;
                end else begin
                sum_o_reg = 0;
            end
        end
    end
    
endmodule
