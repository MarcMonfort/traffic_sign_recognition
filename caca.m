clc;
clear;

I = imread('00018_00020_00024.png');
imshow(I)

% HOUGH 



[L,Centers] = imsegkmeans(I,10);

X= histogram(L)

