function UiUjUk = UiUjUk_tmp_v100(U)

%%
O1 = ones(1,9) ; 
O2 = (1:3)' ;

%%
IndMat = O2 * O1 ;

%%
ind1 = reshape(IndMat',[],1);
ind3 = reshape(IndMat,[],1);
ind2 = reshape( reshape(IndMat',3,[])' ,[],1) ;

%%
UiUjUk = U(:,ind1) .* U(:,ind2) .* U(:,ind3) ;