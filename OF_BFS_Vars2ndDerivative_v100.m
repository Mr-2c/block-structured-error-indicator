function [ D2Vars_Dx2 , D2Vars_Dy2 , D2Vars_Dz2 ] = ...
    OF_BFS_Vars2ndDerivative_v100( Vars , D2x_operator,D2y_operator,D2z_operator , ...
    XYZ_neighbors , iIndwoN )

%%
D2Vars_Dx2 = D2x_operator * Vars ; 
D2Vars_Dx2( iIndwoN(:,1) , : ) = D2Vars_Dx2( XYZ_neighbors(iIndwoN(:,1),2) ,:);
D2Vars_Dx2( iIndwoN(:,2) , : ) = D2Vars_Dx2( XYZ_neighbors(iIndwoN(:,2),1) ,:);

D2Vars_Dy2 = D2y_operator * Vars ; 
D2Vars_Dy2( iIndwoN(:,3) , : ) = D2Vars_Dy2( XYZ_neighbors(iIndwoN(:,3),4) ,:);
D2Vars_Dy2( iIndwoN(:,4) , : ) = D2Vars_Dy2( XYZ_neighbors(iIndwoN(:,4),3) ,:);

D2Vars_Dz2 = D2z_operator * Vars ; 
D2Vars_Dz2( iIndwoN(:,5) , : ) = D2Vars_Dz2( XYZ_neighbors(iIndwoN(:,5),6) ,:);
D2Vars_Dz2( iIndwoN(:,6) , : ) = D2Vars_Dz2( XYZ_neighbors(iIndwoN(:,6),5) ,:);