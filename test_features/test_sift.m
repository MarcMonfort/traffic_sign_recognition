clc
clear
close all

original = imread('cameraman.tif');
figure;
imshow(original);

scale = 1.3;
J = imresize(original,scale);
theta = 31;
distorted = imrotate(J,theta);
figure
imshow(distorted)

ptsOriginal  = detectSURFFeatures(original);
ptsDistorted = detectSURFFeatures(distorted);


[featuresOriginal,validPtsOriginal] = ...
            extractFeatures(original,ptsOriginal);
[featuresDistorted,validPtsDistorted] = ...
            extractFeatures(distorted,ptsDistorted);
        
        
indexPairs = matchFeatures(featuresOriginal,featuresDistorted);


matchedOriginal  = validPtsOriginal(indexPairs(:,1));
matchedDistorted = validPtsDistorted(indexPairs(:,2));

figure
showMatchedFeatures(original,distorted,matchedOriginal,matchedDistorted)
title('Candidate matched points (including outliers)')

[tform, inlierIdx] = estimateGeometricTransform2D(matchedDistorted, matchedOriginal,'similarity');
inlierDistorted  = matchedDistorted(inlierIdx, :);
inlierOriginal   = matchedOriginal(inlierIdx, :);
