#include <iostream>
#include <vector>
#include <cassert>
#include <opencv2/opencv.hpp>

void printMat(cv::Mat mat)
{
    for (int row = 0; row < mat.rows; ++row)
    {
        for (int col = 0; col < mat.cols; ++col)
        {
            uchar pixel = mat.at<uchar>(row, col);

            std::cout << static_cast<int>(pixel) << " ";
        }
        std::cout << std::endl;
    }
}

namespace LBP
{
    class MRELBP
    {
    private:
        int r[4] = {2, 4, 6, 8};
        int w_r = 3;

    public:
        // cv::Mat RGB2Gray(cv::Mat image)
        // {

        //     if (image.channels() != 3)
        //     {
        //         std::cerr << "Error: Image is not in BGR format!" << std::endl;
        //     }

        //     std::vector<cv::Mat> channels(3);
        //     cv::split(image, channels);
        //     cv::Mat blue = channels[0];
        //     cv::Mat green = channels[1];
        //     cv::Mat red = channels[2];

        //     cv::Mat grayMat(channels[0].rows, channels[0].cols, channels[0].type(), cv::Scalar(0));

        //     for (int i = 0; i < channels[0].rows; i++)
        //     {
        //         for (int j = 0; j < channels[0].cols; j++)
        //         {
        //             grayMat.at<uchar>(i, j) =
        //                 channels[2].at<uchar>(i, j) >> 2 +
        //                                                    channels[2].at<uchar>(i, j) >>
        //                 5 +
        //                     channels[1].at<uchar>(i, j) >>
        //                 1 +
        //                     channels[1].at<uchar>(i, j) >>
        //                 4 +
        //                     channels[0].at<uchar>(i, j) >>
        //                 4 +
        //                     channels[0].at<uchar>(i, j) >>
        //                 5;
        //         }
        //     }

        //     cv::Mat grayscale8bit;
        //     grayMat.convertTo(grayscale8bit, CV_8U);

        //     return grayscale8bit;
        // }

        cv::Mat medianProcessing(cv::Mat gray, int window_size)
        {
            assert(window_size == 3 || window_size == 5 || window_size == 7 || window_size == 9);

            // window size = 3, 5, 7, 9
            int w = window_size / 2;
            cv::Mat padded;
            // zero padding
            cv::copyMakeBorder(gray, padded,
                               w, w, w, w,
                               cv::BORDER_CONSTANT, cv::Scalar(0));

            // printMat(padded);

            cv::Mat medianMat(gray.rows, gray.cols, gray.type(), cv::Scalar(0));
            for (int i = w; i <= gray.rows; i++)
            {
                for (int j = w; j <= gray.cols; j++)
                {
                    std::vector<int> window;
                    for (int k = -w; k <= w; k++)
                    {
                        for (int l = -w; l <= w; l++)
                        {
                            window.push_back(padded.at<uchar>(i + k, j + l));
                        }
                    }
                    std::sort(window.begin(), window.end());
                    medianMat.at<uchar>(i - w, j - w) = window[window.size() / 2];
                }
            }
            return medianMat;
        }

        std::vector<std::pair<int, int>> CI_calculate(cv::Mat medianImage, int r)
        {
            std::vector<std::pair<int, int>> CI;
            int counter1 = 0;
            int counter0 = 0;
            for (int i = r; i < medianImage.rows - r; i++)
            {
                for (int j = r; j < medianImage.cols - r; j++)
                {
                    int center = medianImage.at<uchar>(i, j);
                    int sum = 0;

                    for (int k = -r; k <= r; k++)
                    {
                        for (int l = -r; l <= r; l++)
                        {
                            sum += medianImage.at<uchar>(i + k, j + l);
                            std::cout << static_cast<int>(medianImage.at<uchar>(i + k, j + l)) << " ";
                        }
                        std::cout << std::endl;
                    }
                    std::cout << sum << std::endl;

                    float muy = sum * 1.0 / ((2 * r + 1) * (2 * r + 1));
                    std::cout << muy << std::endl;

                    std::cout << std::endl;

                    if (float(center) >= muy)
                    {
                        counter1++;
                    }
                    else
                        counter0++;
                }
            }
            CI.push_back(std::make_pair(counter0, counter1));
            return CI;
        }

