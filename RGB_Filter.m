% Loads an image and applies a Red, Green, and Blue filter individually

clear;
clc;

% Manual filePath and file can be done here
% filePath = "C:\Users";
% fileName = "Original.jpg";

% Gets the file name and path
[fileName, filePath] = uigetfile();
if (filePath == 0)
    return;
end

% Set the the entire string path
fileFullName = fullfile(filePath, fileName);
array = im2double(imread(fileFullName));

% Create 3 separate identical arrays
array_red = array;
array_green = array;
array_blue = array;

% Converts the partical matrix into 0, removing the R, G, or B
array_red(:, :, 1) = 0;
array_green(:, :, 2) = 0;
array_blue(:, :, 3) = 0;

% Plots the original image along with the 3 filtered
figure;
% tight_subplot used to make the plots visually closer
[ha, pos] = tight_subplot(2, 2,[.01 0], 0.03);

axes(ha(1));
imshow(array);

axes(ha(2));
imshow(array_red)

axes(ha(3));
imshow(array_green)

axes(ha(4));
imshow(array_blue)
