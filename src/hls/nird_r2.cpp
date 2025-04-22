#include "nird_r2.h"

template void nird<5>(stream_pixel_t &, stream_pixel_t &, stream_pixel_t &, stream_pixel_t &);
template void nird<9>(stream_pixel_t &, stream_pixel_t &, stream_pixel_t &, stream_pixel_t &);
template void nird<13>(stream_pixel_t &, stream_pixel_t &, stream_pixel_t &, stream_pixel_t &);

uint8_t checkU2(uint8_t pixel)
{
    uint8_t transitions = 0;

    for (int i = 0; i < 8; i++)
    {
        uint8_t current_bit = (pixel >> i) & 1;
        uint8_t next_bit = (pixel >> ((i + 1) % 8)) & 1;

        if (current_bit != next_bit)
        {
            transitions++;
        }
    }

    return transitions;
}
uint8_t getSumPixel(uint8_t pixel)
{
    uint8_t sum = 0;
    for (int i = 0; i < 8; i++)
    {
        sum += (pixel >> i) & 1;
    }
    return sum;
}

uint8_t riu2(uint8_t pixel)
{
    uint8_t transition = checkU2(pixel);
    return transition > 2 ? 9 : getSumPixel(pixel);
}
float convertToFixedPoint(uint32_t value, int frac_bits = 16)
{
    int integer_part = (value >> 16) & 0xFF;
    int fractional_part = value & 0xFFFF;
    return integer_part + (fractional_part / (float)(1 << frac_bits));
}

