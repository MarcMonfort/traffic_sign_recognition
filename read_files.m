clc
clear

D = 'C:\Users\davis\OneDrive\Documentos\MATLAB\VC\practicax si acaso\Imatges\Train';
S = dir(fullfile(D, '*'));
N = setdiff({S([S.isdir]).name}, {'.','..'}); % list of subfolders of D.
im = 0;
DATA = zeros(3920, 6, 'double');
for ii = 1:numel(N)
    T = dir(fullfile(D, N{ii}, '*29.png')); 
    T = [T; dir(fullfile(D, N{ii}, '*15.png'))];
    T = [T; dir(fullfile(D, N{ii}, '*01.png'))];
    
    C = {T(~[T.isdir]).name}; % files in subfolder.
    for jj = 1:numel(C)
        im = im + 1;
        F = fullfile(D, N{ii}, C{jj});
        sign = str2num(['double(',N{ii},')']);
        [R,B,Y] = color_histogram(F);
        [metric, maxRadi] = find_circle_hough(F);
        DATA(im,:) = [R, B, Y, metric, maxRadi, double(sign)];        
    end
end

DATA
