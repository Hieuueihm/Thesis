module Joint_histogram_datapath(input clk,
                                input rst,
                                input ci_i,
                                input done_i,
                                input [3:0] ni_i,
                                input [3:0] rd_i,
                                input count_en,
                                input read_en,
                                output [15:0] cinird_o,
                                output reg done_read);
    wire [7:0] ci_scale;
    assign ci_scale = (ci_i << 6) + (ci_i << 5) + (ci_i << 2);
    wire [7:0] ni_scale;
    assign ni_scale = (ni_i << 3) + (ni_i << 1);
    reg [7:0] ci_delay, ni_delay, rd_delay;
    always @(posedge clk) begin
        if (rst) begin
            ci_delay <= 0;
            ni_delay <= 0;
            rd_delay <= 0;
            end else if (done_i) begin
            ci_delay <= ci_scale;
            ni_delay <= ni_scale;
            rd_delay <= {4'b0, rd_i};
        end
    end
    wire done_delay;
    dff #(.WIDTH(1)) DONE_I_DELAY (
    .clk(clk),
    .rst(rst),
    .en(1'b1),
    .D(done_i),
    .Q(done_delay)
    );
    wire [7:0] counter_value;
    
    assign counter_value = ci_delay + ni_delay + rd_delay;
    
    reg [15:0] register_array [0:199];
    integer i;
    reg [15:0] output_value;
    reg [7:0] read_index;
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < 200; i = i + 1) begin
                register_array[i] <= 0;
            end
            output_value <= 0;
            read_index   <= 0;
            done_read    <= 0;
            end else if (count_en && done_delay) begin
            register_array[counter_value] <= register_array[counter_value] + 1;
            end else if (read_en) begin
            output_value <= register_array[read_index];
            read_index   <= read_index + 1;
            if (read_index > 198) begin
                done_read <= 1'b1;
                end else begin
                done_read <= 1'b0;
            end
            end else  begin
            output_value <= 0;
            done_read    <= 0;
        end
    end
    assign cinird_o = output_value;
    
    integer file;
    always @(posedge clk) begin
        if (rst) begin
            file = $fopen("D:\\Thesis\\CodeTest\\python\\ci_ni_rd_data.txt", "w");
            end else if (done_i) begin
            if (file) begin
                $fwrite(file, "(%d, %d, %d)\n", ci_i, ni_i, rd_i);
            end
            end else if (read_index == 200) begin
            $fclose(file);
        end
    end
    
endmodule
