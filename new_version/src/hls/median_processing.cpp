#include "median_processing.h"

// 11 k lut
#define SWAP(A, B)        \
    if (A > B)            \
    {                     \
        pixel_t temp = A; \
        A = B;            \
        B = temp;         \
    }
template <int N>
void odd_even_sort(pixel_t A[N])
{
#pragma HLS PIPELINE
    bool sorted = false;
    while (!sorted)
    {
        sorted = true;
        for (int i = 1; i < N - 1; i += 2)
        {
            if (A[i] > A[i + 1])
            {
                SWAP(A[i], A[i + 1]);
                sorted = false;
            }
        }
        for (int i = 0; i < N - 1; i += 2)
        {
            if (A[i] > A[i + 1])
            {
                SWAP(A[i], A[i + 1]);
                sorted = false;
            }
        }
    }
}
// 9k lut
template <int N>
void insertion_sort(pixel_t A[N])
{
#pragma HLS UNROLL
    for (int i = 1; i < N; i++)
    {
        pixel_t key = A[i];
        int j = i - 1;
        while (j >= 0 && A[j] > key)
        {
            A[j + 1] = A[j];
            j--;
        }
        A[j + 1] = key;
    }
}
void median_processing(stream_8_t &instream, stream_pixel_t &mstream3x3, stream_pixel_t &mstream5x5,
                       stream_pixel_t &mstream7x7, stream_pixel_t &pixstream, stream_pixel_t &mstream3x3nd,
                       stream_pixel_t &mstream3x3rd, stream_pixel_t &mstream5x5nd

)
{

    hls::LineBuffer<7, IMAGE_WIDTH, unsigned char> lineBuff;
    hls::Window<DIM2, DIM2, unsigned char> window_3x3;
    hls::Window<DIM4, DIM4, unsigned char> window_5x5;
    hls::Window<DIM6, DIM6, unsigned char> window_7x7;

    uint16_t idxCol = 0;
    uint16_t idxRow = 0;
    uint16_t pixelHandled3x3 = 0;
    uint16_t pixelHandled5x5 = 0;
    uint16_t pixelHandled7x7 = 0;

    int sumOfPixel3x3 = 0;
    int sumOfPixel5x5 = 0;
    int sumOfPixel7x7 = 0;

    bool is3x3Ready = 0;
    uint16_t idxRow3x3 = 0;

    bool is5x5Ready = 0;
    uint16_t idxRow5x5 = 0;

    bool is7x7Ready = 0;
    uint16_t idxRow7x7 = 0;

    //	axi4_32_t dataWrite2Output;
    axi4_8_t dataReadFromInput;
    pixel_t currentPixel;
#ifdef DEBUG
    FILE *fp = fopen("D:\\Thesis\\codetest\\python\\m_5x5_hls.txt", "w");
    fclose(fp);
    FILE *fp1 = fopen("D:\\Thesis\\codetest\\python\\m_3x3_hls.txt", "w");
    fclose(fp1);
    FILE *fp2 = fopen("D:\\Thesis\\codetest\\python\\m_7x7_hls.txt", "w");
    fclose(fp2);
#endif

    for (int i = 0; i < (IMAGE_HEIGHT * IMAGE_WIDTH) + 1000 * IMAGE_WIDTH; i++)
    {
        {
            if (idxCol < IMAGE_WIDTH)
            {
                if (!instream.empty())
                {
                    dataReadFromInput = instream.read();
                    currentPixel = dataReadFromInput.data;

                    // #ifdef DEBUG
                    //                 debug_log("INPUT RECEIVE: ", (int)currentPixel);
                    // #endif
                    pixstream.write(currentPixel);
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
            // #ifdef DEBUG
            //        std::cout << "[DEBUG] LineBuffer Contents (Row " << idxRow << ", Col " << idxCol << "):" << std::endl;
            //        for (int row = 0; row < 7; row++)
            //        {
            //            std::cout << "Row " << row << ": ";
            //            for (int col = 0; col < IMAGE_WIDTH; col++)
            //            {
            //                std::cout << (int)lineBuff.getval(row, col) << " ";
            //            }
            //            std::cout << std::endl;
            //        }
            // #endif

            if (idxRow >= 3 && idxCol >= 1 && sumOfPixel3x3 < (IMAGE_WIDTH * IMAGE_HEIGHT) && idxCol <= IMAGE_WIDTH)
            {
                sumOfPixel3x3++;
                is3x3Ready = 1;
                pixel_t pix_val;
                for (int idxWinRow = 0; idxWinRow < DIM2; idxWinRow++)
                {
                    for (int idxWinCol = 0; idxWinCol < DIM2; idxWinCol++)
                    {
                        int index_col = idxWinCol + pixelHandled3x3 - 1;
                        int index_row = idxWinRow + 2;
                        if (index_col < 0 || index_col > IMAGE_WIDTH - 1)
                        {
                            pix_val = 0;
                        }
                        else if ((idxRow3x3 == 0 && idxWinRow == 2) || (idxRow3x3 == IMAGE_HEIGHT - 1 && idxWinRow == 0))
                        {
                            pix_val = 0;
                        }
                        else
                        {
                            pix_val = (pixel_t)lineBuff.getval(index_row, index_col);
                        }

                        // #ifdef DEBUG
                        //
                        //                     debug_log("WD 3X3", (int)pix_val);
                        //
                        // #endif
                        window_3x3.insert(pix_val, idxWinRow, idxWinCol);
                    }
                }
                pixelHandled3x3++;
            }

            if (idxRow >= 3 && idxCol >= 2 && sumOfPixel5x5 < (IMAGE_WIDTH * IMAGE_HEIGHT) && idxCol <= IMAGE_WIDTH + 1)
            {
                sumOfPixel5x5++;
                is5x5Ready = 1;
                pixel_t pix_val;
                for (int idxWinRow = 0; idxWinRow < DIM4; idxWinRow++)
                {
                    for (int idxWinCol = 0; idxWinCol < DIM4; idxWinCol++)
                    {
                        int index_col = idxWinCol + pixelHandled5x5 - 2;
                        int index_row = idxWinRow + 1;
                        if (index_col < 0 || index_col > IMAGE_WIDTH - 1)
                        {
                            pix_val = 0;
                        }
                        else if ((idxRow5x5 == 0 && (idxWinRow == 3 || idxWinRow == 4)) || (idxRow5x5 == 1 && idxWinRow == 4) || (idxRow5x5 == IMAGE_HEIGHT - 2 && idxWinRow == 0) || (idxRow5x5 == IMAGE_HEIGHT - 1 && (idxWinRow == 1 || idxWinRow == 0)))
                        {
                            pix_val = 0;
                        }
                        else
                        {
                            pix_val = (pixel_t)lineBuff.getval(index_row, index_col);
                        }
                        window_5x5.insert(pix_val, idxWinRow, idxWinCol);

                        //        #ifdef DEBUG
                        //
                        //                            debug_log("WD 5x5", (int)pix_val);
                        //
                        //        #endif
                    }

                    // #ifdef DEBUG
                    //
                    //                         debug_log("end one row");
                    //                         debug_log("pixel 5x5",  (int)sumOfPixel5x5);
                    //
                    // #endif
                }
                pixelHandled5x5++;
            }

            if (idxRow >= 3 && idxCol >= 3 && sumOfPixel5x5 < (IMAGE_WIDTH * IMAGE_HEIGHT) && idxCol <= IMAGE_WIDTH + 2)
            {
                sumOfPixel7x7++;
                is7x7Ready = 1;
                pixel_t pix_val;
                for (int idxWinRow = 0; idxWinRow < DIM6; idxWinRow++)
                {
                    for (int idxWinCol = 0; idxWinCol < DIM6; idxWinCol++)
                    {
                        int index_col = idxWinCol + pixelHandled7x7 - 3;
                        int index_row = idxWinRow;
                        if (index_col < 0 || index_col > IMAGE_WIDTH - 1)
                        {
                            pix_val = 0;
                        }
                        else if ((idxRow7x7 == 0 && (idxWinRow == 4 || idxWinRow == 5 || idxWinRow == 6)) || (idxRow5x5 == 1 && (idxWinRow == 5 || idxWinRow == 6)) || (idxRow5x5 == 2 && (idxWinRow == 6)) || (idxRow7x7 == IMAGE_HEIGHT - 3 && idxWinRow == 0) || (idxRow7x7 == IMAGE_HEIGHT - 2 && (idxWinRow == 1 || idxWinRow == 0)) ||
                                 (idxRow7x7 == IMAGE_HEIGHT - 1 && (idxWinRow == 1 || idxWinRow == 0 || idxWinRow == 2)))
                        {
                            pix_val = 0;
                        }
                        else
                        {
                            pix_val = (pixel_t)lineBuff.getval(index_row, index_col);
                        }
                        window_7x7.insert(pix_val, idxWinRow, idxWinCol);

                        //        #ifdef DEBUG
                        //
                        //                            debug_log("WD 7x7", (int)pix_val);
                        //
                        //        #endif
                    }

                    // #ifdef DEBUG
                    //
                    //                         debug_log("end one row");
                    //                         debug_log("pixel 7x7",  (int)sumOfPixel7x7);
                    //
                    // #endif
                }
                pixelHandled7x7++;
            }

            if (is3x3Ready == 1 && idxCol <= IMAGE_WIDTH)
            {
                pixel_t filtered_pixel;
                const int N = DIM2 * DIM2;
                pixel_t pixels[N];
                int idx = 0;
                for (int i = 0; i < DIM2; i++)
                {
                    for (int j = 0; j < DIM2; j++)
                    {
                        pixels[idx++] = window_3x3.getval(i, j);
                    }
                }

                insertion_sort<N>(pixels);

                filtered_pixel = pixels[N / 2];
                mstream3x3.write(filtered_pixel);
                mstream3x3nd.write(filtered_pixel);
                mstream3x3rd.write(filtered_pixel);

#ifdef DEBUG
                FILE *fp = fopen("D:\\Thesis\\codetest\\python\\m_3x3_hls.txt", "a");
                if (fp)
                {
                    fprintf(fp, "%d\n", (int)filtered_pixel);
                    fclose(fp);
                }
//            debug_log("MEDIAN_VALUE : ", (int)filtered_pixel);
#endif
            }

            if (is5x5Ready == 1 && idxCol <= IMAGE_WIDTH + 1)
            {
                pixel_t filtered_pixel;
                const int N = DIM4 * DIM4;
                pixel_t pixels[N];
                int idx = 0;
                for (int i = 0; i < DIM4; i++)
                {
                    for (int j = 0; j < DIM4; j++)
                    {
                        pixels[idx++] = window_5x5.getval(i, j);
                    }
                }

                insertion_sort<N>(pixels);

                filtered_pixel = pixels[N / 2];
                mstream5x5.write(filtered_pixel);
                mstream5x5nd.write(filtered_pixel);
//
#ifdef DEBUG
                FILE *fp = fopen("D:\\Thesis\\codetest\\python\\m_5x5_hls.txt", "a");
                if (fp)
                {
                    fprintf(fp, "%d\n", (int)filtered_pixel);
                    fclose(fp);
                }
//            debug_log("MEDIAN_VALUE : ", (int)filtered_pixel);
#endif
                //
            }

            if (is7x7Ready == 1 && idxCol <= IMAGE_WIDTH + 2)
            {
                pixel_t filtered_pixel;
                const int N = DIM6 * DIM6;
                pixel_t pixels[N];
                int idx = 0;
                for (int i = 0; i < DIM6; i++)
                {
                    for (int j = 0; j < DIM6; j++)
                    {
                        pixels[idx++] = window_7x7.getval(i, j);
                    }
                }

                insertion_sort<N>(pixels);

                filtered_pixel = pixels[N / 2];
                mstream7x7.write(filtered_pixel);
                //
#ifdef DEBUG
                FILE *fp = fopen("D:\\Thesis\\codetest\\python\\m_7x7_hls.txt", "a");
                if (fp)
                {
                    fprintf(fp, "%d\n", (int)filtered_pixel);
                    fclose(fp);
                }
                //                   debug_log("MEDIAN_VALUE : ", (int)filtered_pixel);
#endif
                //
            }

            if (idxCol < IMAGE_WIDTH + 2)
            {
                idxCol++;
            }
            else
            {
                if (is3x3Ready)
                {
                    idxRow3x3++;
                }
                if (is5x5Ready)
                {
                    idxRow5x5++;
                }
                if (is7x7Ready)
                {
                    idxRow7x7++;
                }
                is7x7Ready = 0;

                is5x5Ready = 0;
                is3x3Ready = 0;
                idxCol = 0;
                idxRow++;
                pixelHandled3x3 = 0;
                pixelHandled5x5 = 0;
                pixelHandled7x7 = 0;
            }
        }
    }
}
