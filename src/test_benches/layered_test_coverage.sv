`timescale 1ns / 1ps
interface top_if #(
    parameter COLS = 128,
    ROWS = 128
) (
    input bit clk
);
  logic rst_n;
  logic start_i;

  // Slave
  logic [7:0] grayscale_i;
  logic i_valid;
  logic o_data_ready;

  // Master
  logic [31:0] histogram_o;
  logic o_valid;
  logic i_data_ready;

  logic o_intr;
endinterface


class transaction;
  bit [7:0] grayscale;
  bit i_valid;
  bit [31:0] histogram;
  bit o_valid;

  // Randomize grayscale & i_valid 
  // when random grayscale -> valid = 1
  //   constraint valid_c {i_valid == 1;}

  function void display(input string tag);
    $display("[%0s] : grayscale=%0d valid=%0b => hist=%0d valid=%0b", tag, grayscale, i_valid,
             histogram, o_valid);
  endfunction

  function transaction copy();
    copy = new();
    copy.grayscale = this.grayscale;
    copy.i_valid = this.i_valid;
    copy.histogram = this.histogram;
    copy.o_valid = this.o_valid;
  endfunction
endclass

class generator;
  mailbox #(transaction) mbx;
  transaction tr;
  int count;
  event wait_, done;
  int no = 0;
  int fd;
  int unsigned val;


  function new(mailbox#(transaction) mbx);
    this.mbx = mbx;
    tr = new();
  endfunction

  task run();

    repeat (count) begin
      string path;
      $display("COUNT %d:", no + 1);
      $sformat(path, "D:\\Thesis\\auto_scripts\\inputs_coverage_test\\random_matrix_%0d.txt",
               no + 1);
      fd = $fopen(path, "r");
      no++;
      for (int i = 0; i < 128 * 128; i++) begin
        void'($fscanf(fd, "%d\n", val));
        tr = new();
        tr.grayscale = val[7:0];
        tr.i_valid = 1;
        // mbx.put(tr.copy);
        // assert (tr.randomize());
        mbx.put(tr.copy);
        // tr.display("GEN");
      end
      $fclose(fd);
      @(wait_);

    end
    tr.display("GEN DONE");
    ->done;
  endtask
endclass
class driver;
  mailbox #(transaction) mbx;
  virtual top_if vif;
  transaction tr;
  event done;

  function new(mailbox#(transaction) mbx);
    this.mbx = mbx;
    tr = new();
  endfunction

  task reset();
    vif.rst_n <= 0;
    vif.start_i <= 0;
    vif.i_valid <= 0;
    vif.grayscale_i <= 0;
    repeat (5) @(posedge vif.clk);
    vif.rst_n <= 1;
    repeat (2) @(posedge vif.clk);
  endtask

  task run();
    forever begin

      vif.start_i <= 1;
      @(posedge vif.clk);
      vif.start_i <= 0;
      for (int i = 0; i < 128 * 128; i++) begin
        mbx.get(tr);
        vif.grayscale_i <= tr.grayscale;
        vif.i_valid <= tr.i_valid;  // luôn là 1
        @(posedge vif.clk);
      end
      vif.i_valid <= 0;
      @(done);
    end
  endtask
endclass





class monitor;
  virtual top_if vif;
  mailbox #(transaction) mbx;
  integer file_id;
  event done;
  int count;
  int val;
  int error;

  function new(mailbox#(transaction) mbx);
    this.mbx = mbx;
  endfunction
  string path;

  task run();
    transaction tr;
    bit [31:0] hist_bins[600];
    int idx = 0;
    forever begin
      @(posedge vif.clk);
      if (vif.o_valid) begin
        hist_bins[idx] = vif.histogram_o;
        idx++;

        if (idx == 600) begin

          tr = new();
          tr.display("MON");
          foreach (hist_bins[i])
          tr.histogram[i] = hist_bins[i];  // Assuming histogram is now an array in transaction
          tr.o_valid = 1;
          mbx.put(tr);
          $display("COUNT MON %d:", count + 1);
          $sformat(path, "D:\\Thesis\\auto_scripts\\inputs_coverage_test\\histogram_%0d.txt",
                   count + 1);
          count++;
          file_id = $fopen(path, "r");  // Mở file để ghi kết quả
          if (file_id == 0) begin
            $display("Error: Unable to open file.");
            $finish;
          end
          foreach (hist_bins[i]) begin
            void'($fscanf(file_id, "%d\n", val));
            if (val != hist_bins[i]) begin
              error++;
              $display("Error: histogram[%0d] = %0d != %0d", i, hist_bins[i], val);
              break;
            end
            //     $fwrite(file_id, "%0d\n", hist_bins[i]);
          end
          $display("same: %d\n", count);

          $fclose(file_id);
          ->done;
          idx = 0;
        end
      end
      if (vif.o_intr) begin
        tr = new();
        mbx.put(tr);
      end
    end
  endtask

endclass

// class scoreboard;
//   mailbox #(transaction) mbx;
//   event sconext;

//   function new(mailbox#(transaction) mbx);
//     this.mbx = mbx;
//   endfunction

//   task run();
//     transaction tr;
//     forever begin
//       mbx.get(tr);
//       tr.display("SCO");
//       ->sconext;
//     end
//   endtask
// endclass

class environment;
  generator gen;
  driver drv;
  monitor mon;
  //   scoreboard sco;

  event done;
  event genDone;
  int error;

  mailbox #(transaction) gdmbx, msmbx;
  virtual top_if vif;

  function new(virtual top_if vif);
    this.vif = vif;
    gdmbx = new();
    msmbx = new();
    gen = new(gdmbx);
    drv = new(gdmbx);
    mon = new(msmbx);
    // sco = new(msmbx);

    drv.vif = this.vif;
    mon.vif = this.vif;

    gen.wait_ = this.done;
    mon.done = this.done;
    drv.done = this.done;

    gen.done = this.genDone;
    mon.count = gen.no;
    mon.error = error;

  endfunction

  task pre_test();
    drv.reset();
  endtask

  task test();
    fork
      gen.run();
      drv.run();
      mon.run();
      //   sco.run();
    join_any
  endtask

  task post_test();
    wait (gen.done.triggered);
  endtask

  task run();
    pre_test();
    test();
    post_test();
  endtask
endclass



module top_module_tb ();
  logic clk = 0;
  always #5 clk = ~clk;

  top_if intf (clk);
  top_module #(
      .COLS(128),
      .ROWS(128)
  ) dut (
      .clk(clk),
      .rst_n(intf.rst_n),
      .start_i(intf.start_i),
      .grayscale_i(intf.grayscale_i),
      .i_valid(intf.i_valid),
      .o_data_ready(intf.o_data_ready),
      .histogram_o(intf.histogram_o),
      .o_valid(intf.o_valid),
      .i_data_ready(intf.i_data_ready),
      .o_intr(intf.o_intr)
  );

  environment env;
  initial begin
    env = new(intf);
    env.gen.count = 30;
    intf.i_data_ready <= 1;  // always ready to receive histogram
    env.run();
  end
endmodule
