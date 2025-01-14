clc
clear
close all

img = imread('00002_00002_00029.png');

% Extract HOG features and HOG visualization
[hog_2x2, vis2x2] = extractHOGFeatures(img,'CellSize',[2 2]);
[hog_4x4, vis4x4] = extractHOGFeatures(img,'CellSize',[4 4]);
[hog_8x8, vis8x8] = extractHOGFeatures(img,'CellSize',[8 8]);

% Show the original image
figure; 
subplot(2,3,1:3); imshow(img);

% Visualize the HOG features
subplot(2,3,4);  
plot(vis2x2); 
title({'CellSize = [2 2]'});

subplot(2,3,5);
plot(vis4x4); 
title({'CellSize = [4 4]'});

subplot(2,3,6);
plot(vis8x8); 
title({'CellSize = [8 8]'});