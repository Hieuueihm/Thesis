module top_module__datapath #(
    parameter COLS = 128,
    parameter ROWS = 128
) (
    input clk,
    input rst_n,
    input [7:0] grayscale_i,
    input i_valid,
    input read_en,
    input start_i,
    output [31:0] histogram_o,
    output reg read_finish,
    output reg o_valid,
    output finish,
    output start_en
);
  wire start_i_negedge;
  reg  start_i_prev;
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      start_i_prev <= 0;
    end else begin
      start_i_prev <= start_i;
    end
  end
  assign start_i_negedge = (start_i_prev == 1 & start_i == 0);
  assign start_en = start_i_negedge;






  wire [15:0] cinird_r2, cinird_r4, cinird_r6;
  wire r2_valid, r4_valid, r6_valid;




  wire [7:0] data_original_o;
  wire done_original_o;
  wire [7:0] m_3x3_o;
  wire done_m_3x3_o;
  wire [7:0] m_5x5_o;
  wire done_m_5x5_o;
  wire [7:0] m_7x7_o;
  wire done_m_7x7_o;
  median_processing #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) median_PROCESSING (
      .clk(clk),
      .rst_n(rst_n),
      .data_i(grayscale_i),
      .done_i(i_valid),
      .data_o(data_original_o),
      .done_o(done_original_o),
      .m_3x3_o(m_3x3_o),
      .done_3x3_o(done_m_3x3_o),
      .m_5x5_o(m_5x5_o),
      .done_5x5_o(done_m_5x5_o),
      .m_7x7_o(m_7x7_o),
      .done_7x7_o(done_m_7x7_o)
  );



  wire ci_r2_o, done_ci_r2, progress_done_ci_r2;
  wire ci_r4_o, done_ci_r4, progress_done_ci_r4;
  wire ci_r6_o, done_ci_r6, progress_done_ci_r6;
  reg read_r2_en, read_r4_en, read_r6_en;

  ci_top #(
      .ROWS(ROWS),
      .COLS(COLS)
  ) ci_top (
      .clk(clk),
      .rst_n(rst_n),
      .m_3x3_i(m_3x3_o),
      .done_i(done_m_3x3_o),
      .ci_r2_o(ci_r2_o),
      .done_r2(done_ci_r2),
      .progress_done_r2(progress_done_ci_r2),
      .ci_r4_o(ci_r4_o),
      .done_r4(done_ci_r4),
      .progress_done_r4(progress_done_ci_r4),
      .ci_r6_o(ci_r6_o),
      .done_r6(done_ci_r6),
      .progress_done_r6(progress_done_ci_r6)
  );



  wire [3:0] ni_r2_o, rd_r2_o;
  wire done_r2_nird;
  r2_nird #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) r2_ni_rd (
      .clk(clk),
      .rst_n(rst_n),
      .m_3x3_i(m_3x3_o),
      .done_m_3x3_i(done_m_3x3_o),
      .data_original_i(data_original_o),
      .done_original_i(done_original_o),
      .ni_o(ni_r2_o),
      .rd_o(rd_r2_o),
      .done_o(done_r2_nird),
      .progress_done_o(finish)
  );

  wire ci_r2_delay;
  wire done_ci_r2_delay;

  `define CYCLE_SHIFT_CI_r2 7



  shift_registers #(
      .WIDTH(1),
      .CYCLE(`CYCLE_SHIFT_CI_r2)
  ) SHIFT_CI_r2 (
      .clk(clk),
      .rst_n(rst_n),
      .data_i(ci_r2_o),
      .data_o(ci_r2_delay)
  );

  shift_registers #(
      .WIDTH(1),
      .CYCLE(`CYCLE_SHIFT_CI_r2)
  ) SHIFT_DONE_CI_r2 (
      .clk(clk),
      .rst_n(rst_n),
      .data_i(done_ci_r2),
      .data_o(done_ci_r2_delay)
  );


  wire r2_finish;

  joint_histogram joint_r2 (
      .clk(clk),
      .rst_n(rst_n),
      .ci_i(ci_r2_delay),
      .ni_i(ni_r2_o),
      .rd_i(rd_r2_o),
      .done_i(done_r2_nird),
      .read_en(read_r2_en),
      .cinird_o(cinird_r2),
      .done_o(r2_valid),
      .finish(r2_finish)
  );


  wire [3:0] ni_r4_o, rd_r4_o;
  wire done_r4_nird, progress_done_r4_nird;
  r4_nird #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) r4_ni_rd (
      .clk(clk),
      .rst_n(rst_n),
      .m_3x3_i(m_3x3_o),
      .done_m_3x3_i(done_m_3x3_o),
      .m_5x5_i(m_5x5_o),
      .done_m_5x5_i(done_m_5x5_o),
      .ni_o(ni_r4_o),
      .rd_o(rd_r4_o),
      .done_o(done_r4_nird),
      .progress_done_o(progress_done_r4_nird)
  );

  wire ci_r4_delay;
  wire done_ci_r4_delay;

  `define CYCLE_SHIFT_CI_r4 17



  shift_registers #(
      .WIDTH(1),
      .CYCLE(`CYCLE_SHIFT_CI_r4)
  ) SHIFT_CI_r4 (
      .clk(clk),
      .rst_n(rst_n),
      .data_i(ci_r4_o),
      .data_o(ci_r4_delay)
  );

  shift_registers #(
      .WIDTH(1),
      .CYCLE(`CYCLE_SHIFT_CI_r4)
  ) SHIFT_DONE_CI_r4 (
      .clk(clk),
      .rst_n(rst_n),
      .data_i(done_ci_r4),
      .data_o(done_ci_r4_delay)
  );

  wire r4_finish;
  joint_histogram joint_r4 (
      .clk(clk),
      .rst_n(rst_n),
      .ci_i(ci_r4_delay),
      .ni_i(ni_r4_o),
      .rd_i(rd_r4_o),
      .done_i(done_r4_nird),
      .read_en(read_r4_en),
      .cinird_o(cinird_r4),
      .done_o(r4_valid),
      .finish(r4_finish)
  );



  wire [3:0] ni_r6_o, rd_r6_o;
  wire done_r6_nird, progress_done_r6_nird;
  r6_nird #(
      .COLS(COLS),
      .ROWS(ROWS)
  ) r6_ni_rd (
      .clk(clk),
      .rst_n(rst_n),
      .m_5x5_i(m_5x5_o),
      .done_m_5x5_i(done_m_5x5_o),
      .m_7x7_i(m_7x7_o),
      .done_m_7x7_i(done_m_7x7_o),
      .rd_o(rd_r6_o),
      .ni_o(ni_r6_o),
      .done_o(done_r6_nird),
      .progress_done_o(progress_done_r6_nird)
  );

  wire ci_r6_delay;
  wire done_ci_r6_delay;

  `define CYCLE_SHIFT_CI_r6 39



  shift_registers #(
      .WIDTH(1),
      .CYCLE(`CYCLE_SHIFT_CI_r6)
  ) SHIFT_CI_r6 (
      .clk(clk),
      .rst_n(rst_n),
      .data_i(ci_r6_o),
      .data_o(ci_r6_delay)
  );

  shift_registers #(
      .WIDTH(1),
      .CYCLE(`CYCLE_SHIFT_CI_r6)
  ) SHIFT_DONE_CI_r6 (
      .clk(clk),
      .rst_n(rst_n),
      .data_i(done_ci_r6),
      .data_o(done_ci_r6_delay)
  );



  wire r6_finish;

  joint_histogram joint_r6 (
      .clk(clk),
      .rst_n(rst_n),
      .ci_i(ci_r6_delay),
      .ni_i(ni_r6_o),
      .rd_i(rd_r6_o),
      .done_i(done_r6_nird),
      .read_en(read_r6_en),
      .cinird_o(cinird_r6),
      .done_o(r6_valid),
      .finish(r6_finish)
  );

  reg [15:0] data_out;
  // reg [ 2:0] read_stage;



  reg [ 1:0] read_stage;
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) read_stage <= 2'b00;
    else if (read_en) begin
      case (read_stage)
        2'b00: begin
          if (r2_finish == 1'b1) read_stage <= 2'b01;
        end
        2'b01: begin
          if (r4_finish == 1'b1) read_stage <= 2'b10;
        end
        2'b10: begin
          if (r6_finish == 1'b1) read_stage <= 2'b11;
        end
        2'b11: begin
          read_stage <= 2'b00;
        end
        default: begin
          read_stage <= 2'b00;
        end
      endcase
    end
  end

  always @(*) begin
    read_r2_en  = 1'b0;
    read_r4_en  = 1'b0;
    read_r6_en  = 1'b0;
    read_finish = 1'b0;
    if (read_en) begin
      case (read_stage)
        2'b00: begin
          read_r2_en = 1'b1;
          if (r2_finish == 1'b1) begin
            read_r2_en = 1'b0;
          end
        end
        2'b01: begin
          read_r4_en = 1'b1;
          if (r4_finish == 1'b1) begin
            read_r4_en = 1'b0;
          end
        end
        2'b10: begin
          read_r6_en = 1'b1;
          if (r6_finish == 1'b1) begin
            read_r6_en = 1'b0;
          end
        end
        2'b11: begin
          read_r6_en  = 1'b0;
          read_finish = 1'b1;
        end
        default: begin
          read_r2_en = 1'b0;
          read_r4_en = 1'b0;
          read_r6_en = 1'b0;
        end
      endcase
    end else begin
      read_r2_en  = 1'b0;
      read_r4_en  = 1'b0;
      read_r6_en  = 1'b0;
      read_finish = 1'b0;
    end


  end

  // optimize after

  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      data_out <= 0;
      o_valid  <= 0;
    end else if (start_en) begin
      data_out <= 0;
      o_valid  <= 0;
    end else if (read_en) begin
      case (read_stage)
        2'b00: begin
          o_valid  <= r2_valid;
          data_out <= cinird_r2;
        end
        2'b01: begin
          o_valid  <= r4_valid;
          data_out <= cinird_r4;
        end
        2'b10: begin
          o_valid  <= r6_valid;
          data_out <= cinird_r6;
        end
        2'b11: begin
          o_valid  <= 1'b0;
          data_out <= 0;
        end
        default: begin
          o_valid  <= 1'b0;
          data_out <= 0;
        end
      endcase
    end
  end

  assign histogram_o = {16'b0, data_out};



endmodule
