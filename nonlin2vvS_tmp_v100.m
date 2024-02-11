function ViVj = nonlin2vvS_tmp_v100(V1,V2)

%%
ind1 = [1,1,1 , 2,2 , 3];
ind2 = [1,2,3 , 2,3 , 3];

%%
ViVj = V1(:,ind1) .* V2(:,ind2) ;