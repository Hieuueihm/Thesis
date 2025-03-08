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
  always @(posedge clk) begin
    if (~rst_n) begin
      start_i_prev <= 0;
    end else begin
      start_i_prev <= start_i;
    end
  end
  assign start_i_negedge = (start_i_prev == 1 & start_i == 0) ? 1'b1 : 1'b0;
  assign start_en = start_i_negedge;






  wire [15:0] cinird_r2, cinird_r4, cinird_r6;
  wire r2_valid, r4_valid, r6_valid;
  wire finish;



  wire [7:0] done_original_o, data_original_o;
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
  wire done_r2_nird, progress_done_r2_nird;
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
      .progress_done_o(progress_done_r2_nird)
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
      .progress_done_i(progress_done_r2_nird),
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
      .progress_done_i(progress_done_r4_nird),
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

  `define CYCLE_SHIFT_CI_r6 42


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





  joint_histogram joint_r6 (
      .clk(clk),
      .rst_n(rst_n),
      .ci_i(ci_r6_delay),
      .ni_i(ni_r6_o),
      .rd_i(rd_r6_o),
      .done_i(done_r6_nird),
      .progress_done_i(progress_done_r6_nird),
      .cinird_o(cinird_r6),
      .done_o(r6_valid),
      .finish(finish)
  );


  reg [7:0] write_addr_r2, write_addr_r4, write_addr_r6;
  reg [7:0] read_addr;
  (* ram_style = "block" *) reg [15:0] ram_r2[0:199];
  (* ram_style = "block" *) reg [15:0] ram_r4[0:199];
  (* ram_style = "block" *) reg [15:0] ram_r6[0:199];

  always @(posedge clk) begin
    if (~rst_n) begin
      write_addr_r2 <= 0;
      write_addr_r4 <= 0;
      write_addr_r6 <= 0;
    end else if (start_en) begin
      write_addr_r2 <= 0;
      write_addr_r4 <= 0;
      write_addr_r6 <= 0;
    end else begin
      if (r2_valid) begin
        ram_r2[write_addr_r2] <= cinird_r2;
        write_addr_r2         <= write_addr_r2 + 1;
      end
      if (r4_valid) begin
        ram_r4[write_addr_r4] <= cinird_r4;
        write_addr_r4         <= write_addr_r4 + 1;
      end
      if (r6_valid) begin
        ram_r6[write_addr_r6] <= cinird_r6;
        write_addr_r6         <= write_addr_r6 + 1;
      end
    end
  end
  reg [15:0] data_out;
  reg [ 2:0] read_stage;

  always @(posedge clk) begin
    if (~rst_n) begin
      read_addr   <= 0;
      read_stage  <= 3'b00;
      data_out    <= 0;
      o_valid     <= 0;
      read_finish <= 0;
    end else if (start_en) begin
      read_addr   <= 0;
      read_stage  <= 3'b00;
      data_out    <= 0;
      o_valid     <= 0;
      read_finish <= 0;
    end else if (read_en) begin
      case (read_stage)
        3'b000: begin
          o_valid  <= 1'b1;
          data_out <= ram_r2[read_addr];
          if (read_addr == 199) begin
            read_stage <= 3'b001;
            read_addr  <= 0;
          end else begin
            read_addr <= read_addr + 1;
          end
        end
        3'b001: begin

          o_valid  <= 1'b1;
          data_out <= ram_r4[read_addr];
          if (read_addr == 199) begin
            read_stage <= 3'b010;
            read_addr  <= 0;
          end else begin
            read_addr <= read_addr + 1;
          end
        end
        3'b010: begin
          o_valid  <= 1'b1;
          data_out <= ram_r6[read_addr];
          if (read_addr == 199) begin
            read_stage <= 3'b011;
          end else begin
            read_addr <= read_addr + 1;
          end
        end
        3'b011: begin
          o_valid     <= 1'b0;
          read_finish <= 1'b1;
          read_stage  <= 3'b100;
        end
        3'b100: begin
          read_stage  <= 3'b000;
          read_finish <= 1'b0;
        end
      endcase
    end
  end

  assign histogram_o = {16'b0, data_out};



endmodule
