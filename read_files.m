clc
clear

DATA = []

D = '~/Documents/Imatges-20201231/Train/'
S = dir(fullfile(D, '*'));
N = setdiff({S([S.isdir]).name}, {'.','..'}); % list of subfolders of D.
for ii = 1:numel(N)
    T = dir(fullfile(D, N{ii}, '*29.png')); 
    T = [T; dir(fullfile(D, N{ii}, '*15.png'))];
    T = [T; dir(fullfile(D, N{ii}, '*01.png'))];
    
    C = {T(~[T.isdir]).name}; % files in subfolder.
    for jj = 1:numel(C)
        F = fullfile(D, N{ii}, C{jj})
        
        % do whatever with file F.
    end
end

