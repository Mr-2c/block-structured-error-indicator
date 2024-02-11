%% XYZ_neighbors_vector: index of the point in the vector
%% XYZ_distance_vector: distance between the points in physical space

function [ XYZ_neighbors_vector , XYZ_distance_vector ] = ...
    OF_neighborDistance_finder_v101( XYZ_available , XYZVector2Matrix , X,Y,Z , iX,iY,iZ ,max_dist )

Nx = length(X);
Ny = length(Y);
Nz = length(Z);
Ntot = sum(sum(sum(XYZ_available)));
XYZ_neighbors_vector = zeros( Ntot,6 );
XYZ_distance_vector = zeros( Ntot,6 );
for i=1:Ntot
    ix = iX(i);
    iy = iY(i);
    iz = iZ(i);
    
    
    for i1 = (ix+1):Nx
        if XYZ_available(i1,iy,iz)
            XYZ_neighbors_vector(i,2)=XYZVector2Matrix(i1,iy,iz);
            XYZ_distance_vector(i,2)=X(i1)-X(ix);
            break
        end
    end
    
    for i_1 = (ix-1):-1:1
        if XYZ_available(i_1,iy,iz)
            XYZ_neighbors_vector(i,1)=XYZVector2Matrix(i_1,iy,iz);
            XYZ_distance_vector(i,1)=X(ix)-X(i_1);
            break
        end
    end
    
    for j1 = (iy+1):Ny
        if XYZ_available(ix,j1,iz)
            XYZ_neighbors_vector(i,4)=XYZVector2Matrix(ix,j1,iz);
            XYZ_distance_vector(i,4)=Y(j1)-Y(iy);
            break
        end
    end
    for j_1 = (iy-1):-1:1
        if XYZ_available(ix,j_1,iz)
            XYZ_neighbors_vector(i,3)=XYZVector2Matrix(ix,j_1,iz);
            XYZ_distance_vector(i,3)=Y(iy)-Y(j_1);
            break
        end
    end
    
    for k1 = (iz+1):Nz
        if XYZ_available(ix,iy,k1)
            XYZ_neighbors_vector(i,6)=XYZVector2Matrix(ix,iy,k1);
            XYZ_distance_vector(i,6)=Z(k1)-Z(iz);
            break
        end
    end
    for k_1 = (iz-1):-1:1
        if XYZ_available(ix,iy,k_1)
            XYZ_neighbors_vector(i,5)=XYZVector2Matrix(ix,iy,k_1);
            XYZ_distance_vector(i,5)=Z(iz)-Z(k_1);
            break
        end
    end
    
end

%%
IwoDistance = XYZ_distance_vector > max_dist ;

%%
XYZ_distance_vector(IwoDistance) = 0 ;
XYZ_neighbors_vector(IwoDistance) = 0 ;