function [class] = classify_traffic_sign(img)

    load('traffic_sign_classifier.mat');
    
    features = [getColorFeature(img) getHogFeature(img)];
    class = predict(classifier, features);
    
    subplot(1,2,1);
    imshow(img);
    title('Possible Traffic Sign')

    subplot(1,2,2);    
    detected = imread(join( [char(class), '.png'] ) );
    imshow(detected);
    title('Detected Traffic Sign')

end