        void test(cv::Mat image)
        {
            cv::Mat m_3x3 = medianProcessing(image, 3);
            printMat(m_3x3);

            std::vector<std::pair<int, int>> ci_r2 = CI_calculate(m_3x3, 2);
            for (const auto &pair : ci_r2)
            {
                std::cout << "0: " << pair.first << ", 1: " << pair.second << std::endl;
            }
        }
    };
};

int main()
{
    // Path to the input image and the output grayscale image
    std::string inputPath = "/home/ms1sm/Documents/Code/Thesis/Data/Ex/sample.bmp"; // Change to your input image path

    // // // Create an instance of MRELBP and process the image
    LBP::MRELBP processor;
    // cv::Mat image = cv::imread(inputPath, cv::IMREAD_COLOR);

    // if (image.empty()) {
    //     std::cout << "Not a valid image file" << std::endl;
    //     return -1;
    // }

    // std::vector<cv::Mat> channels(3);
    // cv::split(image, channels);

    // // cv::namedWindow("Simple Demo", cv::WINDOW_AUTOSIZE);
    // // cv::imshow("Simple Demo", image);

    // // cv::waitKey(0);
    // // cv::destroyAllWindows();
    // std::cout << CV_VERSION << std::endl;

    uint8_t array[30][30] = {
        {99, 139, 212, 56, 206, 72, 32, 14, 239, 79, 232, 222, 189, 230, 209, 212, 230, 139, 235, 52, 118, 220, 29, 93, 144, 21, 42, 235, 73, 232},
        {188, 250, 8, 132, 8, 125, 228, 130, 254, 22, 231, 62, 155, 156, 190, 135, 144, 101, 155, 137, 18, 196, 112, 202, 168, 90, 158, 10, 183, 132},
        {208, 78, 148, 124, 7, 30, 251, 75, 204, 112, 166, 253, 143, 127, 14, 48, 113, 140, 235, 206, 181, 117, 171, 20, 231, 239, 66, 166, 80, 108},
        {10, 189, 27, 248, 200, 209, 44, 164, 249, 112, 205, 32, 23, 62, 203, 254, 134, 40, 65, 236, 173, 195, 175, 141, 67, 225, 30, 254, 99, 28},
        {212, 135, 42, 70, 86, 124, 67, 52, 125, 78, 11, 106, 146, 8, 125, 30, 254, 228, 203, 75, 121, 65, 190, 224, 137, 62, 248, 160, 106, 149},
        {15, 134, 41, 64, 112, 148, 233, 159, 252, 125, 190, 245, 148, 153, 129, 231, 91, 187, 210, 184, 12, 68, 103, 144, 187, 3, 144, 44, 225, 72},
        {206, 163, 230, 23, 5, 40, 235, 64, 58, 15, 153, 211, 0, 59, 219, 83, 208, 199, 95, 213, 132, 243, 231, 36, 110, 12, 117, 228, 164, 154},
        {101, 42, 105, 95, 64, 245, 179, 38, 196, 246, 27, 202, 179, 143, 31, 107, 209, 245, 2, 51, 46, 23, 68, 241, 59, 48, 38, 33, 249, 254},
        {105, 244, 56, 6, 211, 255, 54, 122, 147, 192, 93, 52, 18, 161, 86, 175, 113, 243, 40, 179, 245, 112, 231, 215, 135, 68, 142, 199, 100, 91},
        {186, 157, 108, 241, 222, 5, 109, 14, 45, 144, 158, 182, 225, 147, 190, 224, 63, 94, 11, 159, 107, 0, 235, 221, 224, 176, 67, 3, 246, 131},
        {124, 93, 240, 208, 193, 157, 201, 163, 183, 248, 246, 236, 131, 225, 81, 252, 91, 218, 119, 1, 78, 56, 84, 66, 155, 151, 118, 184, 157, 111},
        {112, 205, 33, 99, 196, 170, 217, 250, 215, 222, 85, 211, 35, 51, 135, 81, 57, 236, 16, 162, 88, 178, 94, 28, 145, 0, 14, 80, 78, 147},
        {218, 99, 48, 120, 31, 159, 104, 148, 9, 137, 65, 251, 38, 134, 131, 16, 47, 63, 33, 102, 144, 0, 96, 45, 133, 197, 80, 208, 162, 81},
        {110, 87, 173, 146, 228, 139, 187, 238, 211, 155, 152, 177, 86, 197, 141, 165, 10, 50, 118, 113, 36, 124, 235, 204, 29, 31, 232, 218, 115, 7},
        {31, 40, 71, 239, 32, 140, 38, 22, 76, 97, 156, 79, 172, 60, 136, 28, 133, 207, 108, 121, 142, 153, 81, 64, 175, 24, 237, 15, 94, 176},
        {4, 247, 82, 243, 124, 70, 128, 107, 187, 161, 231, 95, 218, 57, 135, 164, 16, 209, 214, 244, 107, 241, 251, 191, 234, 144, 16, 18, 149, 96},
        {64, 180, 166, 162, 8, 113, 71, 98, 218, 213, 216, 207, 44, 0, 80, 77, 126, 18, 59, 237, 165, 26, 244, 49, 94, 232, 161, 233, 203, 29},
        {127, 188, 133, 203, 38, 211, 233, 170, 99, 237, 150, 171, 29, 24, 180, 224, 41, 175, 69, 171, 109, 92, 210, 190, 152, 108, 188, 30, 23, 9},
        {91, 103, 252, 144, 29, 36, 222, 139, 216, 224, 8, 55, 120, 2, 208, 203, 225, 48, 51, 40, 220, 177, 23, 13, 207, 234, 247, 213, 70, 135},
        {76, 48, 35, 138, 85, 216, 111, 243, 143, 93, 20, 89, 200, 164, 177, 216, 137, 62, 255, 153, 93, 34, 72, 218, 138, 203, 160, 174, 61, 45},
        {210, 228, 34, 90, 13, 84, 161, 81, 220, 124, 141, 163, 251, 153, 191, 244, 239, 114, 80, 126, 146, 124, 1, 58, 52, 61, 96, 149, 81, 37},
        {4, 228, 22, 236, 117, 240, 58, 135, 190, 238, 211, 215, 139, 241, 116, 113, 201, 21, 235, 223, 151, 28, 92, 227, 182, 207, 211, 55, 243, 215},
        {177, 11, 147, 254, 4, 77, 149, 88, 82, 16, 76, 90, 243, 208, 207, 25, 36, 96, 235, 123, 169, 24, 39, 98, 20, 61, 252, 189, 160, 156},
        {166, 130, 10, 35, 110, 95, 31, 218, 10, 246, 15, 21, 0, 9, 124, 115, 27, 95, 22, 238, 20, 39, 70, 164, 42, 3, 137, 185, 90, 82},
        {63, 192, 21, 220, 94, 254, 20, 30, 14, 193, 113, 28, 194, 78, 20, 92, 122, 109, 116, 122, 57, 206, 149, 178, 147, 74, 152, 217, 192, 83},
        {208, 202, 8, 222, 197, 131, 136, 52, 56, 114, 251, 227, 84, 114, 121, 238, 130, 248, 199, 5, 236, 204, 12, 31, 190, 130, 148, 94, 56, 5},
        {59, 251, 112, 124, 200, 34, 151, 146, 202, 116, 172, 13, 214, 111, 80, 105, 252, 171, 15, 63, 200, 236, 49, 252, 160, 102, 132, 193, 143, 166},
        {40, 205, 110, 160, 163, 160, 197, 117, 208, 13, 35, 154, 126, 191, 190, 38, 195, 48, 235, 169, 217, 252, 171, 184, 209, 115, 100, 24, 6, 151},
        {0, 3, 244, 179, 130, 216, 161, 129, 130, 27, 1, 85, 241, 217, 159, 55, 219, 219, 39, 92, 193, 122, 246, 146, 173, 126, 229, 235, 215, 146},
        {43, 200, 255, 32, 33, 244, 1, 1, 137, 212, 151, 23, 94, 104, 178, 206, 182, 61, 86, 194, 8, 230, 19, 230, 222, 218, 54, 122, 139, 84},
    };

    cv::Mat mat(30, 30, CV_8UC1, array);

    // cv::Mat medianMat = processor.medianProcessing(mat, 3);
    // printMat(medianMat);
    processor.test(mat);

    return 0;
}
