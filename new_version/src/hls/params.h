#ifndef PARAM_H
#define PARAM_H

#include "hls_stream.h"
// #include "ap_int_sim.h"
#include "ap_axi_sdata.h"
#include <iostream>
#include "hls_video.h"
#include <hls_math.h>
#include "ap_fixed.h"

typedef ap_axiu<32, 1, 1, 1> axi4_32_t;
typedef ap_axiu<8, 1, 1, 1> axi4_8_t;

typedef hls::stream<axi4_32_t> stream_32_t;
typedef hls::stream<axi4_8_t> stream_8_t;

typedef ap_uint<8> pixel_t;
typedef hls::stream<pixel_t> stream_pixel_t;
typedef hls::stream<bool> stream_bit_t;

#define IMAGE_HEIGHT 128
#define IMAGE_WIDTH 128

#define R2 2
#define R4 4
#define R6 6

#define DIM2 3
#define DIM4 5
#define DIM6 7

// #define DEBUG 1

template <typename T>
static void debug_log(char *message, T value)
{
    std::cout << "[DEBUG]-" << message << " " << value << std::endl;
}
static void debug_log(char *message)
{
    std::cout << "[DEBUG]-" << message << std::endl;
}
#endif
