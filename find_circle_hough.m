
clear
close all
I = imread('00001_00001_00029.png');
%I = imlocalbrighten(I,0.8);

imshow(I)




% HOUGH 

[rows, columns] = size(I(:,:,1));
max_radi = floor(min(rows, columns)/2);
min_radi = floor(max_radi/3);

center_x = columns/2;
center_y = rows/2;

[centers, radii, metric] = imfindcircles(I,[min_radi max_radi], 'Sensitivity', 0.95);

metricStrong = 0;
centersStrong = [0 0];
radiiStrong = 0;

for i = 1:size(centers, 1)
    centers(i,:);

    dist_x = abs(centers(i,1) - center_x);
    dist_y = abs(centers(i,2) - center_y);

    if dist_x < columns/5 && dist_y < rows/5
        metricStrong = metric(i)
        centersStrong = centers(i,:)
        radiiStrong = radii(i);
        i
        break
    end
end


%metricStrong = metric(1); % Valor importante para el vector de features. y tambien max_radi





viscircles(centersStrong, radiiStrong,'EdgeColor','b');


