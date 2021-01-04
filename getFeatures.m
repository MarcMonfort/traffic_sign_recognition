function [features] = getFeatures(image)
    I = image;

    features = [getCircle(I)];
    
    features = [features getColorFeature(I)];
    
    
end


