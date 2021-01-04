function [features] = getFeatures(image)
    I = image;

    features = [getCircleFeature(I)];
    
    features = [features getColorFeature(I)];
    
    
end


