function [indPoints , iIndwoN , iIndwoNx,iIndwoNy] = OF_BFS_Inds2D_v100(XY_neighbors)

%%
indPoints = (1:length(XY_neighbors))' ;
iIndwoN = XY_neighbors==0 ; %sum(iIndwoN_up)
iIndwoNx = iIndwoN(:,1) | iIndwoN(:,2) ; %sum(iIndwoNx_up)
iIndwoNy = iIndwoN(:,3) | iIndwoN(:,4) ; %sum(iIndwoNy_up)