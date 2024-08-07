% Read the input image
fprintf('\nImage Processing Menu:\n');
fprintf('A) NORMAL IMAGE\n');
fprintf('B) CELESTIAL IMAGE\n');
fprintf('C) UV IMAGE\n');
fprintf('D) INFRARED IMAGE\n');

chooose = input('Enter your choice (A, B, C, D): ', 's');
switch chooose
    case 'A'
        inputImage = imread('pic03_anil.jpg'); 
    case 'B'
        inputImage = imread('pic15_blackhole.jpg'); 
    case 'C'
        inputImage = imread('pic13_UV.jpg'); 
    case 'D'
        inputImage = imread('pic17_infrared.jpg'); 
end

while true
    fprintf('\nImage Processing Menu:\n');
    fprintf('1. Intensity Transformation\n');
    fprintf('2. Spatial Domain Operations\n');
    fprintf('3. Histogram Operations\n');
    fprintf('4. Bandpass Operations\n');
    fprintf('5. Bandreject Operations\n'); 
    fprintf('6. Exit\n');

    choice = input('Enter your choice (1-6): ');

    switch choice
        case 1
            fprintf('\nIntensity Transformation Menu:\n');
            fprintf('1. Image Negation\n');
            fprintf('2. Logarithmic Transformation\n');
            fprintf('3. Power Law Transformation\n');
            fprintf('4. Contrast Stretching\n');
            fprintf('5. Back to Main Menu\n');

            subChoice = input('Enter your choice (1-5): ');

            switch subChoice
                case 1
                    % Image Negation
                    negatedImage = 255 - inputImage;
                    imshow(negatedImage);
                    title('Image Negation');
                case 2
                    % Logarithmic Transformation
                    c = input('Enter the value of constant (c): ');
                    transformedImage = c * log(1 + double(inputImage));
                    transformedImage = uint8(255 * (transformedImage / max(transformedImage(:))));
                    imshow(transformedImage);
                    title('Logarithmic Transformation');
                case 3
                    % Power Law Transformation
                    c = input('Enter the value of constant (c): ');
                    gamma = input('Enter the value of gamma (γ): ');
                    transformedImage = c * (double(inputImage).^gamma);
                    transformedImage = uint8(255 * (transformedImage / max(transformedImage(:))));
                    imshow(transformedImage);
                    title('Power Law Transformation');
                case 4
                    % Contrast Stretching
                    low = input('Enter the low value for contrast stretching: ');
                    high = input('Enter the high value for contrast stretching: ');
                    transformedImage = imadjust(inputImage, [low/255, high/255], [0, 1]);
                    imshow(transformedImage);
                    title('Contrast Stretching');
                case 5
                    % Back to Main Menu
                    % No action needed here
                otherwise
                    fprintf('Invalid choice. Please enter a valid option (1-5).\n');
            end
        case 2
            fprintf('\nSpatial Domain Operations Menu:\n');
            fprintf('A) Smoothing Filters:\n');
            fprintf('   1) Mean Filter\n');
            fprintf('   2) Median Filter\n');
            fprintf('   3) Box Filter\n');
            fprintf('   4) Gaussian Filter\n');
            fprintf('B) Sharpening Filters:\n');
            fprintf('   1) Laplacian Filter\n');
            fprintf('   2) Unsharp Filter\n');
            fprintf('   3) High Pass Filter\n');
            fprintf('   4) Gradient Filter\n');
            fprintf('C) Edge Detection Filters:\n');
            fprintf('   1) Sobel Operator\n');
            fprintf('   2) Zero Crossing Edge Detector\n');
            fprintf('   3) Morphological Edge Detectors\n');
            fprintf('   4) Laplacian of Gaussian (LoG)\n');
            fprintf('D) Back to Main Menu\n');

            subChoice = input('Enter your choice (A, B, C, D): ', 's');

            switch subChoice
                case 'A'
                    % Smoothing Filters
                    smoothing_choice = input('Enter the number of the filter (1-4): ');

                    switch smoothing_choice
                        case 1
                            % Mean Filter
                            filterSize = input('Enter the filter size (e.g., 3 for a 3x3 filter): ');
                            smoothedImage = imfilter(inputImage, fspecial('average', filterSize));
                            imshow(smoothedImage);
                            title('Mean Filter');
                        case 2
                            % Median Filter
                            filterSize = input('Enter the filter size (e.g., 3 for a 3x3 filter): ');
                            grayImage = rgb2gray(inputImage);
                            smoothedImage = medfilt2(grayImage, [filterSize, filterSize]);
                            imshow(smoothedImage);
                            title('Median Filter');
                        case 3
                            % Box Filter
                            filterSize = input('Enter the filter size (e.g., 3 for a 3x3 filter): ');
                            smoothedImage = imfilter(inputImage, fspecial('average', filterSize));
                            imshow(smoothedImage);
                            title('Box Filter');
                        case 4
                            % Gaussian Filter
                            filterSize = input('Enter the filter size (e.g., 3 for a 3x3 filter): ');
                            sigma = input('Enter the standard deviation (sigma) for Gaussian filter: ');
                            gaussianFilter = fspecial('gaussian', [filterSize, filterSize], sigma);
                            smoothedImage = imfilter(inputImage, gaussianFilter);
                            imshow(smoothedImage);
                            title('Gaussian Filter');
                        otherwise
                            fprintf('Invalid choice for Smoothing Filters. Please enter a valid option (1-4).\n');
                    end
                case 'B'
                    % Sharpening Filters
                    sharpening_choice = input('Enter the number of the filter (1-4): ');

                    switch sharpening_choice
                        case 1
                            % Laplacian Filter
                            laplacianFilter = fspecial('laplacian', 0);
                            sharpenedImage = imfilter(inputImage, laplacianFilter);
                            imshow(sharpenedImage);
                            title('Laplacian Filter');
                        case 2
                            % Unsharp Masking 
                            amount = input('Enter the amount for unsharp masking: ');
                            unsharpImage = imsharpen(inputImage, 'Amount', amount);
                            imshow(unsharpImage);
                            title('Unsharp Masking');
                        case 3
                            % High Pass Filter 
                            filterSize = input('Enter the filter size (e.g., 3 for a 3x3 filter): ');
                            highpassFilter = -fspecial('average', filterSize) + 1;
                            highpassImage = imfilter(inputImage, highpassFilter);
                            imshow(highpassImage);
                            title('High Pass Filter');
                        case 4
                            % Gradient Filter
                            gradientFilter = fspecial('prewitt');
                            gradientImage = imfilter(inputImage, gradientFilter);
                            imshow(gradientImage);
                            title('Gradient Filter');
                        otherwise
                            fprintf('Invalid choice for Sharpening Filters. Please enter a valid option (1-4).\n');
                    end
                case 'C'
                    % Edge Detection Filters
                    edge_choice = input('Enter the number of the filter (1-4): ');

                    switch edge_choice
                        case 1
                            % Sobel Operator
                            grayImage = rgb2gray(inputImage);
                            edgeImage = edge(grayImage, 'sobel');
                            imshow(edgeImage);
                            title('Sobel Operator');
                        case 2
                            % Zero Crossing Edge Detector 
                            grayImage = rgb2gray(inputImage);
                            edgeImage = edge(grayImage, 'canny');
                            imshow(edgeImage);
                            title('Zero Crossing Edge Detector (Canny)');
                        case 3
                            % Morphological Edge Detectors
                            se = strel('square', 3);
                            grayImage = rgb2gray(inputImage);
                            erodedImage = imerode(grayImage, se);
                            dilatedImage = imdilate(grayImage, se);
                            edgeImage = dilatedImage - erodedImage;
                            imshow(edgeImage);
                            title('Morphological Edge Detector');
                        case 4
                            % Laplacian of Gaussian (LoG)
                            grayImage = rgb2gray(inputImage);
                            filterSize = input('Enter the filter size (e.g., 3 for a 3x3 filter): ');
                            sigma = input('Enter the standard deviation (sigma) for LoG filter: ');
                            logFilter = fspecial('log', [filterSize, filterSize], sigma);
                            logImage = imfilter(grayImage, logFilter);
                            imshow(logImage);
                            title('Laplacian of Gaussian (LoG)');
                        otherwise
                            fprintf('Invalid choice for Edge Detection Filters. Please enter a valid option (1-4).\n');
                    end
                case 'D'
                   
                otherwise
                    fprintf('Invalid choice. Please enter a valid option (A, B, C, D).\n');
            end
        case 3
            fprintf('\nHistogram Operations Menu:\n');
            fprintf('a) Histogram Equalization\n');
            fprintf('b) Histogram Matching\n');
            fprintf('c) Back to Main Menu\n');

            subChoice = input('Enter your choice (a, b, c): ', 's');

            switch subChoice
                case 'a'
                    % Histogram Equalization
                    grayImage = rgb2gray(inputImage); 
                    equalizedImage = histeq(grayImage);
                    imshow(equalizedImage);
                    title('Histogram Equalization');
                case 'b'
                    % Histogram Matching
                    referenceImage = imread('pic03_anil.jpg'); 
                    grayImage = rgb2gray(inputImage); 
                    matchedImage = imhistmatch(grayImage, imhist(referenceImage));
                    imshow(matchedImage);
                    title('Histogram Matching');
                case 'c'
                    
                otherwise
                    fprintf('Invalid choice. Please enter a valid option (a, b, c).\n');
            end
        case 4
            fprintf('\nBandpass Operations Menu:\n');
            fprintf('1. Ideal Bandpass filter\n');
            fprintf('2. Butterworth Bandpass Filter\n');
            fprintf('3. Gaussian Bandpass Filter\n');
            fprintf('4. Back to Main Menu\n');

            subChoice = input('Enter your choice (1-4): ');

            switch subChoice
                case 1
                    % Ideal Bandpass Filter Code
                    
                case 2
                    % Butterworth Bandpass Filter Code
                   
                case 3
                    % Gaussian Bandpass Filter Code
                    
                case 4
                    % Back to Main Menu
                    
                otherwise
                    fprintf('Invalid choice. Please enter a valid option (1-4).\n');
            end
        case 5
            fprintf('\nBandreject Operations Menu:\n');
            fprintf('1. Ideal Bandreject filter\n');
            fprintf('2. Butterworth Bandreject Filter\n');
            fprintf('3. Gaussian Bandreject Filter\n');
            fprintf('4. Back to Main Menu\n');

            subChoice = input('Enter your choice (1-4): ');

            switch subChoice
                case 1
                    % Ideal Bandreject Filter Code
                    % 1 - Ideal Bandpass Filter
                case 2
                    % Butterworth Bandreject Filter Code
                    % 1 - Butterworth Bandpass Filter
                case 3
                    % Gaussian Bandreject Filter Code
                    % 1 - Gaussian Bandpass Filter
                case 4
                    % Back to Main Menu
                    
                otherwise
                    fprintf('Invalid choice. Please enter a valid option (1-4).\n');
            end
        case 6
            fprintf('Exiting the program.\n');
            break;
        otherwise
            fprintf('Invalid choice. Please enter a valid option (1-6).\n');
    end
end
% Automatically select a region of interest (ROI) using image processing
% Convert the input image to the Lab color space
labImage = rgb2lab(inputImage);
figure;
imshow(labImage);
title('LAB Image');

aThreshold = labImage(:, :, 2) > 0; 
bThreshold = labImage(:, :, 3) > 0; 

% Combine the thresholds to create a mask
roiMask = aThreshold & bThreshold;

% Use the mask to extract the ROI from the input image
croppedRegion = inputImage;
croppedRegion(repmat(~roiMask, [1, 1, 3])) = 0;

% Display the cropped region
figure;
imshow(croppedRegion);
title('Cropped Image');
