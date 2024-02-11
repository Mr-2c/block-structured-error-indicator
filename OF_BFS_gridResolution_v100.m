function dX_original = OF_BFS_gridResolution_v100( XYZ_distance , XYZ_neighbors ,  iIndwoN )

dX_original = zeros( length(XYZ_distance) , 3) ;
for i=1:3
    dX_original(:,i) = mean( XYZ_distance(:,(2*i-1):2*i) , 2 ) ;
    dX_original( iIndwoN(:,2*i-1) , i) = dX_original( XYZ_neighbors(iIndwoN(:,2*i-1),2*i) , i) ;
    dX_original( iIndwoN(:,2*i) , i) = dX_original( XYZ_neighbors(iIndwoN(:,2*i),2*i-1) , i) ;
end