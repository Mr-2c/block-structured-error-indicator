function UiVj = nonlin2vvA_tmp_v101(U,V)

UiVj = U(:,[1,1,1,2,2,2,3,3,3],:) .* V(:,[1,2,3,1,2,3,1,2,3],:);