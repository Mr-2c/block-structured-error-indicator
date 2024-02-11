%% function name:           OF_BFS_readGridOriginal_v100
%% function use:            read structured grid coordinates
%% format of the files:     float, little endian, without any header, ordered
%% date:                    Sep 19, 2016

%% Input:       filename: file name of the grid
%% Ouput:       XYZ_original: 2D array of coorinates with size (Nxyz,3)

function XYZ_original = OF_BFS_readGridOriginal_v100(filename)

%%
fileID = fopen(filename,'r','l');
XYZ_original = fread(fileID,'float');
fclose(fileID);
clear fileID

%%
XYZ_original = reshape( XYZ_original , 3 , [] )' ;

