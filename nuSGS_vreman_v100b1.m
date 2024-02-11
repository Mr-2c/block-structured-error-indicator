function nuSGS_vreman_wholeDomain = nuSGS_vreman_v100b1( gradU_wholeDomain , dX_original_up ) 

%% because of Vreman's definition of alphaIJ 
alphaIJ = permute( gradU_wholeDomain , [1 3 2] ) ;

%%
AijAij = sum( sum( alphaIJ.^2 , 3 ) , 2 ) ;

%%
for i=1:3
    for j=1:3
        betaIJ(:,i,j) = sum( dX_original_up.^2 .* alphaIJ(:,:,i) .* alphaIJ(:,:,j) , 2) ;
    end
end

%%
B_beta =    betaIJ(:,1,1) .* betaIJ(:,2,2) - betaIJ(:,1,2).^2 + ...
            betaIJ(:,1,1) .* betaIJ(:,3,3) - betaIJ(:,1,3).^2 + ...
            betaIJ(:,2,2) .* betaIJ(:,3,3) - betaIJ(:,2,3).^2 ;
        
%%
nuSGS_vreman_wholeDomain = 0.07 * sqrt( B_beta ./ AijAij ) ;