function [ XYZ_neighbors , XYZ_distance ] = ...
        OF_neighborDistance_replicaForChannel_v100b2( XYZVector2Matrix , X,Y,Z)
    
    
%%
NormalPlane{1} = zeros( 1 , length(Y) , length(Z) ) ;
NormalPlane{2} = zeros( length(X) , 1 , length(Z) ) ;
NormalPlane{3} = zeros( length(X) , length(Y) , 1 ) ;

%%
dX = dX_v100(X) ;
dZ = dX_v100(Z) ;
% 
% M = [ diag( .5*ones(length(Y)-2,1) , 0 ) , zeros(length(Y)-2,1) ]  + diag( .5*ones(length(Y)-2,1) , 1 ) ;
% dY = diag(.%ones
dY = dX_v100(Y) ;


% dX = X(2:end) - X(1:end-1) ;
% dY = Y(2:end) - Y(1:end-1) ;
% dZ = Z(2:end) - Z(1:end-1) ;

[DX{1},~,~] = ndgrid( dX                , (1:length(Y))'    , (1:length(Z))');
[~,DX{2},~] = ndgrid( (1:length(X))'    , dY                , (1:length(Z))');
[~,~,DX{3}] = ndgrid( (1:length(X))'    , (1:length(Y))'    , dZ            );
 

%%
XYZ_neighbors_tmp(:,:,:,1) = circshift( XYZVector2Matrix ,  1 , 1 ) ;
XYZ_neighbors_tmp(:,:,:,2) = circshift( XYZVector2Matrix , -1 , 1 ) ;

XYZ_neighbors_tmp(:,:,:,3) = cat( 2 , NormalPlane{2} , XYZVector2Matrix(:,1:end-1,:)) ;
XYZ_neighbors_tmp(:,:,:,4) = cat( 2 , XYZVector2Matrix(:,2:end,:) , NormalPlane{2} ) ;

XYZ_neighbors_tmp(:,:,:,5) = circshift( XYZVector2Matrix ,  1 , 3 ) ;
XYZ_neighbors_tmp(:,:,:,6) = circshift( XYZVector2Matrix , -1 , 3 ) ;

%%
for i=1:6
    XYZ_neighbors(:,i) = reshape( XYZ_neighbors_tmp(:,:,:,i) , [] , 1 ) ;
end

%%
for i=1:3
%     XYZ_distance_tmp(:,:,:,2*(i-1)+1) = cat( i , NormalPlane{i} , DX{i} ) ;
%     XYZ_distance_tmp(:,:,:,2*(i-1)+2) = cat( i , DX{i} , NormalPlane{i} ) ;
    XYZ_distance_tmp(:,:,:,2*(i-1)+1) = circshift( DX{i} ,  1 , i ) ;
    XYZ_distance_tmp(:,:,:,2*(i-1)+2) = circshift( DX{i} , -1 , i ) ;
    
end

%%
for i=1:6
    XYZ_distance(:,i) = reshape(XYZ_distance_tmp(:,:,:,i) , [],1 ) ;
end

