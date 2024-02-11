%% Finds and returns index of the original grid points

%% XYZ_available:       3D rational matrix with 1 where grid point is from the original simulation and 0 elsewhere.
%% XYZVector2Matrix:    3D matrix with the index of the original points where there was a point and zero elsewhere.
%% iX,iY,iZ:            column vectors storing the location of each original point in the 3D matrix.

%% XYZ_up_original:     original grid points as an N*3 matrix (column 1 is x, etc.)
%% X_up,Y_up,Z_up:      coordinates of the corresponding structured grid

function [ XYZ_available , XYZVector2Matrix , iX,iY,iZ ] = ...
    OF_originalGridFinder_v100( XYZ_original , X,Y,Z )

%%
XYZ_available = false( length(X) , length(Y) , length(Z) ) ;
XYZVector2Matrix = zeros( length(X) , length(Y) , length(Z) );
iX = zeros( length(XYZ_original) ,1 ) ;
iY = zeros( length(XYZ_original) ,1 ) ;
iZ = zeros( length(XYZ_original) ,1 ) ;
tic
for i=1:length(XYZ_original)
    for pp=1:10
        if i==floor(pp*length(XYZ_original)/10)
            disp([ num2str(pp*10) ' percent ...' ])
        end
    end
    [~,~,iX(i)]=intersect(XYZ_original(i,1),X) ;
    [~,~,iY(i)]=intersect(XYZ_original(i,2),Y) ;
    [~,~,iZ(i)]=intersect(XYZ_original(i,3),Z) ;
    XYZ_available(iX(i),iY(i),iZ(i)) = true ;
    XYZVector2Matrix(iX(i),iY(i),iZ(i)) = i ;
end