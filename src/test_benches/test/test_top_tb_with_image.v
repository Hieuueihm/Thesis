`timescale 1ns / 1ps

`define SIZE 128

`define WRITE_FILENAME "D:\\Thesis\\data\\outputs\\test_output.bmp"

`define READ_FILENAME "D:\\Thesis\\data\\inputs\\test_input.bmp"

`define OUTPUT_TEXTFILE "D:\\Thesis\\codetest\\python\\input_image_read.txt"

`define clk_period 10

`define half_clk_period 5


module test_top_tb_with_image ();

  reg clk;
  reg rst_n;
  reg [7:0] grayscale_i;
  reg i_valid;
  reg start_i;
  reg i_data_ready;

  wire [31:0] histogram_o;
  wire o_valid;
  wire o_intr;
  wire o_data_ready;

  integer i, j;

  localparam BMP_ARRAY_LEN = 20000;
  reg [7 : 0] bmp_data[0 : BMP_ARRAY_LEN - 1];
  reg [7 : 0] img_out[0:`SIZE*`SIZE-1];  // Dữ liệu ảnh đầu ra


  integer bmp_size, bmp_start_pos, bmp_width, bmp_height, biBitCount;
  integer row_size, pixel_index;
  integer start;
  integer file_out;

  task readBMP;
    integer fileId;
    integer fileId1;
    begin
      fileId = $fopen(`READ_FILENAME, "rb");
      if (fileId == 0) begin
        $display("OPEN BMP Error!\n");
        $finish;
      end
      fileId1 = $fopen("D:\\Thesis\\codetest\\python\\img_data_origin", "w");

      $fread(bmp_data, fileId);
      $fclose(fileId);

      bmp_size      = {bmp_data[5], bmp_data[4], bmp_data[3], bmp_data[2]};
      bmp_start_pos = {bmp_data[13], bmp_data[12], bmp_data[11], bmp_data[10]};
      bmp_width     = {bmp_data[21], bmp_data[20], bmp_data[19], bmp_data[18]};
      bmp_height    = {bmp_data[25], bmp_data[24], bmp_data[23], bmp_data[22]};
      biBitCount    = {bmp_data[29], bmp_data[28]};


      // Căn chỉnh row_size theo bội số của 4

      row_size      = (bmp_width + 3) & ~3;
      $display("BMP Read Done! Width: %d, Height: %d, Start Pos: %d, Row Size: %d", bmp_width,
               bmp_height, bmp_start_pos, row_size);

      // �?�?c dữ liệu ảnh từ BMP theo bottom-up

      for (i = 0; i < 128 * 128 + bmp_start_pos; i = i + 1) begin
        $fwrite(fileId1, "%d\n", bmp_data[i]);
      end
      $fclose(fileId1);
      pixel_index = 0;
      for (i = 0; i < bmp_height; i = i + 1) begin
        start = bmp_start_pos + (bmp_height - 1 - i) * row_size;  // Lật ảnh


        for (j = 0; j < bmp_width; j = j + 1) begin
          img_out[pixel_index] = bmp_data[start+j];  // B�? padding

          pixel_index          = pixel_index + 1;
        end
      end
    end
  endtask
  task writeBMPtoText;
    integer file_txt;
    integer k;
    begin
      file_txt = $fopen("D:\\Thesis\\codetest\\python\\inputbmp.txt",
                        "w");  // Mở file ở chế độ ghi


      if (file_txt == 0) begin
        $display("Error opening output.txt for writing!");
        $finish;
      end

      // Ghi toàn bộ dữ liệu BMP vào file (bao gồm header và pixel)

      for (k = 0; k < bmp_start_pos; k = k + 1) begin
        $fwrite(file_txt, "%02x\n", bmp_data[k]);  // Ghi từng byte dưới dạng hex

      end
      for (k = bmp_start_pos; k < bmp_size; k = k + 1) begin
        $fwrite(file_txt, "%02x\n",
                img_out[k-bmp_start_pos]);  // Ghi từng byte dưới dạng hex

      end

      $fclose(file_txt);
      $display("BMP data written to output.txt successfully!");
    end
  endtask
  integer file_out_1;
  initial begin
    rst_n        = 1'b0;
    start_i      = 1'b0;
    i_valid      = 1'b0;
    grayscale_i  = 8'b0;
    i_data_ready = 1'b0;

    file_out     = $fopen("D:\\Thesis\\codetest\\python\\histogram_verilog.txt", "w");

    if (file_out == 0) begin
      $display("Error: Could not open output files.");
      $finish;
    end

    readBMP;
    writeBMPtoText;
    $display("BMP Read Complete!");

    #(`clk_period * 3);
    rst_n = 1'b1;
    #(`clk_period);
    start_i <= 1'b1;
    i_data_ready <= 1'b1;
    #(`clk_period);
    start_i <= 1'b0;
    #(`clk_period * 5);
    i_valid <= 1'b1;
    // Gửi dữ liệu ảnh vào thiết bị xử lý

    for (i = 0; i < bmp_width * bmp_height; i = i + 1) begin
      grayscale_i <= img_out[i];
      #(`clk_period);
    end
    i_valid <= 1'b0;
    @(posedge o_intr);

    #(`clk_period * 10);


    #(`clk_period);
    start_i <= 1'b1;
    #(`clk_period);
    start_i <= 1'b0;
    #(`clk_period * 5);
    i_valid <= 1'b1;

    // Gửi dữ liệu ảnh vào thiết bị xử lý

    for (i = 0; i < bmp_width * bmp_height; i = i + 1) begin
      grayscale_i <= img_out[i];
      #(`clk_period);
    end
    i_valid <= 1'b0;
    @(posedge o_intr);
    $fclose(file_out);
    $display("Processing Complete!");
    #100;

    $stop;
  end

  top_module #(
      .COLS(`SIZE),
      .ROWS(`SIZE)
  ) DUT (
      .clk(clk),
      .rst_n(rst_n),
      .grayscale_i(grayscale_i),
      .i_valid(i_valid),
      .o_data_ready(o_data_ready),
      .start_i(start_i),
      .histogram_o(histogram_o),
      .o_valid(o_valid),
      .i_data_ready(i_data_ready),
      .o_intr(o_intr)
  );

  initial begin
    clk = 1'b0;
  end
  always #(`half_clk_period) clk = ~clk;

  always @(posedge clk or negedge rst_n) begin
    if (o_valid) begin
      $fwrite(file_out, "%d\n", histogram_o);
      $fflush(file_out);
    end
  end
endmodule
