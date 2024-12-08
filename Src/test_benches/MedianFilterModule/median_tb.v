`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11/15/2024 03:11:55 PM
// Design Name:
// Module Name: RGB2Gray_tb
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
`define clk_period 10
`define WRITE_FILENAME "D:\\Thesis\\Data\\outputs\\sample_res_5x5.bmp"
`define READ_FILENAME "D:\\Thesis\\Data\\Ex\\sample.bmp"

module median_tb ();
  // Testbench signals
  reg clk, rst, done_i;
  reg [7:0] red_i, green_i, blue_i;
  wire [7:0] green_o, blue_o, red_o;
  wire done_o;

  // Instantiate the DUT (Device Under Test) and pass the parameter
  median uut (
      .clk(clk),
      .rst(rst),
      .red_i(red_i),
      .green_i(green_i),
      .blue_i(blue_i),
      .done_i(done_i),
      .red_o(red_o),
      .green_o(green_o),
      .blue_o(blue_o),
      .done_o(done_o)
  );
  initial clk = 1'b1;
  always #(`clk_period / 2) clk = ~clk;


  integer i, j;

  localparam BMP_ARRAY_LEN = 1000000;
  reg [7 : 0] bmp_data[0 : BMP_ARRAY_LEN - 1];
  reg [7 : 0] result  [0 : BMP_ARRAY_LEN - 1];
  integer bmp_size, bmp_start_pos, bmp_width, bmp_height, biBitCount;


  // ---------- COPY to result 

  always @(posedge clk) begin
    if (rst) begin
      j <= 8'd0;
    end else begin
      if (done_o) begin
        result[j] <= blue_o;
        result[j+1] <= green_o;
        result[j+2] <= red_o;
        j <= j + 3;
      end
    end
  end


  task readBMP;
    integer fileId;
    begin
      fileId = $fopen(`READ_FILENAME, "rb");
      if (fileId == 0) begin
        $display("OPEN BMP Error!\n");
        $finish;
      end else begin
        $fread(bmp_data, fileId);
        $fclose(fileId);

        bmp_size = {bmp_data[5], bmp_data[4], bmp_data[3], bmp_data[2]};
        $display("bmp_size %d!\n", bmp_size);
        bmp_start_pos = {bmp_data[13], bmp_data[12], bmp_data[11], bmp_data[10]};
        $display("bmp_start_pos %d!\n", bmp_start_pos);

        bmp_width = {bmp_data[21], bmp_data[20], bmp_data[19], bmp_data[18]};
        $display("bmp_width  %d!\n", bmp_width);

        bmp_height = {bmp_data[25], bmp_data[24], bmp_data[23], bmp_data[22]};
        $display("bmp_height  %d!\n", bmp_height);

        biBitCount = {bmp_data[29], bmp_data[28]};
        $display("biBitCount  %d!\n", biBitCount);
        if (biBitCount != 24) begin
          $display("%s", "biBitCount need to 24 bit!\n");
          $finish;
        end

        if (bmp_width % 4) begin
          $display("%s", "bmp_width % 4 need to be zero");
          $finish;
        end

        // for (i = bmp_start_pos; i < bmp_size; i = i + 1) begin

        //   // $display("%h", bmp_data[i]);

        // end



      end
    end
  endtask


  task writeBMP;
    integer fileId;


    begin
      fileId = $fopen(`WRITE_FILENAME, "wb");

      for (i = 0; i < bmp_start_pos; i = i + 1) begin

        $fwrite(fileId, "%c", bmp_data[i]);
      end

      for (i = bmp_start_pos; i < bmp_size; i = i + 1) begin

        $fwrite(fileId, "%c", result[i-bmp_start_pos]);
      end



      $fclose(fileId);
      $display("write BMP: %s done!\n", `WRITE_FILENAME);



    end

  endtask


  initial begin

    // $display("%s", `READ_FILENAME);
    // readBMP;

    // writeBMP;

    rst    = 1'b1;
    done_i = 1'b0;

    red_i   = 8'b0;
    green_i = 8'b0;
    red_i   = 8'b0;

    readBMP;
    $display("%s", "read BMP done!");

    #(`clk_period);
    rst = 1'b0;
    #(`clk_period);


    for (i = bmp_start_pos; i < bmp_size; i = i + 3) begin
      red_i   = bmp_data[i+2];
      green_i = bmp_data[i+1];
      blue_i  = bmp_data[i];
      #(`clk_period);
      done_i = 1'b1;
    end
    #(`clk_period);
    done_i = 1'b0;
    $display("%s", "Write output ~~~\n");
    repeat (9) #(`clk_period);
    writeBMP;
    #(`clk_period);

    $stop;

    // red_i   = 8'b0000_0100;
    // green_i = 8'b0000_0010;
    // blue_i  = 8'b0001_0000;
    // done_i  = 1'b1;

    // #(`clk_period);
    // done_i = 1'b0;
    // #(`clk_period);
    // $stop;


  end
  integer file;

  initial begin
    file = $fopen("output.txt", "w");
    if (file == 0) begin
      $display("Error opening file");
      $finish;
    end
  end
  always @(posedge clk) begin
    $fdisplay(file, "output_o: %d", blue_o);
  end

endmodule
