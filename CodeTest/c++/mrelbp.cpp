#include <iostream>
#include <vector>
#include <cassert>
#include <opencv2/opencv.hpp>

using namespace cv;
// namespace LBP {
//     class MRELBP {
//     private:
//         int r[4] = {2, 4, 6, 8};
//         int w_r = 3;

//     public:
//         cv::Mat RGB2Gray(const std::string& imagePath) {
//             cv::Mat image = cv::imread(imagePath);
//             if (image.empty()) {
//                 std::cerr << "Error: Could not open or find the image!" << std::endl;
              
//             }

//             if (image.channels() != 3) {
//                 std::cerr << "Error: Image is not in BGR format!" << std::endl;
//             }

//             std::vector<cv::Mat> channels(3);
//             cv::split(image, channels);
//             cv::Mat blue = channels[0];
//             cv::Mat green = channels[1];
//             cv::Mat red = channels[2];

//             cv::Mat grayMat(channels[0].rows, channels[0].cols, channels[0].type(), cv::Scalar(0));


//             for(int i = 0; i < channels[0].rows; i++){
//                 for(int j = 0; j < channels[0].cols; j++){
//                     grayMat.at<uchar>(i, j) =  
//                     channels[2].at<uchar>(i, j) >> 2 +  
//                     channels[2].at<uchar>(i, j)  >> 5 +
//                     channels[1].at<uchar>(i, j) >> 1 +  
//                     channels[1].at<uchar>(i, j)  >> 4 + 
//                     channels[0].at<uchar>(i, j)  >> 4 + 
//                     channels[0].at<uchar>(i, j)  >> 5;  
//                 }
//             }

//             cv::Mat grayscale8bit;
//             grayMat.convertTo(grayscale8bit, CV_8U);


//             return grayscale8bit;


//         }


//         cv::Mat medianProcessing(cv::Mat gray, int window_size){
//             // window size = 3, 5, 7, 9
//             assert(window_size == 3 || window_size == 5 || window_size == 7 || window_size == 9);
//             int w = window_size / 2;
//             cv::Mat medianMat(gray.rows - 2 * w, gray.cols - 2 * w, gray.type(), cv::Scalar(0));
//             for(int i = w; i < gray.rows - w; i++){
//                 for(int j = w; j < gray.cols - w; j++){
//                     std::vector<int> window;
//                     for(int k = -w; k <= w; k++){
//                         for(int l = -w; l <= w; l++){
//                             window.push_back(gray.at<uchar>(i + k, j + l));
//                         }
//                     }
//                     std::sort(window.begin(), window.end());
//                     medianMat.at<uchar>(i, j) = window[window.size() / 2];
//                 }
//             }
//             return medianMat;
//         }

//         std::vector<int, int> CI_calculate(cv::Mat medianImage, int r){
//             std::vector<int, int> CI;
//             int counter1 = 0;
//             int counter0 = 0;
//             for(int i = r; i < medianImage.rows - r; i++){
//                 for(int j = r; j < medianImage.cols - r; j++){
//                     int center = medianImage.at<uchar>(i, j);
//                     int sum = 0;
//                     for(int k = -r; k <= r; k++){
//                         for(int l = -r; l <= r; l++){
//                             sum += medianImage.at<uchar>(i + k, j + l);
//                         }
//                     }
//                     int muy = sum / ((2 * r + 1) * (2 * r + 1) );

//                     if(center >= muy){
//                         counter1++;
//                     } else counter0++;
                    
//                 }
//             }
//             CI.push_back(counter0);
//             CI.push_back(counter1);
//             return CI;

//         }
//     };
// };

int main() {
    // Path to the input image and the output grayscale image
    std::string inputPath = "D:\\Thesis\\Data\\Ex\\download.jpg";   // Change to your input image path

    // // Create an instance of MRELBP and process the image
    // // LBP::MRELBP processor;
    Mat image = cv::imread(inputPath);

    // if (image.empty()) {
    //     std::cerr << "Failed to read the image!" << std::endl;
    //     return -1;
    // }

    // // Kiểm tra nếu ảnh là ảnh màu
    // if (image.channels() != 3) {
    //     std::cerr << "The input image is not a color image!" << std::endl;
    //     return -1;
    // }

    std::cout << CV_VERSION << std::endl;

    return 0;
}
