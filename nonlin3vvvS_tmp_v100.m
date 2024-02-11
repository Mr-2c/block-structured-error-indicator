%% UiUjUk in the order k,j,i; i.e. 111, 112, 113, 121, 122, 123, 131, 132, 133, ...
%% v2.00: reduced to the 10 different components

function ViVjVk = nonlin3vvvS_tmp_v100(V1,V2,V3)

%%
ind1 = [1,1,1 , 1,1,1 , 2,2,2 , 3];
ind3 = [1,1,1 , 2,2,3 , 2,2,3 , 3];
ind2 = [1,2,3 , 2,3,3 , 2,3,3 , 3];

%%
ViVjVk = V1(:,ind1) .* V2(:,ind2) .* V3(:,ind3) ;
