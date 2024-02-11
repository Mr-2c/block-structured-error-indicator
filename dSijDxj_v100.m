%% takes the dovergence of the symmetric tensor Sij, which is casted in 6 different components
%% dSij/dxj = div(S) = div*S(i,:)

%% correspondence between 6 component and i,j representation
%% i,j: k

%% 1,1: 1
%% 1,2: 2
%% 1,3: 3

%% 2,1: 2
%% 2,2: 4
%% 2,3: 5

%% 3,1: 3
%% 3,2: 5
%% 3,3: 6

%%
function F = dSijDxj_v100( divOperator , Sij )

%%
F(:,1) = divOperator * reshape( Sij(:,[1,2,3]) ,[],1 );
F(:,2) = divOperator * reshape( Sij(:,[2,4,5]) ,[],1 );
F(:,3) = divOperator * reshape( Sij(:,[3,5,6]) ,[],1 );