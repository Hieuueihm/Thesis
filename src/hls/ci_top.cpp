#include "ci_top.h"
#include "hls_video.h"

void ci_top(stream_pixel_t &mstream3x3, stream_bit_t &ci_r2_stream, stream_bit_t &ci_r4_stream, stream_bit_t &ci_r6_stream)
{

    hls::LineBuffer<13, IMAGE_WIDTH, unsigned char> lineBuff;
    // 5, 9, 13
    hls::Window<5, 5, unsigned char> windowR2;
    hls::Window<9, 9, unsigned char> windowR4;
    hls::Window<13, 13, unsigned char> windowR6;

    int idxCol = 0;
    int idxRow = 0;

#ifdef DEBUG
    FILE *fp = fopen("D:\\Thesis\\codetest\\python\\ci_r2_hls.txt", "w");
    fclose(fp);
    FILE *fp1 = fopen("D:\\Thesis\\codetest\\python\\ci_r4_hls.txt", "w");
    fclose(fp1);
    FILE *fp2 = fopen("D:\\Thesis\\codetest\\python\\ci_r6_hls.txt", "w");
    fclose(fp2);
#endif
    int soPixel3x3 = 0;
    uint16_t pixelHandled3x3 = 0;
    bool is3x3Ready = 0;

    int soPixel5x5 = 0;
    uint16_t pixelHandled5x5 = 0;
    bool is5x5Ready = 0;

    int soPixel7x7 = 0;
    uint16_t pixelHandled7x7 = 0;
    bool is7x7Ready = 0;

    pixel_t currentPixel = 0;

    for (int i = 0; i < (IMAGE_HEIGHT * IMAGE_WIDTH) + 1000 * IMAGE_WIDTH; i++)
    {
        if (idxCol < IMAGE_WIDTH)
        {
            if (!mstream3x3.empty())
            {
                currentPixel = mstream3x3.read();
                //    	#ifdef DEBUG
                //    	                debug_log("INPUT RECEIVE: ", (int)currentPixel);
                //    	#endif
            }
            else
            {
                // #ifdef DEBUG
                //
                //	            std::cout << "[HLS] Stream is EMPTY! idxPixel = " << idxPixel << std::endl;
                //	            break;
                // #endif
            }
            lineBuff.shift_down(idxCol);
            lineBuff.insert_bottom(currentPixel, idxCol);
        }
        //
        //    	 #ifdef DEBUG
        //    	 if(soPixel5x5 >0 && soPixel5x5 < 20){
        //
        //
        //    	         std::cout << "[DEBUG] LineBuffer Contents (Row " << idxRow << ", Col " << idxCol << "):" << std::endl;
        //    	         for (int row = 0; row < 13; row++)
        //    	         {
        //    	             std::cout << "Row " << row << ": ";
        //    	             for (int col = 0; col < IMAGE_WIDTH; col++)
        //    	             {
        //    	                 std::cout << (int)lineBuff.getval(row, col) << " ";
        //    	             }
        //    	             std::cout << std::endl;
        //    	         }
        //    	 }
        //    	 #endif
        if (idxRow >= 12 && idxCol >= 4 && soPixel3x3 < ((IMAGE_WIDTH - 4) * (IMAGE_HEIGHT - 4)) && idxCol < IMAGE_WIDTH)
        {
            soPixel3x3++;
            is3x3Ready = 1;
            pixel_t pix_val;
            for (int idxWinRow = 0; idxWinRow < 5; idxWinRow++)
            {
                for (int idxWinCol = 0; idxWinCol < 5; idxWinCol++)
                {

                    pix_val = (pixel_t)lineBuff.getval(12 - idxWinRow, idxWinCol + pixelHandled3x3);

                    //    	 #ifdef DEBUG
                    //
                    //    	                     debug_log("WD 3X3", (int)pix_val);
                    //
                    //    	 #endif
                    windowR2.insert(pix_val, idxWinRow, idxWinCol);
                }
                // #ifdef DEBUG
                //
                //                     debug_log("end one row");
                //                     debug_log("pixel handlded", soPixel3x3);
                //
                // #endif
            }
            pixelHandled3x3++;
        }

        if (idxRow >= 12 && idxCol >= 8 && soPixel5x5 < ((IMAGE_WIDTH - 8) * (IMAGE_HEIGHT - 8)) && idxCol < IMAGE_WIDTH)
        {
            soPixel5x5++;
            is5x5Ready = 1;
            pixel_t pix_val;
            for (int idxWinRow = 0; idxWinRow < 9; idxWinRow++)
            {
                for (int idxWinCol = 0; idxWinCol < 9; idxWinCol++)
                {

                    pix_val = (pixel_t)lineBuff.getval(12 - idxWinRow, idxWinCol + pixelHandled5x5);

                    //    	 #ifdef DEBUG
                    //    	                         if(soPixel5x5 >  0&&  soPixel5x5 < 20){
                    //    	    	                     debug_log("WD 5x5", (int)pix_val);
                    //
                    //    	                         }
                    //
                    //    	 #endif
                    windowR4.insert(pix_val, idxWinRow, idxWinCol);
                }
                // #ifdef DEBUG
                //                      if(soPixel5x5 >  0&&  soPixel5x5 < 20){
                //
                //                     debug_log("end one row");
                //                     debug_log("pixel handled", soPixel5x5);
                //                      }
                //
                // #endif
            }
            pixelHandled5x5++;
        }

        if (idxRow >= 12 && idxCol >= 12 && soPixel7x7 < ((IMAGE_WIDTH - 12) * (IMAGE_HEIGHT - 12)) && idxCol < IMAGE_WIDTH)
        {
            soPixel7x7++;
            is7x7Ready = 1;
            pixel_t pix_val;
            for (int idxWinRow = 0; idxWinRow < 13; idxWinRow++)
            {
                for (int idxWinCol = 0; idxWinCol < 13; idxWinCol++)
                {

                    pix_val = (pixel_t)lineBuff.getval(12 - idxWinRow, idxWinCol + pixelHandled7x7);

                    //    	 #ifdef DEBUG
                    //    	                         if(soPixel5x5 >  0&&  soPixel5x5 < 20){
                    //    	    	                     debug_log("WD 5x5", (int)pix_val);
                    //
                    //    	                         }
                    //
                    //    	 #endif
                    windowR6.insert(pix_val, idxWinRow, idxWinCol);
                }
                // #ifdef DEBUG
                //                      if(soPixel5x5 >  0&&  soPixel5x5 < 20){
                //
                //                     debug_log("end one row");
                //                     debug_log("pixel handled", soPixel5x5);
                //                      }
                //
                // #endif
            }
            pixelHandled7x7++;
        }

        if (is3x3Ready == 1)
        {
            pixel_t mid_val = windowR2.getval(2, 2);
            //    	 	 		 debug_log("...", (int)mid_val);

            uint16_t sum = 0;
            for (int i = 0; i < 5; i++)
            {
#pragma UNROLL
                for (int j = 0; j < 5; j++)
                {
                    sum += windowR2.getval(i, j);
                }
            }

            bool result = (mid_val * 25 >= sum) ? 1 : 0;
            ci_r2_stream.write(result);
#ifdef DEBUG
            FILE *fp = fopen("D:\\Thesis\\codetest\\python\\ci_r2_hls.txt", "a");
            if (fp)
            {
                fprintf(fp, "%d\n", (int)result);
                fclose(fp);
            }
            //    	 	 		            debug_log("MEDIAN_VALUE : ", (int)result);
#endif
        }

        if (is5x5Ready == 1)
        {
            pixel_t mid_val = windowR4.getval(4, 4);
            //    	 	 	    	 	 		 debug_log("...", (int)mid_val);

            uint32_t sum = 0;
            for (int i = 0; i < 9; i++)
            {
#pragma UNROLL
                for (int j = 0; j < 9; j++)
                {
                    sum += windowR4.getval(i, j);
                }
            }

            bool result = (mid_val * 81 >= sum) ? 1 : 0;
            //    	 	 	    	 	 		 debug_log("...", (int)sum);
            //    	 	 	    	 	 		 debug_log("\n");
            ci_r4_stream.write(result);

#ifdef DEBUG
            FILE *fp = fopen("D:\\Thesis\\codetest\\python\\ci_r4_hls.txt", "a");
            if (fp)
            {
                fprintf(fp, "%d\n", (int)result);
                fclose(fp);
            }
            //    	 	 		            debug_log("MEDIAN_VALUE : ", (int)result);
#endif
        }

        if (is7x7Ready == 1)
        {
            pixel_t mid_val = windowR6.getval(6, 6);
            //    	 	 	    	 	 		 debug_log("...", (int)mid_val);

            uint32_t sum = 0;
            for (int i = 0; i < 13; i++)
            {
#pragma UNROLL
                for (int j = 0; j < 13; j++)
                {
                    sum += windowR6.getval(i, j);
                }
            }

            bool result = (mid_val * (13 * 13) >= sum) ? 1 : 0;
            //    	 	 	    	 	 		 debug_log("...", (int)sum);
            //    	 	 	    	 	 		 debug_log("\n");
            ci_r6_stream.write(result);

#ifdef DEBUG
            FILE *fp = fopen("D:\\Thesis\\codetest\\python\\ci_r6_hls.txt", "a");
            if (fp)
            {
                fprintf(fp, "%d\n", (int)result);
                fclose(fp);
            }
            //    	 	 		            debug_log("MEDIAN_VALUE : ", (int)result);
#endif
        }
        is3x3Ready = 0;
        is5x5Ready = 0;
        is7x7Ready = 0;

        if (idxCol < IMAGE_WIDTH)
        {
            idxCol++;
        }
        else
        {
            pixelHandled5x5 = 0;
            pixelHandled3x3 = 0;
            pixelHandled7x7 = 0;

            idxCol = 0;
            idxRow++;
        }
    }
}
