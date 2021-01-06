function [features] = getFeatures(image)
    I = image;

    features = [];
    
    %features = [features getCircleFeature(I)];
    
    features = [features getColorFeature(I)];
    
    %features = [features getHogFeature(I)];

    
    
    
    
end


