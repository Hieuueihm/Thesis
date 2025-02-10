`timescale 1ns/1ps

`define SIZE 128
`define WRITE_FILENAME "D:\\Thesis\\Data\\outputs\\test_output.bmp"
`define READ_FILENAME "D:\\Thesis\\Data\\Ex\\test_input.bmp"
`define OUTPUT_TEXTFILE "D://Thesis//CodeTest//python//input_image_read.txt"
`define clk_period 10
module test_top_tb_with_image();
    
    reg clk;
    reg rst;
    reg [7:0] grayscale_i;
    reg done_i;
    wire [15:0] cinird_r2;
    wire [15:0] cinird_r4;
    wire [15:0] cinird_r6;
    wire done_r6;
    wire done_r4;
    wire done_r2;
    wire finish;
    
    integer i, j;
    
    localparam BMP_ARRAY_LEN = 20000;
    reg [7 : 0] bmp_data[0 : BMP_ARRAY_LEN - 1];
    reg [7 : 0] img_out[0:`SIZE*`SIZE-1];  // Dữ liệu ảnh đầu ra
    
    integer bmp_size, bmp_start_pos, bmp_width, bmp_height, biBitCount;
    integer row_size, pixel_index;
    integer start;
    integer file_out;
    integer file_id_r2, file_id_r4, file_id_r6;
    
    task readBMP;
        integer fileId;
        begin
            fileId = $fopen(`READ_FILENAME, "rb");
            if (fileId == 0) begin
                $display("OPEN BMP Error!\n");
                $finish;
            end
            
            $fread(bmp_data, fileId);
            $fclose(fileId);
            
            bmp_size      = {bmp_data[5], bmp_data[4], bmp_data[3], bmp_data[2]};
            bmp_start_pos = {bmp_data[13], bmp_data[12], bmp_data[11], bmp_data[10]};
            bmp_width     = {bmp_data[21], bmp_data[20], bmp_data[19], bmp_data[18]};
            bmp_height    = {bmp_data[25], bmp_data[24], bmp_data[23], bmp_data[22]};
            biBitCount    = {bmp_data[29], bmp_data[28]};
            
            
            // Căn chỉnh row_size theo bội số của 4
            row_size = (bmp_width + 3) & ~3;
            $display("BMP Read Done! Width: %d, Height: %d, Start Pos: %d, Row Size: %d",
            bmp_width, bmp_height, bmp_start_pos, row_size);
            
            // �?�?c dữ liệu ảnh từ BMP theo bottom-up
            pixel_index = 0;
            for (i = 0; i < bmp_height; i = i + 1) begin
                start = bmp_start_pos + (bmp_height - 1 - i) * row_size;  // Lật ảnh
                
                for (j = 0; j < bmp_width; j = j + 1) begin
                    img_out[pixel_index] = bmp_data[start + j];  // B�? padding
                    pixel_index          = pixel_index + 1;
                end
            end
        end
    endtask
    
    initial begin
        rst         = 1'b1;
        done_i      = 1'b0;
        grayscale_i = 8'b0;
        
        file_id_r2 = $fopen("D:\\Thesis\\CodeTest\\python\\cinird_r2_verilog.txt", "w");
        file_id_r4 = $fopen("D:\\Thesis\\CodeTest\\python\\cinird_r4_verilog.txt", "w");
        file_id_r6 = $fopen("D:\\Thesis\\CodeTest\\python\\cinird_r6_verilog.txt", "w");
        
        if (file_id_r2 == 0 || file_id_r4 == 0 || file_id_r6 == 0) begin
            $display("Error: Could not open output files.");
            $finish;
        end
        
        readBMP;
        $display("BMP Read Complete!");
        
        #(`clk_period);
        rst = 1'b0;
        #(`clk_period);
        done_i = 1'b1;
        
        // Gửi dữ liệu ảnh vào thiết bị xử lý
        for (i = 0; i < bmp_width * bmp_height; i = i + 1) begin
            grayscale_i = img_out[i];
            #(`clk_period);
        end
        
        #(`clk_period);
        done_i = 1'b0;
        wait(finish);
        $fclose(file_id_r2);
        $fclose(file_id_r4);
        $fclose(file_id_r6);
        $display("Processing Complete!");
        
        file_out = $fopen(`OUTPUT_TEXTFILE, "w");
        if (file_out == 0) begin
            $display("Error opening output file!");
            $finish;
        end
        
        for (i = 0; i < bmp_width * bmp_height; i = i + 1) begin
            $fwrite(file_out, "%d\n", img_out[i]);
        end
        
        $fclose(file_out);
        $display("Image data written to file successfully!");
        
        #(`clk_period);
        $stop;
    end
    
    TopModule #(.COLS(`SIZE), .ROWS(`SIZE)) DUT
    (
    .clk(clk),
    .rst(rst),
    .grayscale_i(grayscale_i),
    .done_i(done_i),
    .cinird_r2(cinird_r2),
    .done_r2(done_r2),
    .cinird_r4(cinird_r4),
    .done_r4(done_r4),
    .cinird_r6(cinird_r6),
    .done_r6(done_r6),
    .finish(finish)
    );
    
    initial begin
        clk            = 1'b0;
        forever #5 clk = ~clk;
    end
    always @(posedge clk) begin
        if (done_r2) $fwrite(file_id_r2, "%d\n", cinird_r2);
        if (done_r4) $fwrite(file_id_r4, "%d\n", cinird_r4);
        if (done_r6) $fwrite(file_id_r6, "%d\n", cinird_r6);
    end
endmodule
