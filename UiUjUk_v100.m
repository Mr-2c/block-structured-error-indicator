function UiUjUk = UiUjUk_v100(UiUjUk_tmp1,U,RS)

%%
for i=1:size(UiUjUk_tmp1,3)
    UiUjUk_tmp2(:,:,i) = UiUjUk_tmp_v100(U(:,:,i));
end

%%
Rij = RS(:,[1,4,5,4,2,6,5,6,3],:);
Rij = reshape(Rij,size(Rij,1),3,3,size(RS,3));

%%
for i=1:size(UiUjUk_tmp1,3)
    UiRjk(:,:,i) = UiRjk_v100(U(:,:,i),Rij(:,:,:,i));
end

%%
UiUjUk_tmp1 = reshape(UiUjUk_tmp1 , size(UiUjUk_tmp1,1) , 3 , 3 , 3 , size(UiUjUk_tmp1,3) ) ;
UiUjUk_tmp2 = reshape(UiUjUk_tmp2 , size(UiUjUk_tmp2,1) , 3 , 3 , 3 , size(UiUjUk_tmp2,3) ) ;
UiRjk = reshape(UiRjk , size(UiRjk,1) , 3 , 3 , 3 , size(UiRjk,3) ) ;

%%
UiUjUk = UiUjUk_tmp1 - UiUjUk_tmp2 - UiRjk - permute(UiRjk,[1,3,4,2,5]) - permute(UiRjk,[1,4,2,3,5]) ;

%%
UiUjUk = reshape(UiUjUk, size(UiUjUk,1),27,[]);