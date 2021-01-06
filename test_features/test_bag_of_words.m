clc
clear
close all

% Dataset
unzip('MerchData.zip');

% setDir  = fullfile(toolboxdir('vision'),'visiondata','imageSets');
% imds = imageDatastore(setDir,'IncludeSubfolders',true,'LabelSource',...
%     'foldernames');


imds = imageDatastore('MerchData','IncludeSubfolders',true,'LabelSource','foldernames');


% D = '~/Documents/MATLAB/Imatges-20201122/Train/'
% setDir  = fullfile(D);
% imds = imageDatastore(setDir,'IncludeSubfolders',true,'LabelSource','foldernames');

tbl = countEachLabel(imds)



% Bag of Features


figure
montage(imds.Files(1:16:end))


[trainingSet, validationSet] = splitEachLabel(imds, 0.6, 'randomize');


bag = bagOfFeatures(trainingSet);


img = readimage(imds, 1);
featureVector = encode(bag, img);

% Plot the histogram of visual word occurrences
figure
bar(featureVector)
title('Visual word occurrences')
xlabel('Visual word index')
ylabel('Frequency of occurrence')

categoryClassifier = trainImageCategoryClassifier(trainingSet, bag);


confMatrix = evaluate(categoryClassifier, validationSet);
