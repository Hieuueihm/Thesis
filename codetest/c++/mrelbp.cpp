#include <iostream>
#include <vector>
#include <cassert>
#include <opencv2/opencv.hpp>
#include <fstream>
#include <sstream>

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
		cv::Mat medianProcessing(cv::Mat gray, int window_size)
		{
			assert(window_size == 3 || window_size == 5 || window_size == 7 || window_size == 9);

			int w = window_size / 2;
			cv::Mat padded;
			cv::copyMakeBorder(gray, padded,
							   w, w, w, w,
							   cv::BORDER_CONSTANT, cv::Scalar(0));

			cv::Mat medianMat(gray.rows, gray.cols, CV_8U, cv::Scalar(0));
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

		cv::Mat CI_calculate(cv::Mat medianImage, int r)
		{

			cv::Mat newMat = cv::Mat::zeros(medianImage.rows - 2 * r, medianImage.cols - 2 * r, CV_8U);
			for (int i = r; i < medianImage.rows - r; i++)
			{
				for (int j = r; j < medianImage.cols - r; j++)
				{
					uint8_t center = medianImage.at<uchar>(i, j);
					uint16_t sum = 0;

					for (int k = -r; k <= r; k++)
					{
						for (int l = -r; l <= r; l++)
						{
							sum += medianImage.at<uchar>(i + k, j + l);
							// std::cout << static_cast<int>(medianImage.at<uchar>(i + k, j + l)) << " ";
						}
						// std::cout << std::endl;
					}
					// std::cout << sum << std::endl;

					uint16_t center_scale = center * ((2 * r + 1) * (2 * r + 1));
					int decision = 0;
					if (center_scale >= sum)
					{
						decision = 1;
					}
					newMat.at<uchar>(i - r, j - r) = static_cast<uchar>(decision);
				}
			}

			return newMat;
		}

		void test(cv::Mat image)
		{
			cv::Mat m_3x3 = medianProcessing(image, 3);
			printMat(m_3x3);

			cv::Mat CI = CI_calculate(m_3x3, 2);
			std::cout << CI.rows << " " << CI.cols << std::endl;
			printMat(CI);
		}
	};
};
cv::Mat readMatrixFromFile(const std::string &filename, int rows, int cols)
{
	std::ifstream file(filename);
	if (!file.is_open())
	{
		std::cerr << "Error: Unable to open file!" << std::endl;
		return cv::Mat();
	}

	std::vector<uint8_t> data;
	std::string line;

	// Read the file line by line
	while (std::getline(file, line))
	{
		std::istringstream stream(line);
		int value;
		while (stream >> value)
		{
			data.push_back(static_cast<uint8_t>(value));
		}
	}

	file.close();

	// Ensure the data matches the expected size
	if (data.size() != rows * cols)
	{
		std::cerr << "Error: Mismatch between file data and specified dimensions!" << std::endl;
		return cv::Mat();
	}

	// Create the matrix from the data
	cv::Mat mat(rows, cols, CV_8U, data.data());
	return mat.clone(); // Clone to ensure independent memory allocation
}

int main()
{
	// Path to the input image and the output grayscale image
	std::string inputPath = "/home/ms1sm/Documents/Code/Thesis/data/Ex/sample.bmp"; // Change to your input image path
	std::string input_matrix_path = "/home/ms1sm/Documents/Code/Thesis/codetest/python/output_matrix_original.txt";
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

	cv::Mat mat = readMatrixFromFile(input_matrix_path, 30, 30);
	printMat(mat);

	// cv::Mat medianMat = processor.medianProcessing(mat, 3);
	// printMat(medianMat);
	processor.test(mat);

	return 0;
}
