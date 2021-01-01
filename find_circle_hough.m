clc;
clear;
I = imread('00014_00020_00001.png');
imshow(I)

% HOUGH 

[rows, columns] = size(I);
max_radi = floor(min(rows, columns)/2);
min_radi = floor(max_radi/3)

[centers, radii, metric] = imfindcircles(I,[min_radi max_radi], 'Sensitivity', 0.99);

centersStrong5 = centers(1,:); 
radiiStrong5 = radii(1);
metricStrong5 = metric(1); % Valor importante para el vector de features. y tambien max_radi


viscircles(centersStrong5, radiiStrong5,'EdgeColor','b');