uint32_t getinterpolation_r_phi(pixel_t A, pixel_t B, pixel_t C, pixel_t D, int r, int phi)
{
#pragma HLS INLINE

    //	std::cout << std::hex << (int)A <<  " " << (int)B << " " << (int)C << " " <<(int)D <<  std::endl;

    static const uint32_t lookup_table[7][4][4] = {
        {{0x0003E1D, 0x00057D8, 0x0002BEC, 0x0003E1D},
         {0x0002BEC, 0x0003E1D, 0x0003E1D, 0x00057D8},
         {0x0003E1D, 0x0002BEC, 0x00057D8, 0x0003E1D},
         {0x00057D8, 0x0003E1D, 0x0003E1D, 0x0002BEC}},

        {{0x0001B4A, 0x000C5A6, 0x00003C4, 0x0001B4A},
         {0x00003C4, 0x0001B4A, 0x0001B4A, 0x000C5A6},
         {0x0001B4A, 0x00003C4, 0x000C5A6, 0x0001B4A},
         {0x000C5A6, 0x0001B4A, 0x0001B4A, 0x00003C4}},

        {{0x002463, 0x000789, 0x00AFB0, 0x002463},
         {0x00AFB0, 0x002463, 0x002463, 0x000789},
         {0x002463, 0x00AFB0, 0x000789, 0x002463},
         {0x000789, 0x002463, 0x002463, 0x00AFB0}},

        {{0x0003FAD, 0x0003739, 0x000496B, 0x0003FAD},
         {0x000496B, 0x0003FAD, 0x0003FAD, 0x0003739},
         {0x0003FAD, 0x000496B, 0x0003739, 0x0003FAD},
         {0x0003739, 0x0003FAD, 0x0003FAD, 0x000496B}},

        {{0x0002F0B, 0x00092D6, 0x0000F12, 0x0002F0B},
         {0x0000F12, 0x0002F0B, 0x0002F0B, 0x00092D6},
         {0x0002F0B, 0x0000F12, 0x00092D6, 0x0002F0B},
         {0x00092D6, 0x0002F0B, 0x0002F0B, 0x0000F12}},

        {{0x0000C37, 0x00000A5, 0x000E6EA, 0x0000C37},
         {0x000E6EA, 0x0000C37, 0x0000C37, 0x00000A5},
         {0x0000C37, 0x000E6EA, 0x00000A5, 0x0000C37},
         {0x00000A5, 0x0000C37, 0x0000C37, 0x000E6EA}},

        {{0x00039B3, 0x0001E24, 0x0006E73, 0x00039B3},
         {0x0006E73, 0x00039B3, 0x00039B3, 0x0001E24},
         {0x00039B3, 0x0006E73, 0x0001E24, 0x00039B3},
         {0x0001E24, 0x00039B3, 0x00039B3, 0x0006E73}}};

    int phi_index = (phi / 90) % 4;
    int r_index = r - 2;

    if (r_index < 0 || r_index >= 7)
        return 0;

    uint32_t r1 = lookup_table[r_index][phi_index][0];
    uint32_t r2 = lookup_table[r_index][phi_index][1];
    uint32_t r3 = lookup_table[r_index][phi_index][2];
    uint32_t r4 = lookup_table[r_index][phi_index][3];

    //	std::cout << std::hex << (int)r1 <<  " " << (int)r2<< " " << (int)r3<< " " <<(int)r4<<  std::endl;

    uint64_t interpolated_value =
        (uint32_t)A * r1 +
        (uint32_t)B * r2 +
        (uint32_t)C * r3 +
        (uint32_t)D * r4;

    return (uint32_t)(interpolated_value);
}
template <int N>
void getDescriptors(hls::Window<N, N, unsigned char> input, uint32_t output[8], int r)
{

#pragma HLS INLINE

    if (r == 1)
    {
        uint8_t val = input.getval(1, 2);

        output[0] = uint32_t(input.getval(2, 3)) << 16;
        output[2] = uint32_t(val) << 16;
        output[4] = uint32_t(input.getval(2, 1)) << 16;
        output[6] = uint32_t(input.getval(3, 2)) << 16;
        output[1] = uint32_t(input.getval(1, 3)) << 16;
        output[3] = uint32_t(input.getval(1, 1)) << 16;
        output[5] = uint32_t(input.getval(3, 1)) << 16;
        output[7] = uint32_t(input.getval(3, 3)) << 16;
    }
    else
    {
        int cen = N / 2;
        output[0] = uint32_t(input.getval(cen, cen + r)) << 16;
        output[2] = uint32_t(input.getval(cen - r, cen)) << 16;
        output[4] = uint32_t(input.getval(cen, cen - r)) << 16;
        output[6] = uint32_t(input.getval(cen + r, cen)) << 16;
        int r_ = r;
        //		if(r_ == 4){
        //			r_ = 3;
        //		}
        //		if(r_ = 5){
        //			r_ = 4;
        //		}
        if (r_ >= 4)
        {
            r_ = r - 1;
        }
        output[1] = getinterpolation_r_phi(input.getval(cen - r_, cen + (r_ - 1)), input.getval(cen - r_, cen + r_),
                                           input.getval(cen - r_ + 1, cen + (r_ - 1)), input.getval(cen - r_ + 1, cen + r_), r, 45);

        output[3] = getinterpolation_r_phi(input.getval(cen - r_, cen - r_), input.getval(cen - r_, cen - r_ + 1),
                                           input.getval(cen - r_ + 1, cen - r_), input.getval(cen - r_ + 1, cen - r_ + 1), r, 135);

        output[5] = getinterpolation_r_phi(input.getval(cen + r_ - 1, cen - r_), input.getval(cen + r_ - 1, cen - r_ + 1),
                                           input.getval(cen + r_, cen - r_), input.getval(cen + r_, cen - r_ + 1), r, 225);

        output[7] = getinterpolation_r_phi(input.getval(cen + r_ - 1, cen + r_ - 1), input.getval(cen + r_ - 1, cen + r_),
                                           input.getval(cen + r_, cen + r_ - 1), input.getval(cen + r_, cen + r_), r, 315);
    }
}
template <int N>
void nird(stream_pixel_t &stream_r1, stream_pixel_t &stream_r2, stream_pixel_t &ni, stream_pixel_t &rd)
{
    static hls::LineBuffer<N, IMAGE_WIDTH, unsigned char> lineBuffR1;
    static hls::LineBuffer<N, IMAGE_WIDTH, unsigned char> lineBuffR2;

    static hls::Window<N, N, unsigned char> windowR1;
    static hls::Window<N, N, unsigned char> windowR2;

#ifdef DEBUG
    if (N == 5)
    {
        FILE *fp = fopen("D:\\Thesis\\codetest\\python\\rd_r2_hls.txt", "w");
        fclose(fp);
        FILE *fp1 = fopen("D:\\Thesis\\codetest\\python\\ni_r2_hls.txt", "w");
        fclose(fp1);
    }
    else if (N == 9)
    {
        FILE *fp = fopen("D:\\Thesis\\codetest\\python\\rd_r4_hls.txt", "w");
        fclose(fp);
        FILE *fp1 = fopen("D:\\Thesis\\codetest\\python\\ni_r4_hls.txt", "w");
        fclose(fp1);
    }
    else if (N == 13)
    {
        FILE *fp = fopen("D:\\Thesis\\codetest\\python\\rd_r6_hls.txt", "w");
        fclose(fp);
        FILE *fp1 = fopen("D:\\Thesis\\codetest\\python\\ni_r6_hls.txt", "w");
        fclose(fp1);
    }
#endif
    uint16_t idxCol = 0;
    uint16_t idxRow = 0;
    bool readSuccess = 0;
    int soPixel = 0;
    uint16_t pixelHandled = 0;
    bool isReady = 0;

    pixel_t currentPixelR1;
    pixel_t currentPixelR2;

    for (int i = 0; i < (IMAGE_HEIGHT * IMAGE_WIDTH) + 1000 * IMAGE_WIDTH; i++)
    {
        if (idxCol < IMAGE_WIDTH)
        {

            if (!stream_r1.empty() && !stream_r2.empty())
            {
                readSuccess = 1;
                currentPixelR1 = stream_r1.read();
                currentPixelR2 = stream_r2.read();
            }
            if (readSuccess == 1)
            {
                lineBuffR1.shift_down(idxCol);
                lineBuffR1.insert_bottom(currentPixelR1, idxCol);

                lineBuffR2.shift_down(idxCol);
                lineBuffR2.insert_bottom(currentPixelR2, idxCol);
            }
        }

        //    	    	 #ifdef DEBUG
        //    	    	 if(soPixel > 0 && soPixel < 20){
        //
        //
        //    	    	         std::cout << "[DEBUG] LineBuffer Contents (Row " << idxRow << ", Col " << idxCol << "):" << std::endl;
        //    	    	         for (int row = 0; row < N; row++)
        //    	    	         {
        //    	    	             std::cout << "Row " << row << ": ";
        //    	    	             for (int col = 0; col < IMAGE_WIDTH; col++)
        //    	    	             {
        //    	    	                 std::cout << (int)lineBuffR1.getval(row, col) << " ";
        //    	    	             }
        //    	    	             std::cout << std::endl;
        //    	    	         }
        //    	    	 }
        //    	    	 #endif
        if (idxRow >= (N - 1) && idxCol >= (N - 1) && soPixel < ((IMAGE_WIDTH - N + 1) * (IMAGE_HEIGHT - N + 1)) && idxCol < IMAGE_WIDTH)
        {
            soPixel++;
            isReady = 1;
            pixel_t pixValR1 = 0;
            pixel_t pixValR2 = 0;
            for (int idxWinRow = 0; idxWinRow < N; idxWinRow++)
            {
                for (int idxWinCol = 0; idxWinCol < N; idxWinCol++)
                {

                    pixValR1 = (pixel_t)lineBuffR1.getval(N - 1 - idxWinRow, idxWinCol + pixelHandled);
                    pixValR2 = (pixel_t)lineBuffR2.getval(N - 1 - idxWinRow, idxWinCol + pixelHandled);

                    //
                    //    		    	                	     	 #ifdef DEBUG
                    //    		    	                	     	                         if( soPixel < 20){
                    //    		    	                	     	    	                     debug_log("WD 5x5", (int)pixValR1);
                    //
                    //    		    	                	     	                         }
                    // #endif
                    windowR1.insert(pixValR1, idxWinRow, idxWinCol);
                    windowR2.insert(pixValR2, idxWinRow, idxWinCol);
                }
                //    		#ifdef DEBUG
                //    		    	                 if( soPixel < 20){
                //
                //
                //
                //    		                    debug_log("end one row");
                //    		    	                 }
                //
                //    		#endif
            }
            pixelHandled++;
        }
        if (isReady == 1)
        {
            // get neighbor
            uint32_t r1_descriptor[8];
            uint32_t r2_descriptor[8];
            uint32_t sumWDR2 = 0;
            for (int i = 0; i < N; i++)
            {
                for (int j = 0; j < N; j++)
                {
                    sumWDR2 += (int)windowR2.getval(i, j);
                }
            }
            //    		std::cout << (int)  sumWDR2 << std::endl;
            int r = N / 2;
            getDescriptors<N>(windowR1, r1_descriptor, r - 1);
            getDescriptors<N>(windowR2, r2_descriptor, r);
            pixel_t sum = 0;
            for (int i = 0; i < 8; i++)
            {
                if (r2_descriptor[i] >= r1_descriptor[i])
                {
                    sum = sum + (1 << i);
                }
            }
            pixel_t ni_s = 0;
            for (int i = 0; i < 8; i++)
            {
                int scale_value = (int64_t)r2_descriptor[i] * (N * N) / (1 << 16);
                //    	    			    			 std::cout <<  (int)scale_value << std::endl;
                if (scale_value >= sumWDR2)
                {
                    ni_s = ni_s + (1 << i);
                }
            }
            //    	    			    		 std::cout << "endrow" << std::endl;
            //    		 std::cout << (int) sum << std::endl;
            pixel_t rd_res = riu2(sum);
            pixel_t ni_res = riu2(ni_s);
            ni.write(ni_res);
            rd.write(rd_res);
            //    	    			std::cout << checkU2(sum) << std::endl;

#ifdef DEBUG
            if (N == 5)
            {
                FILE *fp = fopen("D:\\Thesis\\codetest\\python\\rd_r2_hls.txt", "a");
                if (fp)
                {
                    fprintf(fp, "%d\n", (int)rd_res);
                    fclose(fp);
                }

                FILE *fp1 = fopen("D:\\Thesis\\codetest\\python\\ni_r2_hls.txt", "a");
                if (fp1)
                {
                    fprintf(fp1, "%d\n", (int)ni_res);
                    fclose(fp1);
                }
            }
            else if (N == 9)
            {
                FILE *fp = fopen("D:\\Thesis\\codetest\\python\\rd_r4_hls.txt", "a");
                if (fp)
                {
                    fprintf(fp, "%d\n", (int)rd_res);
                    fclose(fp);
                }

                FILE *fp1 = fopen("D:\\Thesis\\codetest\\python\\ni_r4_hls.txt", "a");
                if (fp1)
                {
                    fprintf(fp1, "%d\n", (int)ni_res);
                    fclose(fp1);
                }
            }
            else if (N == 13)
            {
                FILE *fp = fopen("D:\\Thesis\\codetest\\python\\rd_r6_hls.txt", "a");
                if (fp)
                {
                    fprintf(fp, "%d\n", (int)rd_res);
                    fclose(fp);
                }

                FILE *fp1 = fopen("D:\\Thesis\\codetest\\python\\ni_r6_hls.txt", "a");
                if (fp1)
                {
                    fprintf(fp1, "%d\n", (int)ni_res);
                    fclose(fp1);
                }
            }

            //    		if(soPixel == 1){
            //
            //
            //    		for(int i = 0 ; i < N; i++){
            //    			for(int j = 0 ; j < N; j++){
            //    				std::cout << std::hex << (int)windowR1.getval(i, j) << " ";
            //    			}
            //    			std::cout << std::endl;
            //
            //
            //    		}
            //    		for (int i = 0; i < 8; i++) {
            //    	    			            std::cout << "output[" << i << "] = 0x"
            //    	    			                      << std::hex << std::uppercase << std::setw(6)
            //    	    			                      << std::setfill('0') << (r1_descriptor[i] & 0xFFFFFF) << std::endl;
            //    	    			        }
            //    		std::cout << std::endl;
            //    		for (int i = 0; i < 8; i++) {
            //        	    			            std::cout << "output[" << i << "] = 0x"
            //        	    			                      << std::hex << std::uppercase << std::setw(6)
            //        	    			                      << std::setfill('0') << (r2_descriptor[i] & 0xFFFFFF) << std::endl;
            //        	    			        }
            //    		}
#endif
        }
        isReady = 0;
        if (readSuccess == 1)
        {
            if (idxCol < IMAGE_WIDTH)
            {
                idxCol++;
            }
            else
            {
                pixelHandled = 0;

                idxCol = 0;
                idxRow++;
            }
        }
    }
}
