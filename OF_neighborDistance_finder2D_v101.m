%% XYZ_neighbors_vector: index of the point in the vector
%% XYZ_distance_vector: distance between the points in physical space

function [ XY_neighbors_vector , XY_distance_vector ] = ...
    OF_neighborDistance_finder2D_v101( XY_available , XYVector2Matrix , X,Y , iX,iY ,max_dist )

Nx = length(X);
Ny = length(Y);
Ntot = sum(sum(XY_available));
XY_neighbors_vector = zeros( Ntot,4 );
XY_distance_vector = zeros( Ntot,4 );
for i=1:Ntot
    ix = iX(i);
    iy = iY(i);
    
    
    for i1 = (ix+1):Nx
        if XY_available(i1,iy)
            XY_neighbors_vector(i,2)=XYVector2Matrix(i1,iy);
            XY_distance_vector(i,2)=X(i1)-X(ix);
            break
        end
    end
    
    for i_1 = (ix-1):-1:1
        if XY_available(i_1,iy)
            XY_neighbors_vector(i,1)=XYVector2Matrix(i_1,iy);
            XY_distance_vector(i,1)=X(ix)-X(i_1);
            break
        end
    end
    
    for j1 = (iy+1):Ny
        if XY_available(ix,j1)
            XY_neighbors_vector(i,4)=XYVector2Matrix(ix,j1);
            XY_distance_vector(i,4)=Y(j1)-Y(iy);
            break
        end
    end
    for j_1 = (iy-1):-1:1
        if XY_available(ix,j_1)
            XY_neighbors_vector(i,3)=XYVector2Matrix(ix,j_1);
            XY_distance_vector(i,3)=Y(iy)-Y(j_1);
            break
        end
    end
    
end

%%
IwoDistance = XY_distance_vector > max_dist ;

%%
XY_distance_vector(IwoDistance) = 0 ;
XY_neighbors_vector(IwoDistance) = 0 ;