function [indPoints , iIndwoN , iIndwoNx,iIndwoNy,iIndwoNz] = OF_BFS_Inds_v100(XYZ_neighbors)

%%
indPoints = (1:length(XYZ_neighbors))' ;
iIndwoN = XYZ_neighbors==0 ; %sum(iIndwoN_up)
iIndwoNx = iIndwoN(:,1) | iIndwoN(:,2) ; %sum(iIndwoNx_up)
iIndwoNy = iIndwoN(:,3) | iIndwoN(:,4) ; %sum(iIndwoNy_up)
iIndwoNz = iIndwoN(:,5) | iIndwoN(:,6) ; %sum(iIndwoNz_up)