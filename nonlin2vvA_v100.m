function UiVj = nonlin2vvA_v100(UiVj_tmp,U,V)

%%
indU = [1,1,1 , 2,2,2 , 3,3,3] ;
indV = [1,2,3 , 1,2,3 , 1,2,3] ;

%%
UiVj = UiVj_tmp - U(:,indU,:).*V(:,indV,:);