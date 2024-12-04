% Read the image from a file
img = imread('Black_cat_eye.jpg');

% Define the maximum intensity level
L = 256;
% Calculate the scaling factor 'c' to make the log transformed pixel values 
% span the range of 256 grayscale levels
c = (L - 1) / log(double(max(img(:)) + 1));
% Apply log transformation to the image and scale it using 'c'
log_T = log(double(img) + 1) .* c;
% Convert the log-transformed image back to 8-bit unsigned integers
log_Ts = uint8(log_T);

% Apply gamma correction with a gamma value of 2 to the log-transformed image
gamma_corrected = imadjust(log_Ts, [], [], 2);

% Display the original, log-transformed, and gamma-corrected images in a figure
figure;
% Display the original image in the first subplot
subplot(2, 2, [1,2]);
imshow(img);
title('Original Image');

% Display the log-transformed image in the second subplot
subplot(2, 2, 3);
imshow(log_Ts);
title('Log Transformed');

% Display the gamma-corrected image in the third subplot
subplot(2, 2, 4);
imshow(gamma_corrected);
title('Gamma Corrected = 2');

% Save the log-transformed image to a file
imwrite(log_Ts, 'Log_Transformed.jpg');
% Save the gamma-corrected image to a file
imwrite(gamma_corrected, 'Gamma_Corrected.jpg');