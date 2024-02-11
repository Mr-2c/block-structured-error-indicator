function RS_TMean = RSOriginal_v100( RStmp_TMean , Vars_TMean )

%%
RS_TMean(:,1:3) = RStmp_TMean(:,1:3) - Vars_TMean(:,1:3).^2 ;
RS_TMean(:,4:6) = RStmp_TMean(:,4:6) - Vars_TMean(:,[1,1,2]) .* Vars_TMean(:,[2,3,3]) ;
% RS_ZTMean(:,:,5) = RStmp_ZTMean(:,:,5) - Vars_ZTMean(:,:,1) .* Vars_ZTMean(:,:,3) ;
% RS_ZTMean(:,:,6) = RStmp_ZTMean(:,:,6) - Vars_ZTMean(:,:,2) .* Vars_ZTMean(:,:,3) ;

