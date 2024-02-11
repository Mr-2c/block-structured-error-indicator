%% Finds and returns index of the original grid points

%% XYZ_available:       3D rational matrix with 1 where grid point is from the original simulation and 0 elsewhere.
%% XYZVector2Matrix:    3D matrix with the index of the original points where there was a point and zero elsewhere.
%% iX,iY,iZ:            column vectors storing the location of each original point in the 3D matrix.

%% XYZ_up_original:     original grid points as an N*3 matrix (column 1 is x, etc.)
%% X_up,Y_up,Z_up:      coordinates of the corresponding structured grid

function [ XY_available , XYVector2Matrix , iX,iY ] = ...
    OF_originalGridFinder2D_v100( XY_original , X,Y )

%%
XY_available = false( length(X) , length(Y) ) ;
XYVector2Matrix = zeros( length(X) , length(Y) );
iX = zeros( length(XY_original) ,1 ) ;
iY = zeros( length(XY_original) ,1 ) ;
for i=1:length(XY_original)
    [~,~,iX(i)]=intersect(XY_original(i,1),X) ;
    [~,~,iY(i)]=intersect(XY_original(i,2),Y) ;
    XY_available(iX(i),iY(i)) = true ;
    XYVector2Matrix(iX(i),iY(i)) = i ;
end