function [metricStrong] = getCircleFeature(image)
    I = image;
       
    
    % HOUGH 

    [rows, columns] = size(I(:,:,1));
    max_radi = floor(min(rows, columns)/2);
    min_radi = floor(max_radi/3);

    center_x = columns/2;
    center_y = rows/2;

    [centers, radii, metric] = imfindcircles(I,[min_radi max_radi], 'Sensitivity', 0.95);

    metricStrong = 0;

    for i = 1:size(centers, 1)
        dist_x = abs(centers(i,1) - center_x);
        dist_y = abs(centers(i,2) - center_y);

        if dist_x < columns/5 && dist_y < rows/5
            metricStrong = metric(i);
            break
        end
    end

    
    
end


