function UiUj = nonlin2vvS_v100(UiUjtmp,U)

%%
ind1 = [1,1,1 , 2,2 , 3];
ind2 = [1,2,3 , 2,3 , 3];

%%
UiUj = UiUjtmp - U(:,ind1,:) .* U(:,ind2,:);