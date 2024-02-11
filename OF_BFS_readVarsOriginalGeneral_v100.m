%% function name:           OF_BFS_readVars_v100
%% function use:            read filed associated with a structured grid
%% format of the files:     float, little endian, without any header, ordered as (u,v,w,p) changing orderly in zyx
%% date:                    Sep 9, 2016

%% Input:       filename: file name of the grid
%%              sizeVars: structure of the data, would be (Nx,Ny,Nz,4) if 4 primitive varibles
%% Ouput:       Vars: 4D array of fileds with size (Nx,Ny,Nz,4)

function Vars = OF_BFS_readVarsOriginalGeneral_v100(filename,numVars)

%%
fileID = fopen(filename,'r','l');
Vars = fread(fileID,'float');
fclose(fileID);

%%
Vars = reshape( Vars , numVars , [] )' ;
