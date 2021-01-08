function [hog_vector] = getHogFeature(img)

    % Image to same size 128x128
    [rows, columns] = size(img(:,:,1));

    if rows > columns

        dif = rows - columns;
        img = imcrop(img, [0, dif/2, columns, columns-1]);

    elseif columns > rows

        dif = columns - rows;
        img = imcrop(img, [dif/2, 0, rows-1, rows]);

    end

    img = imresize(img, [128, 128]);
    
    
    
    % Get HOG fetures
    
    hog_vector = extractHOGFeatures(img,'CellSize',[16 16]);

end