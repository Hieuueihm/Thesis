#ifndef MEDIAN_PROCESSING_H
#define MEDIAN_PROCESSING_H

#include "params.h"
#include "hls_video.h"

void median_processing(stream_8_t &instream, stream_pixel_t &mstream3x3, stream_pixel_t &mstream5x5,
                       stream_pixel_t &mstream7x7, stream_pixel_t &pixstream, stream_pixel_t &mstream3x3nd,
                       stream_pixel_t &mstream3x3rd, stream_pixel_t &mstream5x5nd);

#endif
