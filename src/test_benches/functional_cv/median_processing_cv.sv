class median_processing_cov;

  bit       done_i;
  bit [7:0] data_i,     data_o;
  bit       done_3x3_o, done_5x5_o, done_7x7_o;
  bit [7:0] m_3x3_o,    m_5x5_o,    m_7x7_o;
  bit       done_o;

  // Covergroup
  covergroup cg_median_processing @(posedge done_i);

    // Đánh giá các loại giá trị đầu vào
    cp_input_value: coverpoint data_i {
      bins low = {[0 : 63]};
      bins mid = {[64 : 127]};
      bins high = {[128 : 255]};
      bins corners = {0, 255};
    }

    // Đánh giá việc kích hoạt các output done flags
    cp_done_flags: coverpoint {
      done_3x3_o, done_5x5_o, done_7x7_o
    } {
      bins only_3x3 = (3'b100);
      bins only_5x5 = (3'b010);
      bins only_7x7 = (3'b001);
      bins all_done = (3'b111);
      bins none_done = (3'b000);
    }

    // Đánh giá giá trị đầu ra median
    cp_median_3x3: coverpoint m_3x3_o {
      bins low = {[0 : 63]}; bins mid = {[64 : 127]}; bins high = {[128 : 255]};
    }

    cp_median_5x5: coverpoint m_5x5_o {
      bins low = {[0 : 63]}; bins mid = {[64 : 127]}; bins high = {[128 : 255]};
    }

    cp_median_7x7: coverpoint m_7x7_o {
      bins low = {[0 : 63]}; bins mid = {[64 : 127]}; bins high = {[128 : 255]};
    }

  endgroup

  // Constructor
  function new();
    cg_median_processing = new();
  endfunction

  // Hàm sample từ testbench
  function void sample_signals(input bit i_done_i, input bit [7:0] i_data_i, input bit i_done_3x3_o,
                               input bit i_done_5x5_o, input bit i_done_7x7_o,
                               input bit [7:0] i_m_3x3_o, input bit [7:0] i_m_5x5_o,
                               input bit [7:0] i_m_7x7_o);
    done_i     = i_done_i;
    data_i     = i_data_i;
    done_3x3_o = i_done_3x3_o;
    done_5x5_o = i_done_5x5_o;
    done_7x7_o = i_done_7x7_o;
    m_3x3_o    = i_m_3x3_o;
    m_5x5_o    = i_m_5x5_o;
    m_7x7_o    = i_m_7x7_o;
    cg_median_processing.sample();
  endfunction

endclass
