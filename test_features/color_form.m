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





