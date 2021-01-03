clc
clear

DATA = [0 0]

D = '~/Documents/MATLAB/Imatges-20201122/Train/'
S = dir(fullfile(D, '*'));
N = setdiff({S([S.isdir]).name}, {'.','..'}); % list of subfolders of D.
for ii = 1:numel(N)
    T = dir(fullfile(D, N{ii}, '*29.png')); 
    T = [T; dir(fullfile(D, N{ii}, '*15.png'))];
    T = [T; dir(fullfile(D, N{ii}, '*01.png'))];
    
    C = {T(~[T.isdir]).name}; % files in subfolder.
    for jj = 1:numel(C)
        F = fullfile(D, N{ii}, C{jj});
        
        I = imread(F);
        
        DATA = [DATA; getCircle(I) num2circle(str2num(N{ii}))];
        % do whatever with file F.
    end
end

