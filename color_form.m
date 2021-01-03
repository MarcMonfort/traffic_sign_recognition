clc
close all

I = imread('00001_00001_00029.png');
figure; imshow(I)

hsv = rgb2hsv(I);
h = hsv(:, :, 1);
s = hsv(:, :, 2);
v = hsv(:, :, 3);

RED = (h < 30/360 | h > 315/360) & (s > 0.2);
BLUE = (h > 170/360 & h < 250/360) & (s > 0.2);

BW = RED;

%GOD = imerode(GOD, strel('square',2));

figure; imshow(BW)

CC = bwconncomp(BW);


% HOUGH 

[rows, columns] = size(BW);
max_radi = floor(min(rows, columns)/2);
min_radi = floor(max_radi/3)

[centers, radii, metric] = imfindcircles(I,[min_radi max_radi], 'Sensitivity', 0.99);

centersStrong5 = centers(1,:); 
radiiStrong5 = radii(1);
metricStrong5 = metric(1);


viscircles(centersStrong5, radiiStrong5,'EdgeColor','b');


