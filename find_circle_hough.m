function [metricStrong, max_radi] = find_circle_hough(File)%File must be an image
    I = imread(File);
    %figure; imshow(I)
     % HOUGH 

    [rows, columns] = size(I);
    max_radi = floor(min(rows, columns)/2);
    min_radi = floor(max_radi/3);

    [centers, radii, metric] = imfindcircles(I,[min_radi max_radi], 'Sensitivity', 0.99);

    %centersStrong = centers(1,:); 
    %radiiStrong = radii(1);
    if isempty(radii)
        metricStrong = 0;
    else
        metricStrong = metric(1); % Valor importante para el vector de features. y tambien max_radi
    end
    

    %viscircles(centersStrong, radiiStrong,'EdgeColor','b');
end