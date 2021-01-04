function [pRed, pBlue, pYellow] = color_histogram(File)%File must be an image
    I = imread(File);
    %figure; imshow(I)

    hsv = rgb2hsv(I);
    h = hsv(:, :, 1);
    s = hsv(:, :, 2);
    v = hsv(:, :, 3);

    RED = (h < 15/360 | h > 345/360) & (s > 0.3);
    BLUE = (h > 200/360 & h < 230/360) & (s > 0.5);
    YELLOW = (h > 25/360 & h < 50/360) & (s > 0.5);

    BW = BLUE;


    numPixel = numel(BLUE);

    pRed = sum(RED(:) / numPixel);
    pBlue = sum(BLUE(:) / numPixel);
    pYellow = sum(YELLOW(:) / numPixel);



    %GOD = imerode(GOD, strel('square',2));

    %figure; imshow(BW)


end

