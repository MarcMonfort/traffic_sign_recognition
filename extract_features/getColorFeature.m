function [feature] = getColorFeature(image)
    I = image;
    hsv = rgb2hsv(I);
    h = hsv(:, :, 1);
    s = hsv(:, :, 2);
    v = hsv(:, :, 3);

    RED = (h < 15/360 | h > 345/360) & (s > 0.3);
    BLUE = (h > 200/360 & h < 230/360) & (s > 0.5);
    YELLOW = (h > 25/360 & h < 50/360) & (s > 0.5);
    BLACK = (v < 0.15);

    numPixel = numel(I(:,:,1));

    pRed = sum(RED(:) / numPixel);
    pBlue = sum(BLUE(:) / numPixel);
    pYellow = sum(YELLOW(:) / numPixel);
    pBlack = sum(BLACK(:) / numPixel);

    feature = [pRed pBlue pYellow pBlack];
end


