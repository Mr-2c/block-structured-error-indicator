function UiRjk = UiRjk_v100(U,Rij)

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
UiRjk = zeros( size(U,1) , 27);
for i=1:27
    UiRjk(:,i) = U(:,ind1(i)) .* Rij(:,ind2(i),ind3(i)) ;
end