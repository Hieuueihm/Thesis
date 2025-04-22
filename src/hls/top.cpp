#include "top.h"

void top(stream_8_t &instream, stream_32_t &outstream)
{
#pragma HLS dataflow

    // Declare the streams first
    stream_pixel_t mstream3x3, mstream5x5, mstream7x7, pixstream, mstream3x3nd, mstream3x3rd, mstream5x5nd;
    stream_pixel_t nir2stream, rdr2stream;
    stream_pixel_t nir4stream, rdr4stream;
    stream_pixel_t nir6stream, rdr6stream;

    stream_bit_t ci_r2_stream, ci_r4_stream, ci_r6_stream;

    uint32_t cinird_r2[200], cinird_r4[200], cinird_r6[200];
    for (int i = 0; i < 200; i++)
    {
        cinird_r2[i] = 0;
        cinird_r4[i] = 0;
        cinird_r6[i] = 0;
    }

    uint16_t count_r2 = 0;
    uint16_t count_r4 = 0;
    uint16_t count_r6 = 0;

#define R2_MAX (IMAGE_WIDTH - 4) * (IMAGE_HEIGHT - 4)
#define R4_MAX (IMAGE_WIDTH - 8) * (IMAGE_HEIGHT - 8)
#define R6_MAX (IMAGE_WIDTH - 12) * (IMAGE_HEIGHT - 12)

// Apply pragmas after declaration
#pragma HLS stream variable = mstream3x3 depth = 1024
#pragma HLS stream variable = mstream5x5 depth = 1024
#pragma HLS stream variable = mstream7x7 depth = 1024
#pragma HLS stream variable = mstream3x3nd depth = 1024
#pragma HLS stream variable = mstream3x3rd depth = 1024
#pragma HLS stream variable = mstream5x5rd depth = 1024

#pragma HLS stream variable = pixstream depth = 1024

#pragma HLS stream variable = ci_r2_stream depth = 1024
#pragma HLS stream variable = ci_r4_stream depth = 1024
#pragma HLS stream variable = ci_r6_stream depth = 1024

#pragma HLS stream variable = nir2stream depth = 1024
#pragma HLS stream variable = rdr2stream depth = 1024

#pragma HLS stream variable = nir4stream depth = 1024
#pragma HLS stream variable = rdr4stream depth = 1024

#pragma HLS stream variable = nir6stream depth = 1024
#pragma HLS stream variable = rdr6stream depth = 1024

    // Call processing functions
    median_processing(instream, mstream3x3, mstream5x5, mstream7x7, pixstream, mstream3x3nd, mstream3x3rd, mstream5x5nd);
    ci_top(mstream3x3, ci_r2_stream, ci_r4_stream, ci_r6_stream);

    nird<5>(pixstream, mstream3x3nd, nir2stream, rdr2stream);
    nird<9>(mstream3x3rd, mstream5x5, nir4stream, rdr4stream);
    nird<13>(mstream5x5nd, mstream7x7, nir6stream, rdr6stream);

    while (count_r2 < R2_MAX)
    {
        if (!nir2stream.empty() && !rdr2stream.empty() && !ci_r2_stream.empty())
        {
            bool ci = ci_r2_stream.read();
            pixel_t ni = nir2stream.read();
            pixel_t rd = rdr2stream.read();

            uint16_t his = ci * 100 + (int)ni * 10 + (int)rd;
            cinird_r2[his]++;
            count_r2++;
        }
    }

    while (count_r4 < R4_MAX)
    {
        if (!nir4stream.empty() && !rdr4stream.empty() && !ci_r4_stream.empty())
        {
            bool ci = ci_r4_stream.read();
            pixel_t ni = nir4stream.read();
            pixel_t rd = rdr4stream.read();
            uint16_t his = ci * 100 + (int)ni * 10 + (int)rd;
            cinird_r4[his]++;
            count_r4++;
        }
    }

    while (count_r6 < R6_MAX)
    {
        if (!nir6stream.empty() && !rdr6stream.empty() && !ci_r6_stream.empty())
        {
            bool ci = ci_r6_stream.read();
            pixel_t ni = nir6stream.read();
            pixel_t rd = rdr6stream.read();
            uint16_t his = ci * 100 + (int)ni * 10 + (int)rd;
            cinird_r6[his]++;
            count_r6++;
        }
    }

#ifdef DEBUG
    FILE *fp = fopen("D:\\Thesis\\codetest\\python\\histogram_hls.txt", "w");
    fclose(fp);

#endif
    if ((count_r2 == R2_MAX) && (count_r4 == R4_MAX) && (count_r6 == R6_MAX))
    {
        std::cout << (int)count_r2 << std::endl;
        for (int i = 0; i < 200; i++)
        {
#ifdef DEBUG
            FILE *fp = fopen("D:\\Thesis\\codetest\\python\\histogram_hls.txt", "a");
            if (fp)
            {
                fprintf(fp, "%d\n", (int)cinird_r2[i]);
                fclose(fp);
            }
#endif
            axi4_32_t data;
            data.keep = 1;
            data.strb = 1;
            data.user = 1;
            data.id = 1;
            data.dest = 1;
            data.data = cinird_r2[i];
            outstream.write(data);
        }
        for (int i = 0; i < 200; i++)
        {
#ifdef DEBUG
            FILE *fp = fopen("D:\\Thesis\\codetest\\python\\histogram_hls.txt", "a");
            if (fp)
            {
                fprintf(fp, "%d\n", (int)cinird_r4[i]);
                fclose(fp);
            }
#endif
            axi4_32_t data;
            data.keep = 1;
            data.strb = 1;
            data.user = 1;
            data.id = 1;
            data.dest = 1;
            data.data = cinird_r4[i];
            outstream.write(data);
        }
        for (int i = 0; i < 200; i++)
        {
#ifdef DEBUG
            FILE *fp = fopen("D:\\Thesis\\codetest\\python\\histogram_hls.txt", "a");
            if (fp)
            {
                fprintf(fp, "%d\n", (int)cinird_r6[i]);
                fclose(fp);
            }

#endif
            axi4_32_t data;
            data.keep = 1;
            data.strb = 1;
            data.user = 1;
            data.id = 1;
            data.dest = 1;
            data.data = cinird_r6[i];
            outstream.write(data);
        }
    }

    //
}
