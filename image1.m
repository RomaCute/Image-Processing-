% Read the image from a file
Image = imread('Brightened_Cat.jpg');

% Preallocate an array for the filtered image
filtered_img = zeros(size(Image), 'like', Image);

% Apply median filter to each color channel
for k = 1:size(Image, 3)
    filtered_img(:,:,k) = medfilt2(double(Image(:,:,k)), [3 3]);
end

% Convert the filtered image back to the original class type
filtered_img = im2uint8(filtered_img);

% Apply gamma correction to enhance the image
% gammaValue is the gamma correction factor
gammaValue = 1.75;
gamma_corrected = imadjust(filtered_img, [], [], gammaValue);

% Enhance contrast using histogram equalization
sharpened_img = imsharpen(gamma_corrected);

% Display the original and enhanced images in a figure window
figure;
% Display the original image in the first subplot
subplot(2, 2, 1), imshow(Image), title('Original Image');
% Display the median filtered image in the second subplot
subplot(2,2,2), imshow(filtered_img), title('Filtered Image'); 
% Display the gamma-corrected image in the third subplot
subplot(2,2,3), imshow(gamma_corrected), title('Gamma Corrected Image');
% Display the sharpened image in the fourth subplot
subplot(2,2,4), imshow(sharpened_img), title('Sharpened Image');

% Save the median filtered image to a file
imwrite(filtered_img, 'Filtered.jpg');
% Save the gamma-corrected image to a file
imwrite(gamma_corrected, 'Gamma_Corrected.jpg');
% Save the sharpened image to a file
imwrite(sharpened_img, 'Sharpened.jpg');